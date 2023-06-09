# Create a GKE cluster
resource "google_container_cluster" "career_cluster" {
  name               = "career-cluster"
  location           = var.region
  initial_node_count = 3

  master_auth {
    username = "admin"               //Very bad practice, only doing this because of the time limit. Use secrets instead.
    password = "admin"

    client_certificate_config {
      issue_client_certificate = false
    }
  }
}

# Create GCE instances as cluster nodes
resource "google_container_node_pool" "career_node_pool" {
  name       = "career-node-pool"
  location   = var.region
  cluster    = google_container_cluster.career_cluster.name
  node_count = 3
  autoscaling {
    min_node_count = 1
    max_node_count = 5
  }
  management {
    auto_repair  = true
    auto_upgrade = true
  }
}

# Create a firewall rule for cluster traffic
resource "google_compute_firewall" "career_cluster_firewall" {
  name    = "career-cluster-firewall"
  network = "default"

  allow {
    protocol = "tcp"
    ports    = ["80", "443", "8080"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags   = [google_container_cluster.career_cluster.name]
}

# Create Persistent Disk
resource "google_compute_disk" "career_disk" {
  name  = "career-persistent-disk"
  type  = "pd-standard"
  size  = 100
  zone  = var.availability_zone
}

# Attach Persistent Disk to GKE cluster
resource "google_container_node_pool" "career_node_pool" {
  name       = "career-node-pool"
  location   = var.region
  cluster    = google_container_cluster.career_cluster.name
  node_count = 3
  autoscaling {
    min_node_count = 1
    max_node_count = 5
  }
  management {
    auto_repair  = true
    auto_upgrade = true
  }

  node_config {
    disk_size_gb = google_compute_disk.career_disk.size
    disk_type    = "pd-standard"
    disk_name    = google_compute_disk.career_disk.name
  }
}
