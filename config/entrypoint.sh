#!/bin/bash
set -e

if [ -z "$GITLAB_CI_TOKEN" ]; then
  echo "GitLab TOKEN is not set!"
  exit 1
fi

# regsiter GitLab runner
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
  --access-level="not_protected"

# start GitLab runner
/usr/bin/gitlab-ci-multi-runner run
