terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0"
    }
  }
}

provider "docker" {
  host = "unix:///var/run/docker.sock"
}

resource "docker_image" "cloud_platform_app" {
  name = "cloud-platform-app:1.2"

  build {
    context    = ".."
    dockerfile = "../Dockerfile"
  }
}

resource "docker_container" "cloud_platform_app" {
  name  = "terraform-cloud-platform"
  image = docker_image.cloud_platform_app.image_id

  ports {
    internal = 5000
    external = 5001
  }
}