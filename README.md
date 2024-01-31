# Inception

Inception is a project that dives deep into the world of containerization, with a specific focus on Docker, one of the most popular containerization platforms. This project aims to demystify the concept of containers and Docker, providing a comprehensive understanding of their characteristics, usage, and benefits.

## Relevance

In the modern software development landscape, containerization has become a key aspect of deploying applications in a reliable, scalable, and efficient manner. Understanding containers and Docker is crucial for developers, DevOps engineers, and system administrators. This project is relevant as it provides the necessary knowledge and skills to navigate the containerized world, enabling you to develop, ship, and run applications with ease and consistency.

## Key Aspects

- Detailed explanation of the concept of containers and Docker.
- Exploration of the key characteristics of containers and Docker.
- Understanding the differences and relationship between containers and Docker.
- Practical examples and use-cases of using Docker for containerization.

# Table of Contents

1. [Inception](#inception)
   1.1 [Relevance](#relevance)
   1.2 [Key Aspects](#key-aspects)
   1.3 [Table of Contents](#table-of-contents)

2. [Container vs Docker](#container-vs-docker)
   2.1 [Container](#container)
   2.2.1 [Docker](#docker)
   2.2.2 [Common Docker Commands](#common-docker-commands)
   2.3 [Summary](#summary)

3. [How Docker and Docker Compose Work](#how-docker-and-docker-compose-work)
   3.1 [Docker](#docker-1)
   3.2 [Docker Compose](#docker-compose)

4. [Difference Between a Docker Image Used with Docker Compose and Without Docker Compose](#difference-between-a-docker-image-used-with-docker-compose-and-without-docker-compose)

5. [Benefits of Docker Compared to VMs](#benefits-of-docker-compared-to-vms)
   5.1 [Resource Efficiency](#resource-efficiency)
   5.2 [Portability](#portability)
   5.3 [Speed](#speed)
   5.4 [Isolation](#isolation)
   5.5 [Management Overhead](#management-overhead)
   5.6 [Use Cases](#use-cases)
   5.7 [Scalability](#scalability)
   5.8 [Overall Overhead](#overall-overhead)
   5.9 [Community and Ecosystem](#community-and-ecosystem)

6. [Pertinence of Directory Structure for the Project](#pertinence-of-directory-structure-for-the-project)

7. [Explaining Dockerfile for Beginners](#explaining-dockerfile-for-beginners)
   7.1 [Docker and Containers](#docker-and-containers)
   7.2 [Dockerfile](#dockerfile)
   7.3 [Common Dockerfiles Commands](#common-dockerfile-commands)
   7.3 [Basic Structure](#basic-structure)
   7.4 [Explanation](#explanation)

8. [Docker Networking Explanation](#docker-networking-explanation)
   8.1 [Docker Network Listing](#docker-network-listing)

9. [Relationships in a Docker Project: Nginx, WordPress, MariaDB](#relationships-in-a-docker-project-nginx-wordpress-mariadb)
   9.1 [Nginx (Web Server)](#nginx-web-server)
   9.2 [WordPress (Web Application)](#wordpress-web-application)
   9.3 [MariaDB (Database)](#mariadb-database)
   9.4 [Overview of the Flow](#overview-of-the-flow)

10. [TLS and SSL Versions](#tls-and-ssl-versions)
    10.1 [SSL 1.2](#ssl-12)
    10.2 [SSL 1.3](#ssl-13)
    10.3 [TLS 1.2](#tls-12)
    10.4 [TLS 1.3](#tls-13)

11. [Persistence in Docker with Volumes](#persistence-in-docker-with-volumes)

12. [Docker Network Listing](#docker-network-listing)




### Container vs Docker

#### Container:

A **container** is a lightweight, standalone, and executable software package that includes everything needed to run a piece of software. Containers encapsulate the application code, runtime, system tools, libraries, and settings. They operate at the operating system level, allowing applications to run consistently across different environments.

**Key Characteristics:**
- **Portability:** Containers can run consistently on any system supporting containerization.
- **Isolation:** Applications are isolated from each other, preventing conflicts and encapsulating dependencies.
- **Resource Efficiency:** Containers share the host OS kernel, making them more resource-efficient compared to virtual machines.
- **Scalability:** Easily scalable to meet changing demands, suitable for modern, dynamic applications.

#### Docker:

**Docker** is a platform for developing, shipping, and running applications in containers. It provides tools and a runtime environment to create, manage, and deploy containers. Docker uses a client-server architecture, with the Docker CLI (Command-Line Interface) communicating with the Docker daemon, which manages containers on the host system.

**Key Characteristics:**
- **Image-Based:** Containers in Docker are created from images, which are lightweight, standalone, and executable packages containing the application and its dependencies.
- **Docker Hub:** Docker provides a centralized repository called Docker Hub for sharing and accessing pre-built container images.
- **Dockerfile:** Configuration for building Docker images is defined in a file called Dockerfile.
- **Docker Compose:** Docker Compose is a tool for defining and running multi-container Docker applications using a YAML file.

**Summary:**
- **Container** is a general concept representing a lightweight, portable, and isolated execution environment.
- **Docker** is a specific implementation and platform that facilitates the creation, management, and deployment of containers.

In essence, while a container is a broader concept, Docker is a widely-used containerization platform that has become synonymous with the term "container" in many contexts.

#### Common Docker Commands

| Command                                | Explanation                                                |
|----------------------------------------|------------------------------------------------------------|
| `docker --version`                     | Display installed Docker version.                           |
| `docker info`                          | Show system-wide information about Docker.                 |
| `docker run IMAGE_NAME`                | Start a new container from the specified image.            |
| `docker ps`                            | List currently running containers.                         |
| `docker ps -a`                         | Show all containers, including stopped ones.               |
| `docker stop CONTAINER_ID`             | Stop a running container.                                   |
| `docker rm CONTAINER_ID`               | Remove a stopped container.                                 |
| `docker container prune`               | Remove all stopped containers.                              |
| `docker images`                        | List locally available Docker images.                      |
| `docker rmi IMAGE_NAME`                | Delete a specific Docker image.                             |
| `docker pull IMAGE_NAME`               | Download a Docker image from a registry.                   |
| `docker build -t IMAGE_NAME:TAG .`     | Build a Docker image from a Dockerfile.                    |
| `docker inspect CONTAINER_ID`          | View detailed information about a container.               |
| `docker logs CONTAINER_ID`             | Display the logs of a container.                            |
| `docker exec -it CONTAINER_ID COMMAND` | Execute a command in a running container interactively.    |

### How Docker and Docker Compose Work:

- **Docker:**
  - Docker allows you to package an entire application and its dependencies into a single container.
  - Containers are portable and can run consistently across various environments.

- **Docker Compose:**
  - Docker Compose helps define and run multi-container Docker applications.
  - Configuration is done through a YAML file, simplifying the management of services, networks, and volumes.

### Difference Between a Docker Image Used with Docker Compose and Without Docker Compose:

- **Without Docker Compose:**
  - Containers are built and run individually for each application.
  - Manual management of multiple containers and their configurations.

- **With Docker Compose:**
  - A single YAML file defines the entire application stack.
  - Simplifies the management of multi-container applications, enabling easy scaling and orchestration.

### Benefits of Docker Compared to VMs:

- **Resource Efficiency:**
  - **Docker:**
    - Uses less memory and resources, as containers share the host OS kernel.
  - **Virtual Machines:**
    - Requires separate operating system instances for each VM, consuming more resources.

- **Portability:**
  - **Docker:**
    - Containers are bundled, making applications highly portable across different environments.
  - **Virtual Machines:**
    - VMs are less portable due to differences in OS and configuration.

- **Speed:**
  - **Docker:**
    - Containers start up quickly, enabling faster development cycles and deployments.
  - **Virtual Machines:**
    - VMs generally have a slower startup time compared to containers.

- **Isolation:**
  - **Docker:**
    - Provides process-level isolation with minimal overhead.
  - **Virtual Machines:**
    - Offers stronger isolation but comes with higher resource overhead.

- **Management Overhead:**
  - **Docker:**
    - Easier to manage as it involves fewer components and less setup time.
  - **Virtual Machines:**
    - Involves managing full operating system instances, leading to higher management overhead.

- **Use Cases:**
  - **Docker:**
    - Ideal for microservices architecture, where lightweight and fast deployment are crucial.
  - **Virtual Machines:**
    - Suitable for scenarios requiring stronger isolation and running applications with diverse operating systems.

- **Scalability:**
  - **Docker:**
    - Scales quickly and efficiently due to lightweight containers.
  - **Virtual Machines:**
    - Scaling involves more overhead as each VM requires a full operating system.

- **Overall Overhead:**
  - **Docker:**
    - Lower overall overhead, making it more efficient in resource utilization.
  - **Virtual Machines:**
    - Higher overall overhead due to the need for separate OS instances.

- **Community and Ecosystem:**
  - **Docker:**
    - Has a large and active community with a rich ecosystem of pre-built images.
  - **Virtual Machines:**
    - Established with a wide range of available hypervisors, but Docker has gained popularity in modern application development.


### Pertinence of Directory Structure for the Project:

- **Organized Development:**
  - Neat folders for each part of the project make it tidy and easy to find.

- **Ease of Configuration:**
  - Docker prefers an organized structure, simplifying configuration management.

- **Scalability:**
  - A good directory structure helps add new components without confusion as the project grows.

- **Consistency:**
  - An organized structure ensures consistent behavior across different environments.

# Explaining Dockerfile for Beginners

## Docker and Containers
Docker is a tool for packaging applications and their dependencies into a single unit called a container. Containers are like lightweight, standalone, and executable packages that contain everything needed to run an application.

## Dockerfile
A Dockerfile is like a recipe for creating a Docker container. It specifies what goes inside the container and how to set it up.

## Common Dockerfiles Commands

| Instruction                              | Explanation                                                        |
|------------------------------------------|--------------------------------------------------------------------|
| `FROM image:tag`                         | Specify the base image from which to build the container.          |
| `COPY src dest`                          | Copy files or directories from the source on the host to the destination in the container. |
| `ADD src dest`                           | Similar to COPY but allows for additional features such as extracting archives. |
| `RUN command`                            | Execute a command during the image build process.                   |
| `WORKDIR /path`                          | Set the working directory for subsequent instructions.              |
| `EXPOSE port`                            | Inform Docker that the container will listen on the specified network ports at runtime. |
| `CMD ["executable","param1","param2"]`   | Provide a default command to run when the container starts.        |
| `ENTRYPOINT ["executable", "param1", "param2"]` | Configure a container to run as an executable.              |
| `ENV key=value`                          | Set environment variables in the image.                            |
| `ARG name=value`                         | Define build-time variables that users can pass at build-time to the builder. |
| `LABEL key="value"`                      | Add metadata to an image. This is often used for documentation or labeling purposes. |
| `VOLUME ["/data"]`                       | Create a mount point and mark it as holding externally mounted volumes. |
| `USER username`                          | Set the username or UID to use when running the image.             |
| `HEALTHCHECK`                            | Define a healthcheck for the container.                             |
| `RUN apt-get update && apt-get install -y package` | Combine multiple commands to minimize layers and reduce image size. |
| `RUN rm -rf /var/lib/apt/lists/*`        | Clean up package manager caches to reduce the size of the image.    |
| `COPY --from=builder /app/result /app`   | Copy files or directories from another stage during a multi-stage build. |

## Basic Structure
A Dockerfile is a simple text file without any file extension. It consists of a series of instructions. Here's a simplified example:

```dockerfile
# Use an existing image as a base
FROM ubuntu:latest

# Install necessary software
RUN apt-get update && apt-get install -y \
    software-package1 \
    software-package2

# Copy your application code into the container
COPY . /app

# Set the working directory
WORKDIR /app

# Specify a command to run when the container starts
CMD ["python", "app.py"]
```

# Explanation

**FROM**: Sets the base image for the container. It's like choosing a starting point, here using the latest version of Ubuntu.

**RUN**: Executes commands inside the container. Here, it updates package lists and installs some software.

**COPY**: Copies files from your local machine into the container. In this case, copying everything from the current directory (.) into a directory named /app in the container.

**WORKDIR**: Sets the working directory for subsequent instructions. It's like saying, "Now, do everything in /app."

**CMD**: Sets the default command to run when the container starts. Here, it's running a Python script app.py.

## Docker Networking Explanation

Docker networking is like a virtual "internet" that allows different Docker containers to talk to each other or the outside world. Each container gets its own unique network address, making it possible for them to communicate while remaining isolated from other containers. 

Imagine each container as a tiny computer with its own network cable. Docker networking helps these containers send messages, share data, or connect to the internet, just like computers in a network. It's like giving each container its own little space to chat and exchange information, all managed by Docker. 

In summary, Docker networking is the magic that lets our containers communicate and work together smoothly.

## Docker Network Listing

When you run the `docker network ls` command, it provides a list of Docker networks available on your system. Here's an interpretation of the output:


```bash
NETWORK ID     NAME                  DRIVER    SCOPE
9614ffb27402   bridge                bridge    local
adc21cf07252   host                  host      local
1802db2bc2d2   none                  null      local
fc0273878ddd   srcs_docker-network   bridge    local
```
- **bridge**: This is the default network that allows containers to communicate with each other. The bridge driver is commonly used for connecting containers on the same host.

- **host**: The host network mode removes network isolation between the Docker container and the Docker host, allowing them to directly share the host's networking namespace.

- **none**: Containers attached to this network have no network access. It's a way to create containers without any network configuration.

- **srcs_docker-network**: This appears to be a custom network named srcs_docker-network using the bridge driver. Custom networks are often created to enable communication between specific containers.

# Relationships in a Docker Project: Nginx, WordPress, MariaDB

## Nginx (Web Server):
- **Role:** Nginx acts as a web server and a reverse proxy in this setup.
- **Responsibility:** It receives incoming web requests and directs them to the appropriate service (in this case, WordPress).
- **Connection to WordPress:** Nginx communicates with the WordPress service to serve web pages and content. It passes requests to the WordPress service and manages the traffic flow.

## WordPress (Web Application):
- **Role:** WordPress is the web application responsible for managing and displaying the website's content.
- **Responsibility:** It handles user requests, generates dynamic web pages, and interacts with the MariaDB database to store and retrieve data (like posts, pages, and user information).
- **Connection to Nginx:** WordPress communicates with Nginx to receive user requests and deliver web pages. Nginx acts as a gateway for external requests to reach the WordPress application.

## MariaDB (Database):
- **Role:** MariaDB is the database server storing the data needed by the WordPress application.
- **Responsibility:** It manages the storage and retrieval of structured data, such as posts, comments, and user information, essential for the functioning of the WordPress site.
- **Connection to WordPress:** WordPress connects to MariaDB to read and write data. For example, when a user adds a new post or comments on a page, WordPress interacts with MariaDB to store that information.

## Overview of the Flow:
1. A user sends a request to the website (e.g., visiting a page).
2. Nginx receives the request and forwards it to the WordPress service.
3. WordPress generates the necessary content by interacting with the MariaDB database.
4. MariaDB stores and retrieves data requested by WordPress.
5. WordPress sends the generated web page back to Nginx.
6. Nginx delivers the web page to the user's browser.

In summary, Nginx handles web traffic, directs requests to WordPress, WordPress manages the application logic and content generation, and MariaDB stores and retrieves data for WordPress. Together, they form a well-coordinated system to serve dynamic content on the web.

# TLS and SSL Versions

## SSL 1.2:
- SSL 1.2 is an outdated and insecure version of the SSL protocol.
- Known vulnerabilities make it unsafe for use.
- Most modern web browsers and servers have deprecated support for SSL 1.2.

## SSL 1.3:
- SSL 1.3 is an improvement over SSL 1.2.
- Provides better security and performance.
- Not commonly used or supported in practice.
  
## TLS 1.2:
- TLS 1.2 is a widely adopted and secure version of the TLS protocol.
- Offers strong encryption and security features.
- Has been the predominant version for many years.
  
## TLS 1.3:
- TLS 1.3 is the latest and most secure version of the TLS protocol.
- Provides improved security, reduced latency, and enhanced performance.
- Many modern web servers and browsers support TLS 1.3.
- Recommended for use whenever possible.

In summary, TLS certificates are used to secure communication between clients and servers. SSL 1.2 is outdated and insecure, SSL 1.3 is an improvement but not widely used, TLS 1.2 is widely adopted and secure, and TLS 1.3 is the latest and most secure version. It's crucial to use the latest TLS version supported by both the server and the client for the best security practices.



# Persistence in Docker with Volumes

Persistence in Docker is achieved through the use of volumes. Volumes are the preferred mechanism for persisting data generated by and used by Docker containers. They are completely managed by Docker.

In your `docker-compose.yml` file, you have defined two volumes: `mariadb_data` and `wordpress_data`. These volumes are mapped to specific directories in your containers:

- `mariadb_data` is mapped to `/var/lib/mysql` in your MariaDB container. This is where MariaDB stores its data files.
- `wordpress_data` is mapped to `/var/www/html` in your WordPress container. This is where WordPress stores its files.

When you stop and restart your containers, the data in these volumes is preserved. This is because the volumes are stored on the host machine, outside of the containers. Even if the containers are destroyed and recreated, as long as the new containers use the same volumes, they will have access to the same data.

In your `Makefile`, you have commands to remove the contents of these volumes (`sudo rm -rf /home/abaiao-r/data/mysql/*` and `sudo rm -rf /home/abaiao-r/data/wordpress/*`). Be careful with these commands, as they will delete your persistent data.

To guarantee persistence, you should:

- Avoid running these `rm -rf` commands unless you want to delete your data.
- Ensure that your `docker-compose.yml` file correctly maps the volumes to the correct directories in your containers.
- When you stop your containers, use `docker-compose down` without the `-v` option. The `-v` option would remove the volumes and delete your data.

After restarting your virtual machine and running `docker-compose up`, your WordPress and MariaDB containers should have access to the same data as before the restart, ensuring persistence.
