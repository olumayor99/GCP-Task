resource "google_sql_database_instance" "career" {
  name             = "career-db-instance"
  database_version = "MYSQL_5_7"
  region           = var.region
  tier             = var.tier

  deletion_protection = false // I set this to false because this is a test task and I will delete it later.

  settings {
    backup_configuration {
      enabled = true
    }

    ip_configuration {
      ipv4_enabled    = true
      require_ssl     = false
      authorized_ipv4_networks = ["0.0.0.0/0"]
    }

    location_preference {
      zone = var.availability_zone
    }
  }
}

resource "google_sql_database" "career" {
  name     = "career-db"
  instance = google_sql_database_instance.career.name
  charset  = "utf8"
  collation = "utf8_general_ci"
}
