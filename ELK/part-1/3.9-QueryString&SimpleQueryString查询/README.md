# Query &Simple String Query

##  课程 Demo

- 需导入Movie测试数据，具体参考“2.4-Logstash 安装与数据导入”

```
PUT /users/_doc/1
{
  "name":"Ruan Yiming",
  "about":"java, golang, node, swift, elasticsearch"
}

PUT /users/_doc/2
{
  "name":"Li Yiming",
  "about":"Hadoop"
}

POST users/_search
{
  "query": {
    "query_string": {
      "default_field": "name",
      "query": "Ruan AND Yiming"
    }
  }
}


POST users/_search
{
  "query": {
    "query_string": {
      "fields": ["name","about"],
      "query": "(Ruan AND Yiming) OR (Java AND Elasticsearch)"
    }
  }
}


#Simple Query 默认的Operator是 Or
POST users/_search
{
  "query":{
    "simple_query_string": {
      "query": "Ruan AND Yiming",
      "fields": ["name"]
    }
  }
}


POST users/_search
{
  "query":{
    "simple_query_string": {
      "query": "Ruan Yiming",
      "fields": ["name"],
      "default_operator": "AND"
    }
  }
}


GET /movies/_search
{
  "profile": true,
  "query":{
    "query_string": {
      "default_field": "title",
      "query": "Beatiful AND Mind"
    }
  
}


# 多fields
GET /movies/_search
{
		"profile": true,
		"query":{
				"query_string":{
					"fields":["title","year"],
					"query":"2012"
				}
		}
}



GET /movies/_search
{
  "profile": true,
  "query":{
    "query_string": {
      "fields": ["title"],
      "query": "Beautiful +Mind"
    }
  }
}

```



## 相关阅读

