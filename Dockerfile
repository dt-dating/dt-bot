# Build Stage
FROM dt_bot:1.12.9 AS build-stage

LABEL app="build-dt_bot"
LABEL REPO="https://github.com/Chigatul/dt_bot"

ENV PROJPATH=/go/src/github.com/Chigatul/dt_bot

# Because of https://github.com/docker/docker/issues/14914
ENV PATH=$PATH:$GOROOT/bin:$GOPATH/bin

ADD . /go/src/github.com/Chigatul/dt_bot
WORKDIR /go/src/github.com/Chigatul/dt_bot

RUN make build-alpine

# Final Stage
FROM dt_bot

ARG GIT_COMMIT
ARG VERSION
LABEL REPO="https://github.com/Chigatul/dt_bot"
LABEL GIT_COMMIT=$GIT_COMMIT
LABEL VERSION=$VERSION

# Because of https://github.com/docker/docker/issues/14914
ENV PATH=$PATH:/opt/dt_bot/bin

WORKDIR /opt/dt_bot/bin

COPY --from=build-stage /go/src/github.com/Chigatul/dt_bot/bin/dt_bot /opt/dt_bot/bin/
RUN chmod +x /opt/dt_bot/bin/dt_bot

# Create appuser
RUN adduser -D -g '' dt_bot
USER dt_bot

ENTRYPOINT ["/usr/bin/dumb-init", "--"]

CMD ["/opt/dt_bot/bin/dt_bot"]
