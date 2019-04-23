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

  resource "google_compute_firewall" "default" {
    name    = "test-firewall"
    network = "${google_compute_network.default.name}"

    allow {
      protocol = "icmp"
    }

    allow {
      protocol = "tcp"
      ports    = ["80", "8080", "1000-2000"]
    }

    source_tags = ["web"]
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

resource "google_compute_network" "default" {
  name = "test-network"
}

#resource "google_compute_network" "default" {
#  name = "test_network"
#}
}
