resource "google_dns_record_set" "development" {
  managed_zone = "work"
  name         = "katsukamaru.work."
  type         = "A"
  ttl          = 300
  rrdatas      = [
    "${google_compute_address.development.address}"
  ]
}
