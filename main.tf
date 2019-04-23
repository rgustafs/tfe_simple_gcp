 provider "google" {
}

  resource "google_compute_instance" "simple" {
  name         = "${var.name}"
  machine_type = "${var.machine_type}"
  zone         = "${var.zone}"

  boot_disk {
    initialize_params {
      image = "${var.image}"
    }
  }

  network_interface {
    network = "default"

    access_config {
      // Ephemeral IP
    }
  }
  metadata {
  ssh-keys = "${var.ssh_user}:${var.ssh_pub_key}"
}

resource "google_compute_firewall" "default" {
  name    = "test-firewall"
  network = "test2"

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = ["22", "80"]
  }

  source_tags = ["web"]
}

#resource "google_compute_network" "default" {
#  name = "test_network"
#}
}
