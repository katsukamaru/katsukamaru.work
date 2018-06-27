resource "google_compute_address" "development" {
  name         = "development"
  region       = "asia-northeast1"
}

resource "google_compute_instance" "instance" {
  name         = "katsumaru-instance"
  machine_type = "n1-standard-1"
  zone         = "asia-northeast1-c"
  description  = "Managed by Terraform"
  tags         = ["development"]

  disk {
    image = "centos-7"
  }

  disk {
    type        = "local-ssd"
    scratch     = true
    auto_delete = true
  }

  network_interface {
    access_config {
      nat_ip   = "${google_compute_address.development.address}"
    }

    subnetwork = "katsumaru-network"
  }

  service_account {
    scopes = ["userinfo-email", "compute-ro", "storage-ro", "bigquery", "monitoring"]
  }

  scheduling {
    on_host_maintenance = "MIGRATE"
    automatic_restart   = true
  }
}
