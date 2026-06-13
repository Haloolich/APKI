terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0"
    }
  }
}

provider "docker" {}

resource "docker_image" "apache" {
  name         = "my-apache"
  keep_locally = false
}

resource "docker_container" "apache" {
  name  = "apache_container"
  image = docker_image.apache.image_id
  ports {
    internal = 80
    external = 8080
  }
}
