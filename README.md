# Dockerized Ubuntu Environment with GSL

This repository provides a pre-configured Ubuntu environment using Docker and Docker Compose, including instructions to install the GNU Scientific Library (GSL).

## Project Structure

- **Dockerfile**: Defines the base image (Ubuntu) and sets up the necessary directory structure for persistent and temporary storage.
- **docker-compose.yml**: Manages the container lifecycle, including volume mounting and temporary filesystem (tmpfs) setup.
- **comandos-instalar-gsl.txt**: A guide for installing GSL from source within the container.
- **instrucciones.txt**: A reference for common Docker commands used to manage this environment.

## Prerequisites

Ensure you have the following installed:
- Docker
- Docker Compose

## Getting Started

### 1. Build the Image
To build the Docker image locally:
docker build -t [image-name] .

### 2. Launch the Environment
Start the services in detached mode:
docker-compose up -d

### 3. Access the Container
Open an interactive terminal inside the running container:
docker exec -it [container-name] bash

### 4. Verify Resources
- Check running containers: docker ps
- List volumes: docker volume ls

## GSL Installation Steps

Once inside the container, you can install the GNU Scientific Library (GSL) by running the following sequence:

apt-get update
apt-get install wget
apt-get install gcc
apt-get install make
wget ftp://ftp.gnu.org/gnu/gsl/gsl-1.0.tar.gz
tar -zxvf gsl-1.0.tar.gz
cd gsl-1.0
./configure
make
make check
make install
rm -r gsl*

Note: Installation steps based on instructions from Lehigh University.

## Storage Configuration

The environment is configured with two specialized storage areas:
- /disco-constante: A persistent shared volume for long-term data storage.
- /disco-temporal: A tmpfs mount for high-speed, temporary data that does not persist after the container stops.

## Cleanup

To stop the containers and remove the created resources:
docker-compose down
