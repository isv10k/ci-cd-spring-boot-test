FROM arm64v8/ubuntu:latest
ARG TOKEN=not-set

ENV RUNNER_ALLOW_RUNASROOT=1
RUN apt-get update -y && apt-get install -y curl
# hmm
RUN apt-get install -y netcat
RUN apt-get install -y ssh
RUN apt-get install -y rsync
# RUN apt-get install -y maven

RUN mkdir actions-runner
WORKDIR /actions-runner

RUN curl -o actions-runner-linux-arm64-2.299.1.tar.gz -L https://github.com/actions/runner/releases/download/v2.299.1/actions-runner-linux-arm64-2.299.1.tar.gz
RUN tar xzf ./actions-runner-linux-arm64-2.299.1.tar.gz

RUN ./bin/installdependencies.sh
RUN ./config.sh --url https://github.com/isv10k/ci-cd-spring-boot-test --token $TOKEN --name linux --work _work --runasservice --disableupdate
CMD [ "./run.sh" ]

# docker build . -t github_actions_runner --build-arg TOKEN=
# docker run -d --log-opt mode=non-blocking github_actions_runner
# docker logs --follow