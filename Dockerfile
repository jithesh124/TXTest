# User has to specify
FROM sys-tx-docker-local.artifactory.swg-devops.com/txseries:latest
USER root

# Args for redis version/redis server and redis type
ARG redis_client_version
ARG vip_redis_client_version
ARG redis_serv_addr
ARG redis_type

ENV HOME /root

#To enable the global storage with CICS TX On Cloud
ENV GLOBAL_STORAGE_ENABLED 1

# Provide redis server host/port to connect to redis standalone/cluster master server
ENV CICS_REDIS_HOST $redis_serv_addr
ENV CICS_REDIS_PORT 6379
ENV CICS_GLOBAL_STORAGE $redis_type

# To install libc,gcc,make and wget
RUN \
     apt-get update --fix-missing \
     && apt-get install -y libc6:i386 libstdc++6:i386 wget make gcc-multilib

# To install hiredis client libraries
RUN  \
       wget  https://github.com/redis/hiredis/archive/v$redis_client_version.tar.gz \
    && tar -xvzf v$redis_client_version.tar.gz  \
    && cd hiredis-$redis_client_version \
    && make -f Makefile 32bit \
    && make install

# To install hiredis-vip client libraries
RUN  \
       wget  https://github.com/vipshop/hiredis-vip/archive/$vip_redis_client_version.tar.gz \
    && tar -xvzf $vip_redis_client_version.tar.gz  \
    && cd hiredis-vip-$vip_redis_client_version \
    && make -f Makefile 32bit \
    && make install

# create global storage switchload file
RUN cd /opt/ibm/cics/etc/ && make -f redis.mk redis && chown cics:cics cicsswgld

# Change the root permissions
USER cics
