# 使用分析器进行分词

##  课程Demo

```
#Simple Analyzer -按照非字母切分（符号被过滤），小写处理
#Stop Analyzer -小写处理，停用词过滤（the, a, is）
#whitespace Analyzer -按照空格切分，不转小写
#Keyword Analyzer -不分词，直接将输入当作输出
#Patter Analyzer -正则表达式，默认 \W+（非字符分割）
#Language -提供了30多种常见语言的分词器
#2 running Quick brown-foxes leap over lazy dogs in the summer evening

#查看不同的analyzer的效果
#standard
GET _analyze
{
	"analyzer": "standard",
	"text": "running Quick brown-foxes leap over lazy dogs in the summer evening."
}

#simple
GET _analyze
{
	"analyzer": "simple",
	"text": "running Quick brown-foxes leap over lazy dogs in the summer evening."
}


#stop
GET _analyze
{
	"analyzer": "stop",
	"text": "running Quick brown-foxes leap over lazy dogs in the summer evening."
}


#whitespace
GET _analyze
{
	"analyzer": "whitespace",
	"text": "running Quick brown-foxes leap over lazy dogs in the summer evening."
}


#Keyword
GET _analyze
{
	"analyzer": "Keyword",
	"text": "running Quick brown-foxes leap over lazy dogs in the summer evening."
}


#pattern
GET _analyze
{
	"analyzer": "pattern",
	"text": "running Quick brown-foxes leap over lazy dogs in the summer evening."
}


#english
GET _analyze
{
	"analyzer": "english",
	"text": "running Quick brown-foxes leap over lazy dogs in the summer evening."
}


GET _analyze
{
	"analyzer": "icu_analyzer",
	"text": "他说的确实在理"
}


GET _analyze
{
	"analyzer": "standard",
	"text": "他说的确实在理"
}


GET _analyze
{
	"analyzer": "icu_analyzer",
	"text": "这个苹果不大好吃"
}


```



## 相关阅读

- https://www.elastic.co/guide/en/elasticsearch/reference/7.1/indices-analyze.html
- https://www.elastic.co/guide/en/elasticsearch/reference/current/analyzer-anatomy.html