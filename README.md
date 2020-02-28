# docker-for-dev

## Run docker
```shell script
ln -s /path/to/src ./workspace

# docker-compose 的參數 "-p wordpress" 已用 .env 的 COMPOSE_PROJECT_NAME 取代
docker-compose --project-directory docker -f docker/docker-composer.yml up -d 
# or
cd docker
docker-compose up
```