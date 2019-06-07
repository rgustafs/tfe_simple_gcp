provider "google" {
  region      = "${var.region}"
  project     = "${var.project_name}"
}
  resource "google_compute_instance" "simple" {
  name         = "${var.name}"
  machine_type = "${var.machine_type}"
  zone         = "${var.zone}"
  allow_stopping_for_update = "true"

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
}

resource "google_compute_firewall" "ssh" {
  name    = "${var.name}-firewall-ssh"
  network = "default"

  allow {
    protocol = "tcp"
    ports    = ["443"]
  }

  target_tags   = ["${var.name}-firewall-ssh"]
  source_ranges = ["0.0.0.0/0"]
}

resource "google_compute_firewall" "web" {
  name    = "${var.name}-firewall-web"
  network = "default"

  allow {
    protocol = "tcp"
    ports    = ["80"]
  }

  target_tags   = ["${var.name}-firewall-web"]
  source_ranges = ["0.0.0.0/0"]
}
