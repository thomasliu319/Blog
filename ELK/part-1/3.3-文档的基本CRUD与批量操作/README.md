# 文档的基本CRUD与批量操作

##  课程Demo

```执行#
############Create Document############
#ceate document.自动生成_id
POST users/_doc
{
		"user" : "Mike",
		"post_date": "2019-04-15T14:12:12",
		"message" : "trying out Kibana"
}

#create document.指定Id。如果id已经存在，报错
PUT users/_doc/1?op_type=create
{
	"user" : "Jack",
	"post_date" : "2019-04-15T14:12:12",
	"message" : "trying out Elasearch"
}

#create document.指定ID如果存在，就报错
PUT users/_create/1
{
	"user" : "Jack",
	"post_date" : "2019-04-15T14:12:12",
	"message" : "trying out Elasticsearch"
}


### GET Document by ID
#Get the document by ID
GET users/_doc/1

### Index & Update
#Update 指定ID (先删除，再写入)
GET users/_doc/1

PUT users/_doc/1
{
	"user" : "Mike"
}

#GET users/_doc/1
#在原文档上增加字段
POST users/_update/1/
{
	"doc":{
		"post_date" : "2019-04-15T14:12:12",
		"message" : "trying out Elasticsearch"
	}
}


###Delete by id
#删除文档
DELETE users/_doc/1

###Delete by Id
DELETE users/_doc/1

###	Bulk 操作
#执行两次，查看每次的结果
#执行第1次
POST _bulk
{"index" : {"_index" : "test","_id" : "1"}}
{"field1" : "value1"}
{"delete" : {"_index" : "test", "_id":"2"}}
{"create" : {"_index" : "test2", "_id":"3"}}
{"field1" : "value3"}
{"update" : {"_id": "1","_index":"test"}}
{"doc":{"field2" : "value2"}}

#执行第2次
POST _bulk
{"index" : {"_index" : "test","_id" : "1"}}
{"field1" : "value1"}
{"delete" : {"_index" : "test", "_id":"2"}}
{"create" : {"_index" : "test2", "_id":"3"}}
{"field1" : "value3"}
{"update" : {"_id": "1","_index":"test"}}
{"doc":{"field2" : "value2"}}

### mget操作
GET /_mget
{
	"docs" : [
      {
					"_index" : "test",
          "_id" : "1"
      },
      {
      		"_index" : "test",
      		"_id" : "2"
      }
	]
}

#URI中指定index
GET /test/_mget
{
	"docs":[
			{
				"_id" : "1"
			},
			{
				"_id" : "2"
			}
	]
}

GET /_mget
{
		"docs"[
				{
					"_index" : "test",
					"_id" : "1",
					"_source" : false
				},
				{
					"_index" : "test",
					"_id" : "2",
					"_source" : ["field3","field4"]
				},
				{
					"_index" : "test",
					"_id" : "3",
					"_source" : {
							"include": ["user"],
							"exclude": ["user.location"]
					}
				}
		]
}


###	msearch操作
POST kibana_sample_data_ecommerce/_msearch
{}
{"query" : {"match_all" : {}},"size":1}
{"index" : "kibana_sample_data_flights"}
{"query" : {"match_all" : {}},"size":2}

### 清除测试数据
#清除数据
DELETE users
DELETE test
DELETE test2
```



## 相关阅读

- Document API https://www.elastic.co/guide/en/elasticsearch/reference/7.1/docs.html