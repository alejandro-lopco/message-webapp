terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.1"
    }
  }
}

provider "docker" {}

resource "docker_image" "webapp-docker_image" {
    name         = "flask-msg-webapp"
    build {
        context = "."  # Path to the directory containing the Dockerfile
        tag     = ["python-flask-msg-webapp:3.12-alpine"]
    }

}

resource "docker_volume" "webapp-docker_volume" {
    name = "cont-flask-webapp"
}

resource "docker_container" "webapp-docker_container" {
    image = docker_image.webapp-docker_image.image_id
    name  = "flask-webapp"
    ports {
        internal = 5000
        external = 5000
    }
    volumes {
        container_path = "/var/app"
        volume_name = docker_volume.webapp-docker_volume.name
    }
}