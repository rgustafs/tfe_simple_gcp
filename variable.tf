variable "region" {
  description = "GCP region targeted"
  default = "europe-west1"
}

variable "project_name" {
  description = "GCP project targeted"
}

variable "name" {
  description = "Machine name"
}

variable "zone" {
  description = "GCP project name"
}

variable "machine_type" {
  description = "Machine type"
}

variable "image" {
  description = "Machine image"
}

variable "ssh_user" {
  description = "instance SSH user"
  default = "rgustafsson"
}

variable "ssh_pub_key" {
  description = "SSH public key to authorize"
}
