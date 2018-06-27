resource "google_compute_network" "katsumaru-network" {
  name                    = "katsumaru-network"
  auto_create_subnetworks = "true"
  description = "managed by terraform"
}

