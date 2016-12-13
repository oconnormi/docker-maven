# maven
Maven container for executing builds

## About
This container is used for building maven projects in an isolated environment.

The project directory inside the container is `/workspace`, anything mounted here will be built when the container is run.
The entrypoint simply passes any arguments to the maven executable, if no arguments are provided the container will simply run `mvn --version`

Local m2 directory can be mounted to `/m2`

## Usage

`docker run --rm -it -v /path/to/project:/workspace -v /path/to/local/m2:/m2 oconnormi/alpine-maven clean install`
