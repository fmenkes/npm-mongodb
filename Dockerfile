FROM node:10.15.0

LABEL version="0.0.1"
LABEL repository="http://github.com/fmenkes/npm-mongodb"
LABEL homepage="http://github.com/fmenkes/npm-mongodb"
LABEL maintainer="fmenkes"

LABEL com.github.actions.name="GitHub Action for npm + mongodb"
LABEL com.github.actions.description="Extends the npm action with mongodb for integration testing."
LABEL com.github.actions.icon="package"
LABEL com.github.actions.color="red"
COPY LICENSE README.md /

RUN npm i -g npm

RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 9DA31620334BD75D9DCB49F368818C72E52529D4
RUN echo "deb http://repo.mongodb.org/apt/debian stretch/mongodb-org/4.0 main" | tee /etc/apt/sources.list.d/mongodb-org-4.0.list
RUN apt-get update && apt-get install -y mongodb-org

RUN mkdir -p /data/db

RUN mongod --fork --syslog

COPY "entrypoint.sh" "/entrypoint.sh"
ENTRYPOINT ["/entrypoint.sh"]
CMD ["help"]
