FROM sgrankin/docker-openjdk32

ARG VERSION=4.11
ADD https://github.com/gitbucket/gitbucket/releases/download/$VERSION/gitbucket.war /gitbucket.war

EXPOSE 8080
VOLUME /data

CMD /usr/bin/java -jar /gitbucket.war --host=$HOSTNAME --port=8080 --gitbucket.home=/data --prefix=${PREFIX:-/}
