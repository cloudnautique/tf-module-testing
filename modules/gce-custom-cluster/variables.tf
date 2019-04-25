variable "cluster_registration_command" {}

variable "cluster_leader_count" {
  default = 1
}

variable "cluster_worker_count" {
  default = 0
}

variable "gcp_region" {
  default = "us-central1"
}

variable "gcp_machine_type" {
  default = "n1-standard-2"
}

variable "gcp_image_family" {
  default = "ubuntu-1804-lts"
}

variable "gcp_image_project" {
  default = "ubuntu-os-cloud"
}

variable "cluster_name_prefix" {}
