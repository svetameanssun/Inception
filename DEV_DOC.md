# Developer Documentation

## Prerequisites

* Docker
* Docker Compose
* Linux environment (recommended as a VM)

---

## Project Structure

```text
.
├── Makefile
├── srcs/
│   ├── docker-compose.yml
│   ├── .env
│   └── requirements/
│       ├── nginx/
│       ├── wordpress/
│       └── mariadb/
```

---

## Environment Setup

* You will need a Linux environment, Docker and Docker Compose to run this project 
* Once confirmed, download the repository as it follows: 

```bash
git clone <repository_url> inception && cd inception
```

* Then, create the .env file in the srcs/ folder and edit values as needed
* Create a folder for the ssl certificates:

```bash
mkdir -p ./requirements/nginx/tools/ssl/certs
mkdir -p ./requirements/nginx/tools/ssl/private
```

* Generate a ssl key:

```bash
openssl req -x509 -nodes -days 365 \
-newkey rsa:2048 \
-keyout server.key \
-out server.crt \
-subj "/C=ES/ST=Malaga/L=Malaga/O=42/OU=42/CN=stitovsk.42.fr"
```
and store them in the folders aforementioned (server.key into the private folder, and server.crt into the cert folder)
 
---

## Build and Run


### Build containers

```bash
make build
```

---

### Start containers

```bash
make up
```

---

### Full and automatic setup

```bash
make
```

---

## Container Management

### List containers

```bash
docker ps
```

---

### Access container

```bash
docker exec -it <container_name> bash
```

---

### View logs

```bash
make logs
```

---

### Stop containers

```bash
make down
```

---

## Volume Management

### List volumes

```bash
docker volume ls
```

---

### Inspect volume

```bash
docker volume inspect <volume_name>
```

---

### Remove volumes

```bash
docker volume rm <volume_name>
```

---

## Data Persistence

Data is stored using **named volumes**:

* WordPress → `/var/www/html`
* MariaDB → `/var/lib/mysql`

These volumes are configured to store data in:

```text
/home/<login>/data/
```

Which is created automatically when the project is built. 

Note: it is possible that you need to change the path into the Makefile configuration

---

## Networking

All services are connected through a Docker bridge network:

* Containers communicate using service names
* Example: `wordpress → mariadb`

---

## Common Commands

```bash
make up        # start
make down      # stop
make clean     # remove everything
make re        # rebuild from scratch
make logs      # view logs
```

---

## Debugging

### Check container status

```bash
docker ps -a
```

---

### Inspect container

```bash
docker inspect <container_name>
```

---

### Check logs

```bash
docker logs <container_name>
```

---

### Enter container

```bash
docker exec -it <container_name> bash
```
