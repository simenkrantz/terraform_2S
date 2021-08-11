terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "3.5.0"
    }
  }
}

provider "google" {
  credentials = file(var.credentials_file)

  project = var.project
  region  = var.region
  zone    = var.zone
}

resource "google_compute_network" "vpc_network_1" {
  name                    = var.vpc_network_1_name
  auto_create_subnetworks = "false"
}

resource "google_compute_network" "vpc_network_2" {
  name                    = var.vpc_network_2_name
  auto_create_subnetworks = "false"
}

resource "google_compute_network_peering" "peering_1" {
  name         = var.peering_1_name
  network      = google_compute_network.vpc_network_1.id
  peer_network = google_compute_network.vpc_network_2.id
}

resource "google_compute_network_peering" "peering_2" {
  name         = var.peering_2_name
  network      = google_compute_network.vpc_network_2.id
  peer_network = google_compute_network.vpc_network_1.id
}
