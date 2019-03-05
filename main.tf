provider "rancher2" {
  api_url    = "${var.api_url}"
  access_key = "${var.rancher2_access_key}"
  secret_key = "${var.rancher2_secret_key}"
  insecure   = "${var.rancher2_tls_insecure}"
}

resource "rancher2_cluster" "test_cluster" {
  name        = "test-cluster-000"
  count       = 10
  description = "testing"
  kind        = "rke"
}
