import pymysql
from elasticsearch import Elasticsearch
import json

# 连接到 MySQL 数据库
connection = pymysql.connect(
    host='localhost',
    user='root',
    password='root',
    db='chatbot'
)

try:
    # 创建游标对象
    with connection.cursor() as cursor:
        # 查询数据
        query = "SELECT * FROM ansdata"
        cursor.execute(query)

        # 获取查询结果
        result = cursor.fetchall()

        # 连接到 Elasticsearch
        es = Elasticsearch(hosts="http://localhost:9200")

        # 导入数据
        for row in result:
            document = {
                'id': row[0],
                'question': row[1],
                'answer': row[2]
            }
            es.index(index='chatbot', id=row[0], body=document)

finally:
    # 关闭连接
    connection.close()
