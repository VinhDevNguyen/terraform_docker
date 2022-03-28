terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "2.16.0"
    }
  }
}
provider "docker" {
  host = "npipe:////.//pipe//docker_engine"
}

resource "docker_image" "flask" {
  name = "flask"
  build {
    path = "../"
    tag  = ["flask:latest"]
  }
}

resource "docker_container" "flask" {
  image = docker_image.flask.latest
  name  = "WebappFlask"
  ports {
    internal = 80
    external = 8000
  }
}
