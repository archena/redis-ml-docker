# What and why?

This is a Docker image that runs Redis built from the [Unstable](https://github.com/antirez/redis/tree/unstable) branch plus the Redis [Neural Networks module](https://github.com/antirez/neural-redis). It is *not* in any way intended for use in production environments. It is only meant for experimentation, so use at your own risk!

# Usage

## Build:

```
docker build . -t redis-nn:latest
```

## Run

```
docker run --publish 6378:6379 redis-nn
```

## Get a CLI on the running container

```
docker exec -it <container-id> redis-unstable/src/redis-cli
```
