terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.2"
    }
  }
}

provider "docker" {}

resource "docker_image" "proxy" {
  name = "nginx:latest"
}

resource "docker_container" "nginx" {
  image = docker_image.proxy.name
  name  = "proxy"
  ports {
    internal = 80
    external = 8000
  }
}
