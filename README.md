## HNRSS Docker Image

[HNRSS](https://github.com/hnrss/hnrss) in a Docker container.

### Usage

Note: For HNRSS usage see the [official documentation](https://hnrss.github.io/)

#### docker-compose

Create a `docker-compose.yml` file with the following content:

```yaml
version: '3'
services:
  hnrss:
    image: cascadingstyletrees/hnrss-docker:latest
    container_name: hnrss
    ports:
      - 9000:9000
    restart: unless-stopped
```

To start the container:

```bash
docker-compose up -d
```

#### docker cli

```bash
docker run -d \
  --name=hnrss \
  -p 9000:9000 \
  --restart unless-stopped \
  cascadingstyletrees/hnrss-docker:latest
```

### Building the image

```bash
git clone https://github.com/cascadingstyletrees/hnrss-docker.git
cd hnrss-docker
docker build -t cascadingstyletrees/hnrss-docker:latest .
```

### Updating

This image builds HNRSS when the container starts, to update restart or recreate the container.

### Ports

- **9000** Default port for HNRSS web interface using the [GIN Framework](https://github.com/gin-gonic/gin)

### Additional Information

- **Docker Hub Repository** [cascadingstyletrees/hnrss-docker](https://hub.docker.com/r/cascadingstyletrees/hnrss-docker)

#### Credits
This project is not endorsed or affiliated with [HNRSS](https://github.com/hnrss/hnrss)


