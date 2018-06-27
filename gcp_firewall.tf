resource "google_compute_firewall" "development" {
  name    = "katsumaru-network-firewall"
  network = "${google_compute_network.katsumaru-network.name}"
  description = "managed by terraform"
  
  source_ranges = ["0.0.0.0/0"] 
  
  allow {
    protocol = "icmp"
  }
  
  allow {
    protocol = "tcp"
    ports = ["22","80","443"]
  }

  target_tags = ["development"] 
}
