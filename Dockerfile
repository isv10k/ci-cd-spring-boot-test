FROM --platform=linux/x86_64 debian:latest

ARG TOKEN=not-set

RUN apt-get update && apt-get install -y curl

ENV RUNNER_ALLOW_RUNASROOT=1

RUN curl -o actions-runner-linux-x64-2.299.1.tar.gz -L https://github.com/actions/runner/releases/download/v2.299.1/actions-runner-linux-x64-2.299.1.tar.gz && tar zxf ./actions-runner-linux-x64-2.299.1.tar.gz

# hmm
RUN apt install -y netcat ssh

RUN ./bin/installdependencies.sh

RUN ./config.sh --url https://github.com/isv10k/ci-cd-spring-boot-test --token $TOKEN --name linux --work _work --runasservice --disableupdate

CMD ["./run.sh"]

# docker build . -t github_actions_runner --build-arg TOKEN=
# docker run -d --log-opt mode=non-blocking github_actions_runner
# docker logs --follow