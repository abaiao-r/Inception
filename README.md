# Inception

draft

What is Docker?

Docker is an open-source platform that automates the deployment, scaling, and management of applications by isolating them into lightweight, portable containers. Containers are standalone executable units that encapsulate all necessary dependencies, libraries, and configuration files required for an application to run consistently across various environments.

Docker is a platform that simplifies the process of building, packaging, and deploying applications in lightweight, portable containers. In this section, we’ll cover the basics of Docker, its components, and key commands you’ll need to get started.

What are Containers?

Containers are lightweight, portable, and isolated software environments that allow developers to run and package applications with their dependencies, consistently across different platforms. They help to streamline application development, deployment, and management processes while ensuring that applications run consistently, regardless of the underlying infrastructure.
A container is a lightweight, standalone, and executable software package that includes all the dependencies (libraries, binaries, and configuration files) required to run an application. Containers isolate applications from their environment, ensuring they work consistently across different systems.

How do containers work?

Unlike traditional virtualization, which emulates a complete operating system with its hardware resources, containers share the host’s OS kernel and leverage lightweight virtualization techniques to create isolated processes. This approach leads to several benefits, including:

    Efficiency: Containers have less overhead and can share common libraries and executable files, making it possible to run more containers on a single host compared to virtual machines (VMs).
    Portability: Containers encapsulate applications and their dependencies, so they can easily be moved and run across different environments and platforms consistently.
    Fast startup: Since containers don’t need to boot a full OS, they can start up and shut down much faster than VMs.
    Consistency: Containers provide a consistent environment for development, testing, and production stages of an application, reducing the “it works on my machine” problem.

Containers and Docker

Docker is a platform that simplifies the process of creating, deploying, and managing containers. It provides developers and administrators with a set of tools and APIs to manage containerized applications. With Docker, you can build and package application code, libraries, and dependencies into a container image, which can be distributed and run consistently in any environment that supports Docker.

Installation Setup

Docker provides a desktop application called Docker Desktop that simplifies the installation and setup process. There is also another option to install using the Docker Engine.

    Docker Desktop website. https://www.docker.com/products/docker-desktop/
    Docker Engine. https://docs.docker.com/engine/install/


Need for Containers

In the world of software development and deployment, consistency and efficiency are crucial. Before containers came into the picture, developers often faced challenges when deploying applications across different environments including:

    Inconsistent environments: Developers often work in different environments which might have different configurations and libraries compared to production servers. This leads to compatibility issues in deploying applications.

    Inefficient resource utilization: Virtual Machines (VMs) were widely used to overcome environment inconsistency. However, VMs require an entire OS to be running for each application, making the resource utilization inefficient.

    Slow processes and scalability issues: Traditional deployment methods have a slower time to market and scaling difficulties, which hinders fast delivery of software updates.

How Containers Address These Challenges is as follows:

    Consistent environment: Containers solve environment inconsistencies by bundling an application and its dependencies, configurations, and libraries into a single container. This guarantees that the application runs smoothly across different environments.

    Efficient resource utilization: Unlike VMs, containers share underlying system resources and OS kernel, which makes them lightweight and efficient. Containers are designed to use fewer resources and boot up faster, improving resource utilization.

    Faster processes and scalability: Containers can be easily created, destroyed, and replaced, leading to faster development and deployment cycles. Scaling applications becomes easier as multiple containers can be deployed without consuming significant resources.

Bare Metal vs VM vs Containers

Here is a quick overview of the differences between bare metal, virtual machines, and containers.
Bare Metal

Bare metal is a term used to describe a computer that is running directly on the hardware without any virtualization. This is the most performant way to run an application, but it is also the least flexible. You can only run one application per server, and you cannot easily move the application to another server.
Virtual Machines

Virtual machines (VMs) are a way to run multiple applications on a single server. Each VM runs on top of a hypervisor, which is a piece of software that emulates the hardware of a computer. The hypervisor allows you to run multiple operating systems on a single server, and it also provides isolation between applications running on different VMs.
Containers

