# RStudio Server in a Container - Quick Start Version

This repository contains `Dockerfile` and other scripts for getting an RStudio server running for multiple users.

## Requirements

To run this kickstart, you only need to ensure that `docker` is already installed and running in your system. Refer to [the official documentations](https://docs.docker.com/install/) for further helps.

## Running the Container

This kickstart version provides an easy installation for running an RStudio server for multiple users. The `data/users.csv` serves as a template for users and passwords data; just provide a similar `.csv` file (**without header**) and name it to `data/users.csv` to override the template; or use the `R/create-users.R` script to generate the similar user and password combination. The `Dockerfile` will create the users identified in `data/users.csv`--through `add-users.sh`--so you only need to build the image.

To build the image, you need to clone this repository first:

```bash
# clone the kickstart repository
git clone https://github.com/bagasbgy/rockerverse-kickstart
```

Assuming you already adjust the `data/users.csv` according to your need, then build the docker image inside the directory:

```bash
# change working directory
cd rockerverse-kickstart

# build the image
docker build . -t rockerverse-kickstart
```

Then you can simply run the docker image to make it up and running, for example:

```bash
# run the docker
docker run -d -p 8787:8787 -e USER=rstudio -e PASSWORD=secret rockerverse-kickstart
```

**Note:** you can change the initial user and password to suits your need.

For more setting in serving the docker image, please refer to [the official `rocker`'s wiki for running RStudio image](https://github.com/rocker-org/rocker/wiki/Using-the-RStudio-image).
