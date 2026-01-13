# Build docker image & run migration
docker build . -t blazebooru-split-volume-migration \
  && docker run -it --rm \
  -v blazebooru-docker_data:/mnt/data \
  -v blazebooru-docker_files:/mnt/files \
  -v blazebooru-docker_db:/mnt/db \
  blazebooru-split-volume-migration

# Upgrade PostgreSQL database
docker run -it --rm \
  -v blazebooru-docker_db:/var/lib/postgresql \
  -e PGDATA=/var/lib/postgresql/data \ # Should only be used for pre-18.x?
  -e POSTGRES_USER=blazebooru \
  -e POSTGRES_PASSWORD=blazebooru \
  -e PGAUTO_ONESHOT=yes \
  docker.io/pgautoupgrade/pgautoupgrade:latest
