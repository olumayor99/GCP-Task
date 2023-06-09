resource "google_storage_bucket" "career_bucket" {
  name          = var.bucket_name
  storage_class = var.bucket_type
}

resource "google_storage_bucket_object" "career_file" {
  name   = "example.txt"
  bucket = google_storage_bucket.career_bucket.name
  source = "./example.txt"
}
