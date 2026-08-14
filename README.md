# Inception

The goal of this project is to broaden knowledge of system administration, containerization, and DevOps fundamentals. It involves orchestrating a multi-container infrastructure using Docker and Docker Compose, building custom images from scratch for each service without relying on pre-built Docker Hub application images.

---

## 💡 Key Concepts
This project introduces the fundamentals of **containerization** and **Infrastructure as Code (IaC)**. It helps refine skills in microservice architecture, container isolation, secure web hosting over HTTPS/TLS, volume management for data persistence, and private inter-container networking.

---

## 🧠 Programming Concepts
* **Container Isolation & Orchestration:** Building lightweight, single-purpose containers using custom `Dockerfile`s and linking them with `docker-compose`.
* **Web Server Security & TLS/SSL:** Configuring Nginx to serve traffic strictly over port 443 using TLS v1.2/v1.3 with self-signed SSL certificates.
* **Database Administration & Service Integration:** Setting up MariaDB and connecting it securely to WordPress via FastCGI (`php-fpm`).
* **Data Persistence & Networking:** Configuring Docker volumes bound to specific host directories and managing isolated Docker bridge networks.

---

## 🛠️ Tech Stack
* **Containerization:** Docker, Docker Compose
* **Web Server:** Nginx (TLS v1.2 / v1.3)
* **Application & Database:** WordPress, PHP-FPM, MariaDB
* **Base System:** Debian / Alpine Linux
* **Build System & Automation:** Makefile, Bash Scripts
* **Security & Environment:** OpenSSL, `.env` configuration

---

## 🎯 Hard Skills
* **Custom Dockerfile Creation:** Writing clean scripts to install, configure, and initialize services from official base OS images.
* **Network Security & Access Control:** Restricting inter-container communication and exposing only secure endpoints to the host.
* **Data Management:** Implementing host-mapped volumes to guarantee data retention across container lifecycles.
* **Automated Infrastructure Deployment:** Managing the complete setup lifecycle (`build`, `up`, `down`, `clean`, `fclean`) using a Makefile.

---

## 🤝 Soft Skills
* **DevOps Best Practices:** Following principles of reproducible builds, secure credential management, and service isolation.
* **System Troubleshooting:** Debugging container build errors, startup execution order, network routes, and directory permissions.
* **Rigor & Compliance:** Adhering strictly to 42's Inception guidelines (no infinite loop hacks, proper process management with PID 1).

---

## 📁 Project Structure

```text
.
├── Makefile
└── srcs/
    ├── .env
    ├── docker-compose.yml
    └── requirements/
        ├── mariadb/
        │   ├── Dockerfile
        │   ├── conf/
        │   └── tools/
        ├── nginx/
        │   ├── Dockerfile
        │   ├── conf/
        │   └── tools/
        └── wordpress/
            ├── Dockerfile
            ├── conf/
            └── tools/
