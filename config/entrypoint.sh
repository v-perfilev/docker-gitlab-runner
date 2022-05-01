#!/bin/bash
set -e

# check if token env exists
if [ -z "$GITLAB_CI_TOKEN" ]; then
  echo "GitLab TOKEN is not set!"
  exit 1
fi

# write daemon.json with mirror url
if [ ! -f /tmp/daemon.json ]; then

  touch /tmp/daemon.json
  echo "{" >> /tmp/daemon.json
  echo "  \"registry-mirrors\": \"$GITLAB_CI_MIRROR\"" >> /tmp/daemon.json
  echo "}" >> /tmp/daemon.json

fi

# register GitLab runner if not exists
if [ ! -f /etc/gitlab-runner/config.toml ]; then

  echo "Registering runner..."
  /usr/bin/gitlab-ci-multi-runner register \
    --non-interactive \
    --url "$GITLAB_CI_URL" \
    --registration-token "$GITLAB_CI_TOKEN" \
    --executor "$GITLAB_CI_EXECUTOR" \
    --docker-image "$GITLAB_CI_DEFAULT_IMAGE" \
    --description "$GITLAB_CI_DESCRIPTION" \
    --tag-list "$GITLAB_CI_TAGS" \
    --run-untagged="true" \
    --locked="false" \
    --access-level="not_protected" \
    --docker-privileged \
    --docker-volumes "/cache" \
    --docker-volumes "/tmp/daemon.json:/etc/docker/daemon.json" \
    --docker-pull-policy "if-not-present"

fi

# start GitLab runner
echo "Starting runner..."
/usr/bin/gitlab-ci-multi-runner run
