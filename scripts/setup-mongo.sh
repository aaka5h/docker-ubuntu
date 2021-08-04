# sets up a simple mongodb docker container
# more config options at https://hub.docker.com/_/mongo
docker run \
	--name learn-mongo \
	-e MONGO_INITDB_ROOT_USERNAME=root \
	-e MONGO_INITDB_ROOT_PASSWORD=odus \
	-v $(pwd)/db:/data/db \
	-p 27017:27017 \
	-d mongo:focal
