常用docker命令

postgresql安装：
docker run --name postgres -e POSTGRES_PASSWORD=postgres -p 5432:5432 -v pgdata:/Users/thomasliu/mydata/postgresql/data -d postgres


redis安装：
docker run -itd --name redis -p 6379:6379 -v /Users/thomasliu/mydata/redis/data:/data redis:6.2.4 


elasticsearch安装：
echo "http.host: 0.0.0.0" >>/Users/thomasliu/mydata/es/config/elasticsearch.yml

docker run -d --name es7 -p 9200:9200 -p 9300:9300 -e "discovery.type=single-node" \
 -v /Users/thomasliu/mydata/es/config/elasticsearch.yml:/usr/share/elasticsearch/config/elasticsearch.yml \
 -v /Users/thomasliu/mydata/es/data:/usr/share/elasticsearch/data \
elasticsearch:7.16.2


本地构建Dockerfile:
docker build -t jetlinks:1.0.0


安装emqtt
docker pull registry.cn-hangzhou.aliyuncs.com/synbop/emqttd:2.3.6


docker run --name emq -p 18083:18083 -p 1883:1883 -p 8084:8084 -p 8883:8883 -p 8083:8083 -d registry.cn-hangzhou.aliyuncs.com/synbop/emqttd:2.3.6

