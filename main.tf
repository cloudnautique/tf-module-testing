provider "rancher2" {
  api_url    = "${var.api_url}"
  access_key = "${var.rancher2_access_key}"
  secret_key = "${var.rancher2_secret_key}"
  insecure   = "${var.rancher2_tls_insecure}"
}

provider "google" {
  credentials = "${var.gcp_credentials}"
  project     = "${var.gcp_project_id}"
  region      = "us-central1"
}

resource "rancher2_cluster" "test_cluster" {
  name        = "${var.cluster_name}"
  description = "testing"
  kind        = "rke"
}

module "gcp_instance_cluster" {
  source = "./modules/gce-custom-cluster"

  cluster_registration_command = "${rancher2_cluster.test_cluster.cluster_registration_token.0.node_command}"
  cluster_name_prefix          = "${var.cluster_name}"
}

output "registration_tokens" {
  value = "${rancher2_cluster.test_cluster.cluster_registration_token.0.node_command}"
}
