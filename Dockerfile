FROM ubuntu:18.04

# default environemt variables
ENV GITLAB_CI_DESCRIPTION="Dockerized GitLab Runner" \
    GITLAB_CI_TAGS="docker,alpine" \
    GITLAB_CI_EXECUTOR="docker" \
    GITLAB_CI_DEFAULT_IMAGE="alpine:latest" \
    GITLAB_CI_URL="https://gitlab.com/"

# common setup
RUN apt-get update && \
    apt-get install -y software-properties-common curl

# install gitlab runner
RUN curl -L https://packages.gitlab.com/install/repositories/runner/gitlab-runner/script.deb.sh | bash && \
    apt-get install -y gitlab-runner

# config and entrypoint
COPY config/entrypoint.sh /usr/sbin/
RUN chmod +x /usr/sbin/entrypoint.sh

# entrypoint
ENTRYPOINT /usr/sbin/entrypoint.sh
