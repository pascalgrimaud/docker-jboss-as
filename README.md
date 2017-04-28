[![logo](https://raw.githubusercontent.com/pascalgrimaud/docker-jboss-as/master/as7_logo.png)]
(http://jbossas.jboss.org/)

[![Circle CI](https://circleci.com/gh/pascalgrimaud/docker-jboss-as.svg?style=shield)]
(https://circleci.com/gh/pascalgrimaud/docker-jboss-as)


# Information

The base docker image :

  * [pascalgrimaud/ubuntu](https://registry.hub.docker.com/u/pascalgrimaud/ubuntu/)

The GitHub project :

  * [pascalgrimaud/docker-jboss-as](https://github.com/pascalgrimaud/docker-jboss-as/)



# Installation

You can clone this project and build with docker command :

```
git clone https://github.com/pascalgrimaud/docker-jboss-as.git \
&& cd docker-jboss-as \
&& docker build -t pascalgrimaud/jboss-as:7.1.1 .
```

You can build directly from the [GitHub project](https://github.com/pascalgrimaud/docker-jboss-as/) :

```
docker build -t pascalgrimaud/jboss-as:7.1.1 \
github.com/pascalgrimaud/docker-jboss-as.git
```



# Help

To display usage :

```
docker run --rm pascalgrimaud/jboss-as:7.1.1 /help
```



# Usage

Quick start with binding to port 8080, 9990 and random password :

```
docker run -d -p 8080:8080 -p 9990:9990 pascalgrimaud/jboss-as:7.1.1
```

To get the password :

```
docker logs <container id>
```

Start and set a specific password for JBoss admin user :

```
docker run -d -p 8080:8080 -p 9990:9990 -e JBOSS_PASS="pass" \
pascalgrimaud/jboss-as:7.1.1
```

If you forget the admin password, delete the file .password and restart the container :

```
docker exec -it <container id> rm /.password
```


# Deploy a war

To deploy a specific file.war, you need to make another container.
Create a new directory and put your file.war.
Then, create a new Dockerfile :

```
FROM pascalgrimaud/jboss-as:7.1.1
ADD file.war /opt/jboss-as-7.1.1.Final/standalone/deployments/file.war
```
