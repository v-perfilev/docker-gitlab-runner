# GitLab Runner - Docker Image

Simple GitLab Runner image with env variables for configuration that registers itself once.  
GitLab: https://gitlab.com/persoff68-docker/gitlab-runner  
Docker Hub: https://hub.docker.com/repository/docker/persoff68/gitlab-runner


Build:  
```
docker build -t persoff68/gitlab-runner .
```

Run (don't forget to use your own url and token):  
```
docker run -d --name gitlab-runner --restart always \
  --env GITLAB_URL_TOKEN=url \
  --env GITLAB_CI_TOKEN=token \
  persoff68/gitlab-runner
```

Run with docker compose (don't forget to use your own url and token):
```
docker-compose up -d
```
