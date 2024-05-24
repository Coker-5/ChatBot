from elasticsearch import Elasticsearch
es = Elasticsearch()

mapping = {
  "settings": {
    "analysis": {
      "analyzer": {
        "ik_analyzer": {
          "type": "custom",
          "tokenizer": "ik_smart"
        }
      }
    }
  },
  "mappings": {
    "properties": {
      "id": {
        "type": "integer"
      },
      "question": {
        "type": "text",
        "analyzer": "ik_analyzer"
      },
      "answer": {
        "type": "text",
        "analyzer": "ik_analyzer"
      }
    }
  }
}
es.indices.create(index="faq", body=mapping)
