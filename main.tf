terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0"
    }
  }
}

provider "docker" {}

# ---------------------------
# Create Docker Network
# ---------------------------
resource "docker_network" "app_network" {
  name = "my_app_network"
}

# ---------------------------
# PostgreSQL Container
# ---------------------------
resource "docker_container" "db" {
  name  = "postgres_db"
  image = "postgres:15"

  env = [
    "POSTGRES_USER=admin",
    "POSTGRES_PASSWORD=admin",
    "POSTGRES_DB=mydb"
  ]

  networks_advanced {
    name = docker_network.app_network.name
  }

  ports {
    internal = 5432
    external = 5432
  }
}

# ---------------------------
# App Container (Nginx for now)
# ---------------------------
resource "docker_container" "app" {
  name  = "web_app"
  image = "nginx:latest"

  networks_advanced {
    name = docker_network.app_network.name
  }

  ports {
    internal = 80
    external = 8080
  }

  depends_on = [docker_container.db]
}
