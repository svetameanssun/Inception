
# User Documentation

## Overview

This project provides a containerized web stack composed of:

* **NGINX** — Web server handling HTTPS requests
* **WordPress** — PHP application (via PHP-FPM)
* **MariaDB** — Database for WordPress

All services run in isolated Docker containers and communicate through a private network.

---

## Start the Project

```bash
make
```

---

## Stop the Project

```bash
make down
```

---

## Restart the Project

```bash
make restart
```

---

## Access the Website

Open a browser and go to:

```text
https://regea-go.42.fr
```

---

## Access the Admin Panel

```text
https://regea-go.42.fr/wp-admin
```

---

## Credentials

Credentials are (or should be) stored in:

```text
srcs/.env
```

This includes:

* Database users and passwords
* Wordpress users and passwords
* Other information, such as domain name, user and volume paths

---

## Verify Services

### Check running containers

```bash
docker ps
```

---

### Check logs

```bash
make logs
```

---

### Check specific service

```bash
docker logs nginx
docker logs wordpress
docker logs mariadb
```

---

### Check volumes

```bash
docker volume ls
docker volume inspect <volume_name>
```

---

### Check network

```bash
docker network ls
```