Containers are a way to run multiple applications on a single server without the overhead of a hypervisor. Each container runs on top of a container engine, which is a piece of software that emulates the operating system of a computer. The container engine allows you to run multiple applications on a single server, and it also provides isolation between applications running on different containers.


Docker Components

There are three key components in the Docker ecosystem:

    Dockerfile: A text file containing instructions (commands) to build a Docker image.
    Docker Image: A snapshot of a container, created from a Dockerfile. Images are stored in a registry, like Docker Hub, and can be pulled or pushed to the registry.
    Docker Container: A running instance of a Docker image.

Docker Commands

Below are some essential Docker commands you’ll use frequently:

    docker pull <image>: Download an image from a registry, like Docker Hub.
    docker build -t <image_name> <path>: Build an image from a Dockerfile, where <path> is the directory containing the Dockerfile.
    docker image ls: List all images available on your local machine.
    docker run -d -p <host_port>:<container_port> --name <container_name> <image>: Run a container from an image, mapping host ports to container ports.
    docker container ls: List all running containers.
    docker container stop <container>: Stop a running container.
    docker container rm <container>: Remove a stopped container.
    docker image rm <image>: Remove an image from your local machine.


Building Container Images

Container images are executable packages that include everything required to run an application: code, runtime, system tools, libraries, and settings. By building custom images, you can deploy applications seamlessly with all their dependencies on any Docker-supported platform.
Dockerfile

The key component in building a container image is the Dockerfile. It is essentially a script containing instructions on how to assemble a Docker image. Each instruction in the Dockerfile creates a new layer in the image, making it easier to track changes and minimize the image size. Here’s a simple example of a Dockerfile:

# Use an official Python runtime as a parent image
FROM python:3.7-slim

# Set the working directory to /app
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Install any needed packages specified in requirements.txt
RUN pip install --trusted-host pypi.python.org -r requirements.txt

# Make port 80 available to the world outside this container
EXPOSE 80

# Define environment variable
ENV NAME World

# Run app.py when the container launches
CMD ["python", "app.py"]

Building an Image

Once you have created the Dockerfile, you can build the image using the docker build command. Execute the following command in the terminal from the directory containing the Dockerfile:

docker build -t your-image-name .

This command tells Docker to build an image using the Dockerfile in the current directory (.), and assign it a name (-t your-image-name).
Inspecting Images and Layers

After a successful build, you can inspect the created image using docker image command:

docker image ls

To take a closer look at the individual layers of an image, use the docker history command:

docker history your-image-name

To view the layers of an image, you can also use the docker inspect command:

docker inspect your-image-name

To remove an image, use the docker image rm command:

docker image rm your-image-name

Pushing Images to a Registry

Once your image is built, you can push it to a container registry (e.g., Docker Hub, Google Container Registry, etc.) to easily distribute and deploy your application. First, log in to the registry using your credentials:

docker login

Then, tag your image with the registry URL:

docker tag your-image-name username/repository:tag

Finally, push the tagged image to the registry:

docker push username/repository:tag

Building container images is a crucial aspect of using Docker, as it enables you to package and deploy your applications with ease. By creating a Dockerfile with precise instructions, you can effortlessly build and distribute images across various platforms.

Dockerfile

A Dockerfile is a text document that contains a list of instructions used by the Docker engine to build an image. Each instruction in the Dockerfile adds a new layer to the image. Docker will build the image based on these instructions, and then you can run containers from the image. Dockerfiles are one of the main elements of infrastructure as code.
Structure of a Dockerfile

A Dockerfile is organized in a series of instructions, one per line. Each instruction has a specific format.

INSTRUCTION arguments

The following is an example of a simple Dockerfile:

# Use an official Python runtime as a parent image
FROM python:3.7-slim

# Set the working directory to /app
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Install any needed packages specified in requirements.txt
RUN pip install --trusted-host pypi.python.org -r requirements.txt

# Make port 80 available to the world outside this container
EXPOSE 80

# Define environment variable
ENV NAME World

# Run app.py when the container launches
CMD ["python", "app.py"]

Common Dockerfile Instructions

