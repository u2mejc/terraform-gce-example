variable "MOD_METADATA_SCRIPT" {
}

resource "google_compute_instance" "terraform-dokku-instance" {
  name         = "terraform-dokku-instance"
  machine_type = "g1-small"
  zone         = "${var.MOD_REGION}-a"

  disk {
    image = "ubuntu-1404-trusty-v20160627"
    type = "pd-ssd"
    size = "10" # ie 10GB
    auto_delete = true
  }

  network_interface {
    subnetwork = "${google_compute_subnetwork.terraform_subnet.name}"
    access_config {
      # Ephemeral
    }
  }

  metadata_startup_script = "${var.MOD_METADATA_SCRIPT}"
}
