## xampp-docker
Fork From https://github.com/cswl/xampp-docker

Docker image containg Ubuntu 18.04, XAMPP PHP 5.6.

The install.js script is a temporary workaround for building XAMPP in docker.  
Note: This image was built for development purposes.

## Getting the image:

The image has been pushed to [Dockerhub](https://hub.docker.com/r/defyma/xampp-php5/)  
So you can just:

```
docker pull defyma/xampp-php5
```

## Running the image:

For convience, an startup script is provided.  
Edit the startup script if you want to give the container a different name.

This image uses /www directory for your page files, so you need to specify the volume mount it.
Your webpage will be served at: http://localhost:8086/www  
And to open up the XAMPP interface: http://localhost:8086/  
The MySQL port is also exposed at at mysql://localhost:3086

All the XAMPP services are started by default.
To startup a bash shell. Just run the startup script without arguments.


## Building the image from source.:

First, clone this project.

```
$ git clone https://github.com/cswl/xampp-docker.git
```

Second, change directory to the just now cloned repository.

```
$ docker build -t cswl/xampp .
```

## License

The scripts and Dockerfile are licensed under the GPL-3.0 license.

The Dockerfile was made with refrences from :

[tomsik68/docker-xampp](https://github.com/tomsik68/docker-xampp) unlicensed and [fuyuanli/Dockerfile-XAMPP](https://github.com/fuyuanli/Dockerfile-XAMPP) which is  licensed under GPL v3.0.