Here’s a list of some common Dockerfile instructions and their purpose:

    FROM: Sets the base image to begin with. It is mandatory to have FROM as the first instruction in the Dockerfile.
    WORKDIR: Sets the working directory for any RUN, CMD, ENTRYPOINT, COPY or ADD instructions. If the directory does not exist, it will be created automatically.
    COPY: Copies files or directories from the host into the container’s file system.
    ADD: Similar to COPY, but can also handle remote URLs and automatically unpack archives.
    RUN: Executes a command within the image as a new layer.
    CMD: Defines the default command to execute when running a container from the image.
    ENTRYPOINT: Similar to CMD, but it’s designed to allow a container as an executable with its own parameters.
    EXPOSE: Informs Docker that the container will listen on the specified network ports at runtime.
    ENV: Sets environment variables for the container.

Building an Image from a Dockerfile

To build an image from the Dockerfile, use the docker build command, specifying the build context (usually the current directory), and an optional tag for the image.

docker build -t my-image:tag .

After running this command, Docker will execute each instruction in the Dockerfile, in order, creating a new layer for each.

Image Size and Security

When building container images, it’s essential to be aware of both image size and security. The size of the image affects the speed at which your containers are built and deployed. Smaller images lead to faster builds and reduced network overhead when downloading the image. Security is crucial because container images can contain vulnerabilities that could potentially put your applications at risk.
Reducing Image Size

    Use an appropriate base image: Choose a smaller, more lightweight base image that includes only the necessary components for your application. For example, consider using the alpine variant of an official image, if available, as it’s typically much smaller in size.

    FROM node:14-alpine

    Run multiple commands in a single RUN statement: Each RUN statement creates a new layer in the image, which contributes to the image size. Combine multiple commands into a single RUN statement using && to minimize the number of layers and reduce the final image size.

    RUN apt-get update && \
        apt-get install -y some-required-package

    Remove unnecessary files in the same layer: When you install packages or add files during the image build process, remove temporary or unused files in the same layer to reduce the final image size.

    RUN apt-get update && \
        apt-get install -y some-required-package && \
        apt-get clean && \
        rm -rf /var/lib/apt/lists/*

    Use multi-stage builds: Use multi-stage builds to create smaller images. Multi-stage builds allow you to use multiple FROM statements in your Dockerfile. Each FROM statement creates a new stage in the build process. You can copy files from one stage to another using the COPY --from statement.

    FROM node:14-alpine AS build
    WORKDIR /app
    COPY package*.json ./
    RUN npm install
    COPY . .
    RUN npm run build

    FROM node:14-alpine
    WORKDIR /app
    COPY --from=build /app/dist ./dist
    COPY package*.json ./
    RUN npm install --production
    CMD ["npm", "start"]

    Use .dockerignore file: Use a .dockerignore file to exclude unnecessary files from the build context that might cause cache invalidation and increase the final image size.

    node_modules
    npm-debug.log

Enhancing Security

    Keep base images updated: Regularly update the base images you’re using in your Dockerfiles to ensure they include the latest security patches.

    Avoid running containers as root: Always use a non-root user when running your containers to minimize potential risks. Create a user and switch to it before running your application.

    RUN addgroup -g 1000 appuser && \
        adduser -u 1000 -G appuser -D appuser
    USER appuser

    Limit the scope of COPY or ADD instructions: Be specific about the files or directories you’re copying into the container image. Avoid using COPY . . as it may unintentionally include sensitive files.

    COPY package*.json ./
    COPY src/ src/

    Scan images for vulnerabilities: Use tools like Anchore or Clair to scan your images for vulnerabilities and fix them before deployment.


Running Containers

To start a new container, we use the docker run command followed by the image name. The basic syntax is as follows:

docker run [options] IMAGE [COMMAND] [ARG...]

For example, to run the official Nginx image, we would use:

docker run -d -p 8080:80 nginx

This starts a new container and maps the host’s port 8080 to the container’s port 80.
Listing Containers

To list all running containers, use the docker ps command. To view all containers (including those that have stopped), use the -a flag:

docker container ls -a

Accessing Containers

To access a running container’s shell, use the docker exec command:

docker exec -it CONTAINER_ID bash

Replace CONTAINER_ID with the ID or name of your desired container. You can find this in the output of docker ps.
Stopping Containers

To stop a running container, use the docker stop command followed by the container ID or name:

docker container stop CONTAINER_ID

Removing Containers

Once a container is stopped, we can remove it using the docker rm command followed by the container ID or name:

docker container rm CONTAINER_ID

To automatically remove containers when they exit, add the --rm flag when running a container:

docker run --rm IMAGE

Running Containers with docker run

In this section, we’ll discuss the docker run command, which enables you to run Docker containers. The docker run command creates a new container from the specified image and starts it.

The basic syntax for the docker run command is as follows:

docker run [OPTIONS] IMAGE [COMMAND] [ARG...]

    OPTIONS: These are command-line flags that can be used to adjust the container’s settings, like memory constraints, ports, environment variables, etc.
    IMAGE: The Docker image that the container will run. This can be an image from Docker Hub or your own image that is stored locally.
    COMMAND: This is the command that will be executed inside the container when it starts. If not specified, the default entrypoint of the image will be used.
    ARG...: These are optional arguments that can be passed to the command being executed.

Commonly used Options

Here are some commonly used options with docker run:

    --name: Assign a name to the container, making it easier to identify and manage.
    -p, --publish: Publish a container’s port(s) to the host. This is useful when you want to access the services running inside the container from outside the container.
    -e, --env: Set environment variables inside the container. You can use this option multiple times to set multiple variables.
    -d, --detach: Run the container in detached mode, running the container in the background and not showing logs in the console.
    -v, --volume: Bind mount a volume from the host to the container. This is helpful in persisting data generated by the container or sharing files between host and container.

Examples

Here are some sample commands to help you understand how to use docker run:

    Run an interactive session of an Ubuntu container:

docker run -it --name=my-ubuntu ubuntu

    Run an Nginx web server and publish the port 80 on the host:

docker run -d --name=my-nginx -p 80:80 nginx

    Run a MySQL container with custom environment variables for configuring the database:

docker run -d --name=my-mysql -e MYSQL_ROOT_PASSWORD=secret -e MYSQL_DATABASE=mydb -p 3306:3306 mysql

    Run a container with a bind-mounted volume:

docker run -d --name=my-data -v /path/on/host:/path/in/container 

Docker Compose

Docker Compose is a tool for defining and running multi-container Docker applications. It allows you to create, manage, and run your applications using a simple YAML file called docker-compose.yml. This file describes your application’s services, networks, and volumes, allowing you to easily run and manage your containers using just a single command.

Some of the benefits of using Docker Compose include:

    Simplified Container Management: Docker Compose allows you to define and configure all your services, networks, and volumes in one place, making it easy to manage and maintain.

    Reproducible Builds: Share your docker-compose.yml file with others to make sure they have the same environment and services running as you do.

    Versioning Support: Docker Compose files can be versioned for easier compatibility across different versions of the Docker Compose tool itself.

Creating a Docker Compose File:

To create a docker-compose.yml file, start by specifying the version of Docker Compose you want to use, followed by the services you want to define. Here’s an example of a basic docker-compose.yml file:

version: "3.9"
services:
  web:
    image: nginx:latest
    ports:
      - "80:80"
  db:
    image: mysql:latest
    environment:
      MYSQL_ROOT_PASSWORD: mysecretpassword

In this example, we have specified two services: a web server (web) running the latest version of the nginx image, and a database server (db) running MySQL. The web server exposes its port 80 to the host machine, and the database server has an environment variable set for the root password.
Running Docker Compose:

To run your Docker Compose application, simply navigate to the directory containing your docker-compose.yml file and run the following command:

docker-compose up

Docker Compose will read the file and start the defined services in the specified order.
Other Useful Commands:

    docker-compose down: Stops and removes all running containers, networks, and volumes defined in the docker-compose.yml file.
    docker-compose ps: Lists the status of all containers defined in the docker-compose.yml file.
    docker-compose logs: Displays the logs of all containers defined in the docker-compose.yml file.
    docker-compose build: Builds all images defined in the docker-compose.yml file.

