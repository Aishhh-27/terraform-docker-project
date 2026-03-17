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
# Network
# ---------------------------
resource "docker_network" "app_network" {
  name = "my_app_network"
}

# ---------------------------
# Volume (Persistent DB)
# ---------------------------
resource "docker_volume" "postgres_data" {
  name = "postgres_data"
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

  volumes {
    volume_name    = docker_volume.postgres_data.name
    container_path = "/var/lib/postgresql/data"
  }

  ports {
    internal = 5432
    external = 5432
  }
}

# ---------------------------
# Flask App Container
# ---------------------------
resource "docker_image" "flask_image" {
  name = "flask_app_image"

  build {
    context = "./app"
  }
}

resource "docker_container" "app" {
  name  = "flask_app"
  image = docker_image.flask_image.name

  networks_advanced {
    name = docker_network.app_network.name
  }

  ports {
    internal = 5000
    external = 8080
  }

  depends_on = [docker_container.db]
}
