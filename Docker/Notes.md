🧠 What is Docker?

Docker is a platform that allows developers to package applications and their dependencies into containers — lightweight, portable environments that run consistently on any system.

🧩 Why use Docker?

Eliminates “works on my machine” issues

Runs the same across development, staging, and production

Simplifies dependency management

Easily scalable and reproducible

🧱 Core Concepts
Term	Description
Image	A snapshot or template used to create containers. Example: python:3.10, nginx:latest.
Container	A running instance of an image — like a lightweight virtual machine.
Dockerfile	A script with instructions to build an image.
Docker Hub	A cloud-based registry where you can find and share images.
Volume	A persistent data storage method for containers.
Network	Connects multiple containers (e.g., Flask app ↔ Redis).
⚙️ Basic Docker Commands
Command	Description
docker --version	Check Docker version
docker images	List all images
docker ps	List running containers
docker ps -a	List all containers (including stopped)
docker build -t appname .	Build an image from a Dockerfile
docker run -p 5000:5000 appname	Run a container and map ports
docker exec -it <container_id> bash	Open a shell inside a running container
docker stop <container_id>	Stop a container
docker rm <container_id>	Remove a stopped container
docker rmi <image_id>	Remove an image
docker logs <container_id>	View container logs


📦 Dockerfile — Example for Flask App

# Use a lightweight Python image
FROM python:3.10-slim

# Set working directory
WORKDIR /app

# Copy dependencies and install them
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy application code
COPY . .

# Expose Flask port
EXPOSE 5000

# Run the Flask app
CMD ["python", "app.py"]

🔹 Build and Run
docker build -t flask-app .
docker run -p 5000:5000 flask-app

⚓ Docker Compose — Multi-Container Setup

When your app needs multiple services (like Flask + Redis + Nginx), Docker Compose lets you manage them together.

Example docker-compose.yml
version: "3.9"

services:
  flask_app:
    build: .
    container_name: flask_app
    ports:
      - "5000:5000"
    volumes:
      - .:/app
    depends_on:
      - redis

  redis:
    image: redis:alpine
    container_name: redis
    ports:
      - "6379:6379"

Commands
Command	Description
docker-compose up	Start all services
docker-compose up --build	Rebuild and start all services
docker-compose down	Stop and remove containers
docker-compose logs	View logs from all containers
docker-compose ps	List running containers in the Compose project

🧰 Volumes & Networks

Volumes store data outside containers (so it’s not lost when containers stop).
Example:

volumes:
  - ./data:/var/lib/mysql


Networks let containers talk to each other.
Example:

networks:
  app-network:
    driver: bridge

🚀 Docker Workflow Summary

Write a Dockerfile → defines how to build your app image

Build the image

docker build -t myapp .


Run the container

docker run -p 5000:5000 myapp


(Optional) Use Docker Compose for multiple services

docker-compose up --build

🧩 Real Example (Flask + Redis)
docker-compose up --build


This will:

Start your Flask app container (flask_app)

Start Redis container (redis)

Automatically connect them via Docker’s internal network

Access at:
👉 http://localhost:5000

💡 Quick Tips

Use .dockerignore to exclude unnecessary files (like venv/, node_modules/, .git/)

Keep Dockerfiles small and clean for faster builds

Use named volumes to persist database data

Use multi-stage builds for production optimization

