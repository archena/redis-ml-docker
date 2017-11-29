FROM alpine

# Dependencies
RUN apk add --update openssl make gcc libc-dev jemalloc-dev linux-headers

# Build Redis
RUN wget https://github.com/antirez/redis/archive/unstable.zip
RUN unzip unstable.zip && rm unstable.zip
WORKDIR redis-unstable
RUN make

# Build Redis neural nets
WORKDIR /
RUN wget https://github.com/antirez/neural-redis/archive/master.zip
RUN unzip master.zip && rm master.zip
WORKDIR neural-redis-master
RUN make generic

WORKDIR /
RUN sed -i -e 's/^bind/#BIND/g' ./redis-unstable/redis.conf

EXPOSE 6379
ENTRYPOINT ["redis-unstable/src/redis-server", "--loadmodule", "neural-redis-master/neuralredis.so", "--protected-mode", "no"]
