<login1>[, <login2>[, <login3>[...]]].
- **Description**
- **Instructions**
  1) git clone git@vogsphere.42malaga.com:vogsphere/intra-uuid-d721f7da-42b3-455b-91f1-287dc214854c-7387286-stitovsk inception
  2) cd inception
  3) make
  - Useful commands:
    **docker build -t <image_name>** - Build a Docker image from a Dockerfile in the current directory and tag it with a name.
    **docker build --no-cache -t <image_name>** - Build a Docker image without using the cache.
    **docker build -f <dockerfile_name> -t <image_name>** - Build a Docker image using a specified Dockerfile.
    **docker system prune** - Remove all *unused* Docker resources, including containers, images, networks, and volumes.
    **docker container prune** - Remove all *stopped* containers.
    **docker image prune** - Remove *unused* images.
    **docker volume prune** - Remove *unused* volumes.
    **docker network prune** - Remove *unused* networks.
    
    
- **Resourses**
- **Project Description**
  - Virtual Machines vs Docker
  - Secrets vs Environment Variables
  - Docker Network vs Host Network
  - Docker Volumes vs Bind Mounts
