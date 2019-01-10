FROM fmenkes/node:10.15.0-mongodb

LABEL version="0.0.1"
LABEL repository="http://github.com/fmenkes/npm-mongodb"
LABEL homepage="http://github.com/fmenkes/npm-mongodb"
LABEL maintainer="fmenkes"

LABEL com.github.actions.name="GitHub Action for npm + mongodb"
LABEL com.github.actions.description="Extends the npm action with mongodb for integration testing."
LABEL com.github.actions.icon="package"
LABEL com.github.actions.color="red"
COPY LICENSE README.md /

COPY "entrypoint.sh" "/entrypoint.sh"
RUN ["chmod", "+x", "/entrypoint.sh"]
ENTRYPOINT ["/entrypoint.sh"]
CMD ["help"]
