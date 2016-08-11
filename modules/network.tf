resource "google_compute_network" "terraform_net" {
  name       = "terraform-net"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "terraform_subnet" {
  name          = "terraform-subnet"
  ip_cidr_range = "192.168.0.0/24"
  network       = "${google_compute_network.terraform_net.self_link}"
  region        = "${var.MOD_REGION}"
}


resource "google_compute_firewall" "terraform_fw_rules" {
  name    = "terraform-fw-rules"
  network = "${google_compute_network.terraform_net.name}"

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = ["80", "443", "22"]
  }
}
