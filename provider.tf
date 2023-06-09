# Define the provider for Google Cloud Platform
provider "google" {
  // credentials = file(var.credentials_file)
  project     = "career-project"
  region      = "us-central1"
}

# Define the Google Kubernetes Engine (GKE) provider
terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 3.0"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.4"
    }
  }
}