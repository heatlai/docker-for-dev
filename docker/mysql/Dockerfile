FROM mysql:5.7
ARG COMPOSE_PROJECT_NAME

RUN apt-get update && apt-get upgrade -y \
    && apt-get install -y --no-install-recommends \
        vim \
        gettext \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

COPY ./init/* /docker-entrypoint-initdb.d
RUN find /docker-entrypoint-initdb.d -type f -exec sh -c "cat {} | envsubst | tee {} > /dev/null" \;