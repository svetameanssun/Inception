*This project has been created as part of the 42 curriculum by stitovsk.*

# Inception

## Description

The goal of this project is to introduce system administration and containerization using Docker.
It consists of setting up a small infrastructure composed of multiple services running in separate containers and orchestrated with Docker Compose.

The project includes:

* A web server using NGINX (with HTTPS)
* A WordPress application running with PHP-FPM
* A MariaDB database
* Persistent storage using volumes
* Secure configuration

---

## Instructions

This project has a few requirements in order to deploy it:

* To download it, just clone the repository into the folder of your choice
* A Makefile is provided with the "docker compose" commands to run it. Either use the docker compose commands, or use the make features provided in the file. Running "make" will execute "build" and "up" commands from docker compose.
* A few requirements are needed before running the "make" command. Because sensitive information is not uploaded into the git repository, this information is stored in the local VM outside the repository. We will first need to create the file ".env" using create. 
* Once it is deployed and running, we can access the the Wordpress site through the Nginx server through our preferred web browser, using the URL  https://stitovsk.42.fr


---

## Project Design & Technical Choices

### Docker Usage

Docker is used to:

* Isolate services
* Ensure reproducibility
* Simplify deployment
* Avoid dependency conflicts

Each service runs in its own container:

* NGINX → handles HTTPS and routing, it acts as a proxy
* WordPress → PHP application executed via PHP-FPM
* MariaDB → database

---

### Virtual Machines vs Docker

| Virtual Machines     | Docker                   |
| -------------------- | ------------------------ |
| Full OS per instance | Lightweight containers   |
| High resource usage  | Efficient resource usage |
| Slow startup         | Fast startup             |
| Strong isolation     | Process-level isolation  |

* Design choice: we use Docker to set up the infrastructure because it is lightweight, it is reproducible and faster. 

---

### Secrets vs Environment Variables

| Secrets               | Environment Variables     |
| --------------------- | ------------------------- |
| Encrypted storage     | Plain text                |
| More secure           | Simpler                   |
| Requires Docker Swarm | Works with docker-compose |

In this project:

* Environment variables are used for simplicity
* Docker secrets are acknowledged as a more secure alternative for production, but its usage depends on Docker Swarm, which is not used in this project.

---

### Docker Network vs Host Network

| Docker Network          | Host Network               |
| ----------------------- | -------------------------- |
| Isolated network        | Uses host network directly |
| Service name resolution | No isolation               |
| Safer                   | Less secure                |

The Docker network has been chosen for this project because:

* It allows communication between containers in a simpler way
* It provides isolation from the host

---

### Docker Volumes vs Bind Mounts

| (Named) Volumes   | Bind Mounts         |
| ----------------- | ------------------- |
| Managed by Docker | Linked to host path |
| Less control      | Full control        |
| Portable          | Host-dependent      |

This project uses **named volumes** to:

* Ensure data persistence across container restarts
* Allow Docker to manage storage independently of the host filesystem
* Named volumes are used because bind mounts are forbidden for this project.

---

## Resources

* Docker and Docker Compose courses (Coursera, Udemy)
* Youtube videos (TechWorld with Nana, KodeKloud)

### Documentation

* Docker Documentation: https://docs.docker.com/
* Docker Compose: https://docs.docker.com/compose/
* NGINX: https://nginx.org/en/docs/
* PHP-FPM: https://www.php.net/manual/en/install.fpm.php
* MariaDB: https://mariadb.org/documentation/

---

### AI Usage

AI tools were used for:

* Understanding Docker / Docker Compose concepts and commands
* Understanding services (nginx, wordpress and mariadb) and their configuration
* Debugging container issues (permissions, versions, configuration)
* Improving configuration files
* Preparing for evaluation (concept explanations, command testing, information checking)
* Redacting this README and other docs DEV_DOC.md and USER_DOC.md
