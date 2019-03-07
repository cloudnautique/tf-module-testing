data "template_file" "leader_userdata" {
  template = "${file("${path.module}/files/userdata.leader.tmpl")}"

  vars = {
    cluster_registration_command = "${var.cluster_registration_command}"
  }
}

data "google_compute_image" "this" {
  family  = "${var.gcp_image_family}"
  project = "${var.gcp_image_project}"
}

module "gce_leader" {
  source = "github.com/matti/terraform-google-compute-instance"

  amount       = "${var.cluster_leader_count}"
  region       = "${var.gcp_region}"
  name_prefix  = "${var.cluster_name_prefix}"
  machine_type = "${var.gcp_machine_type}"
  disk_size    = "40"
  disk_image   = "${data.google_compute_image.this.self_link}"
  user_data    = "${data.template_file.leader_userdata.rendered}"
}
