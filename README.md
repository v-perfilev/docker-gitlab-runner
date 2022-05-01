# GitLab Runner - Docker Image

Simple GitLab Runner image with env variables for configuration that registers itself once.  
GitLab: https://gitlab.com/persoff68-docker/gitlab-runner  
Docker Hub: https://hub.docker.com/repository/docker/persoff68/gitlab-runner


Build:  
```
docker build -t persoff68/gitlab-runner .
```

Run (don't forget to use your own url (optional) and token):  
```
docker run -d --name gitlab-runner --restart always \
  --env GITLAB_CI_URL=url \
  --env GITLAB_CI_TOKEN=token \
  --env GITLAB_CI_MIRROR=mirror_url \
  persoff68/gitlab-runner
```

Run with docker compose (don't forget to use your own url (optional) and token):
```
docker-compose up -d
```
