import time
import requests
from elasticsearch import Elasticsearch
from flask import Flask, request, render_template, jsonify, send_from_directory
import pymysql
from langdetect import detect
import openai

app = Flask(__name__)

conn = pymysql.connect(
    host="localhost",
    user="root",
    password="root",
    database="chatbot"
)

es = Elasticsearch(['127.0.0.1'], port=9200)

api_key = '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'
openai.api_key = api_key

dialogue_history = []


def search_in_db(question):
    cursor = conn.cursor()
    print(question)
    sql = "SELECT answer FROM ru_faq WHERE question LIKE %s"
    cursor.execute(sql, (f'%{question}%',))
    conn.commit()
    result = cursor.fetchone()
    print(result)
    if result is None:
        return {"HasAnswer": False,
                "message": "Өө, би үүнийг яаж хийхээ хараахан мэдэхгүй байна. Та надад зааж өгч чадах уу?"}
    else:
        answer = "".join(result)
        return {"HasAnswer": True, "message": answer}


def elastic_search(question):
    search_term = question
    fields = ["question"]

    # 构建multi_match查询的DSL
    query = {
        "query": {
            "multi_match": {
                "query": search_term,
                "fields": fields
            }
        },
        "size": 1
    }

    result = es.search(index="faq", body=query)

    if result['hits']['total']['value'] > 0:
        hit = result['hits']['hits'][0]
        return {"HasAnswer": True, "OriginQuestion": hit['_source']['question'], "message": hit['_source']['answer']}
    else:
        return {"HasAnswer": False, "OriginQuestion": "", "message": "啊哟，这个问题我还不会呢，你可以教教我吗"}


def search_in_ai(question):
    user_input = question

    response = openai.ChatCompletion.create(
        model="gpt-3.5-turbo",
        messages=[
                     {"role": "system", "content": "You are a helpful assistant."},
                     {"role": "user", "content": user_input},
                 ] + dialogue_history
    )

    bot_reply = response['choices'][0]['message']['content']

    dialogue_history.append({"role": "user", "content": user_input})
    dialogue_history.append({"role": "system", "content": bot_reply})

    return {"success": 0, "error": 0, "question": question, "answer": bot_reply}


def text_to_speech(text):
    url = "https://api.chimege.com/v1.2/synthesize"
    headers = {
        'Content-Type': 'plain/text',
        'Token': '15318bcb34a9ac07eabd8a98470a6aa1fcf4d22d471fd482404a8ab9ae2e3382',
    }

    r = requests.post(
        url, data=text.encode('utf-8'), headers=headers)
    now_time = int(time.time())
    audio = f"{now_time}.wav"
    file_path = f"resource/chimege audio/{audio}"
    with open(file_path, 'wb') as out:
        out.write(r.content)
    return audio


def speech_to_text(audio):
    now_time = int(time.time())
    file_name = f"{now_time}.webm"
    path_name = f'resource/user audio/{file_name}'
    audio.save(path_name)

    with open(path_name, 'rb') as f:
        audio = f.read()

    r = requests.post("https://api.chimege.com/v1.2/transcribe", data=audio, headers={
        'Content-Type': 'application/octet-stream',
        'Punctuate': 'true',
        'Token': '3ef4403852dfec3020f793df33d683cb13bedae59bafe6c89a3186496e3fbe28',
    })
    message = r.content.decode("utf-8")

    return file_name, message


def detect_language(text):
    try:
        language = detect(text)
        print(language)
        if language == "ru":
            res = search_in_db(text)
            return res
        else:
            res = None
            return res
    except Exception as e:
        print(f"Error: {e}")


@app.route('/')
def index():
    return render_template("index.html")


@app.route('/get_info', methods=['post'])
def get_info():
    model = request.json['model']
    question = request.json['question']
    first_re = detect_language(question)
    if first_re != None and model == 0:
        if first_re['HasAnswer'] is True:
            response_data = {"success": 0, "error": 0, "question": question, "HasAnswer": first_re['HasAnswer'],
                             "answer": first_re['message']}
            print(response_data)
            return jsonify(response_data)
        else:
            pass
    else:
        pass

    if model == 0:
        answer = elastic_search(question)
        if answer['HasAnswer'] is True:
            response_data = {"success": 0, "error": 0, "question": question, "HasAnswer": answer['HasAnswer'],
                             "answer": answer['message']}
            print(response_data)
            return jsonify(response_data)
        else:
            response_data = {"success": 0, "error": 0, "question": question, "HasAnswer": answer['HasAnswer'],
                             "answer": answer['message']}
            print(response_data)
            return jsonify(response_data)
    else:
        answer = search_in_ai(question)
        return jsonify(answer)


@app.route('/ch')
def go_convert():
    return render_template("convert.html")


@app.route('/tts')
def tts_convert():
    text = request.args.get("text")
    result_path = text_to_speech(text)
    response_data = {"success": 0, "error": 0, "text": text, "filePath": result_path}
    return jsonify(response_data)


@app.route('/audio/<filename>')
def get_audio(filename):
    return send_from_directory('resource/chimege audio/', filename)


@app.route('/upload', methods=['POST'])
def upload():
    audio = request.files['audio']
    file_name, message = speech_to_text(audio)
    response_data = {"success": 0, "error": 0, "fileName": file_name, "result": message}
    return jsonify(response_data)


@app.route('/useraudio/<filename>')
def get_user_audio(filename):
    return send_from_directory('resource/user audio/', filename)


if __name__ == '__main__':
    app.run(port=5000, debug=True)
