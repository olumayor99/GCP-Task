# Create Database instance
resource "google_sql_database_instance" "career" {
  name             = var.database_instance_name
  database_version = var.database_version
  region           = var.region

  deletion_protection = false // I set this to false because this is a test task and I will delete it later.

  settings {
    tier = var.database_instance_tier
    backup_configuration {
      enabled = true
    }

    ip_configuration {
      ipv4_enabled    = true
      require_ssl     = false
    }

    location_preference {
      zone = var.availability_zone
    }
  }
}

# Create Database
resource "google_sql_database" "career" {
  name     = var.database_name
  instance = google_sql_database_instance.career.name
  charset  = "utf8"
  collation = "utf8_general_ci"
}
