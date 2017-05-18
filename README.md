# Docker - The One Docker to Rule The One Dashboard

This directory contains a config file that allows to spin up the _one-dash_ project in same environment it will be run on the server.

## Prerequisites:
- [docker](https://docs.docker.com/engine/installation/linux/ubuntu/) - follow the directions for the recommended approach. !! Make sure you do not have older version of docker (`sudo apt-get remove docker docker-engine`).
- [docker-compose](https://docs.docker.com/compose/install/) - must be version >= 1.13 (or compose v3 it is called)
- *one-dash* project. Because the docker containers will be running on the one-dash project you have. All changes to files outside the docker containers (*from your machine*) will be synchronized with the files in the environment.

Make sure you are able to use the commandline version of `docker` and `docker-compose`
e.g. `docker --version` and `docker-compose --version`

#### Common Issues:
- Docker complaining about tcp connection/proxy [Link to fix](https://docs.docker.com/engine/admin/systemd/#httphttps-proxy)

- Using both commands always requires permission, so consider going into root user mode (`sudo su`)

## Setup

#### 1. Get the required docker images
- Either build them using the Dockerfiles provided in the Dockerfiles/ directory
    - *Might take insane amount of time to build*
    - Once you are in the one-dash/docker/Dockerfiles directory
    - `sudo build -f Devbase_Dockerfile -t onedash/dev`
    - `sudo build -f Gulp_Dockerfile -t onedash/gulp`
- *Recommended* Skip to next step as they will be pulled down when the resolving the dependencies

#### 2. Run it
- Go to onedash/docker and run `sudo docker-compose up`
- It might take a while if the onedash project is freshly pulled as it will need to run npm install and pull all the required images

#### 3. Browse it
- Go to `localhost:3002` in your browser which should load up the one-dash interface

#### 4. Production version
- Follow the previous steps, and *from same directory where you ran `docker-compose up`*
- `sudo docker-compose exec gulp_service gulp build`
- In the production version there is no need to have gulp on watch, so to free the gulp service from its duty run `sudo docker-compose stop gulp_service`
- You can alwayas restart the service by `sudo docker-compose up --no-deps -d gulp_service`


## Debugging/Documentation on commands

#### Useful Commands
- `sudo docker ps -a` - shows the information about running and stopped containers. Notice the *CONTAINER_ID* and *NAMES*(if it exists). All commands that manipulate or inspect containers can be run with respect to those names
- `sudo docker stop $(sudo docker ps -a -q)` - stops all running containers
- `sudo docker rm $(sudo docker ps -a -q)` - removes all stopped containers
- `sudo docker images` - shows all images on the machine
- `sudo docker rmi IMAGE` - removes a docker image. A lot of images tend to pile up if you change Dockerfiles and rebuild them
- `sudo docker network ls` - lists all networks. The containers will be running on one of those networks
- `sudo docker inspect [NETWORKNAME or CONTAINERNAME]` - will show all info on the network, _containers_ in that network, their exposed ports, etc.
- `sudo docker run --rm -it --entrypoint /bin/bash image` - *run container from image in bash without executing any CMD defined in the image*
- `sudo docker exec -it CONTAINER /bin/bash` - *enter an ALREADY running container in bash*

When using `docker-compose` commands, make sure you are in the same directory where the `docker-compose up` was run.

- **_`sudo docker-compose ps`_** - shows all the services running at the moment
- `sudo docker-compose up --no-deps -d SERVICENAME` - start running a container without starting any linked services
- `sudo docker-compose stop SERVICENAME` - stop a service and container it is running, BUT does not remove the container
- `sudo docker-compose exec SERVICENAME /bin/bash` - enter an ALREADY running container through the service running it in bash
- The rest of commands are similar to docker commands

## Deployment
- [REPOSITORY:TAG] - e.g. onedash/dev:latest
- `sudo docker commit [OPTIONS] CONTAINER [REPOSITORY:TAG]` - commit changes from CONTAINER to an IMAGE. Look in --help for OPTIONS. *Most often used* if commiting a image with new configurations
- `sudo docker push NAME[:TAG]` - push an image to a repository. (A public repository with the same NAME exists)
- `sudo docker pull IMAGE[:TAG]`

## Common Issues
- Most of `sudo docker-compose up` issues can be resolved by
    - `sudo docker stop $(docker ps -a -q)`
    - `sudo docker rm $(docker ps -a -q)`  - force remove by adding -f
    - `sudo docker-compose down`
