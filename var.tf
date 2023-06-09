variable "credentials_file" {
  type        = string
  description = "Path to the Google Cloud service account key JSON file"
  default     = "./credentials.json"
}

variable "bucket_name" {
  type        = string
  description = "The name of the bucket."
  default     = "bucket-for-career-task"
}

variable "bucket_name" {
  type        = string
  description = "The type of the bucket."
  default     = "STANDARD"
}

variable "namespace" {
  type        = string
  description = "The namespace for the resources."
  default     = "nginx-namespace"
}

variable "database_instance_name" {
  type        = string
  description = "The name of the database instance."
  default     = "db-instance"
}

variable "database_version" {
  type        = string
  description = "The version of the database."
  default     = "MYSQL_5_7"
}

variable "database_instance_tier" {
  type        = string
  description = "The tier of the database instance."
  default     = "db-f1-micro"
}

variable "database_name" {
  type        = string
  description = "The name of the database."
  default     = "task-database"
}

variable "project_name" {
  type        = string
  description = "The name of the project."
  default     = "scrapper-335714"
}

variable "region" {
  type        = string
  description = "The region where the resources will be created."
  default     = "us-central1"
}

variable "availability_zone" {
  type        = string
  description = "The availability zone for the resources."
  default     = "us-central1-a"
}
