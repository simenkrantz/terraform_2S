provider "google" {
  # TODO -- see GCP tutorial
}

resource "google_compute_network" "vpc_network" {
  name = "terraform_network"
}