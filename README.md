# A collection of Docker builds for common components

## Java
- Based on `centos:centos7`
- Using Oracle Java 8 Server JRE

## Tomcat
- Based on `cooniur/java:latest`, which is the above Java docker build
- Export `logs`, `temp` and `work` as volumes
- Expose 8080 port
- Removed management UI to avoid security issue
