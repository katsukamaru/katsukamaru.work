resource "google_dns_managed_zone" "katsukamaru_work" {
  name        = "work"
  dns_name    = "katsukamaru.work."
}

resource "google_dns_record_set" "development" {
  managed_zone = "${google_dns_managed_zone.katsukamaru_work.name}"
  name         = "${google_dns_managed_zone.katsukamaru_work.dns_name}"
  type         = "A"
  ttl          = 300
  rrdatas      = [
    "${google_compute_address.development.address}"
  ]
}
