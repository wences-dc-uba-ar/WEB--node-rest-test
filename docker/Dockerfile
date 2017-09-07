# https://docs.docker.com/engine/reference/builder/
FROM node

ARG http_proxy
ARG DEBIAN_FRONTEND=noninteractive
ARG PROJECT

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
      locales && \
    localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8 && \
    rm -rf /var/lib/apt/lists/*

ENV LANG en_US.utf8

RUN npm i -g swagger

EXPOSE 3000

WORKDIR /app

CMD pwd && \
  ls -l && \
  echo "\n# hint:\n./create-project.sh $PROJECT\n" && \
  bash
