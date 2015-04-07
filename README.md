# A collection of Docker builds for common components

## Java
- Based on `centos:centos7`
- Using Oracle Java 8 Server JRE
- By using this build, you agree with [Oracle's Binary Code License Agree for Java SE](http://www.oracle.com/technetwork/java/javase/terms/license/index.html) implicitly

## Tomcat
- Based on `cooniur/java:latest`, which is the above Java docker build
- Export `logs`, `temp` and `work` as volumes
- Expose 8080 port
- Removed management UI to avoid security issue

## Grafana-Graphite
- Forked from `kamon-io/docker-grafana-graphite`
- Export data volumes for persistence
- Upgraded Elasticsearch from the original 1.3.x to 1.5.0
- Many other improvements
- See to the repo at https://github.com/cooniur/docker-grafana-graphite
