data "aap_job_template" "deploy_web_server" {
  name              = "BronDeployWebserver"
  organization_name = var.organization_name
}

data "aap_job_template" "deploy_web_site" {
  name              = "BronDeployWebsite"
  organization_name = var.organization_name
}

resource "aap_inventory" "bron_tf_inventory" {
  name              = "${var.instance_name_prefix}-TF-Inventory"
  description       = "Terraform-generated inventory"
  organization_name = "TechXchangeNL"
}

# Add the new EC2 instance to the inventory
resource "aap_host" "my_host" {
  for_each     = { for idx, instance in aws_instance.web_server : idx => instance }
  inventory_id = aap_inventory.bron_tf_inventory.id
  groups = toset([resource.aap_group.my_group.id])
  name         = each.value.tags.Name
  description  = "Host provisioned by HCP Terraform"
  variables    = jsonencode({
    ansible_user = "ec2-user"
    ansible_host = each.value.public_ip
    #public_ip    = each.value.public_ip
    #target_hosts = each.value.public_ip
  })
}

# Create some infrastructure - inventory group - that has an action tied to it
resource "aap_group" "my_group" {
  name = "role_webserver"
  inventory_id = aap_inventory.bron_tf_inventory.id
}

resource "aap_job" "deploy_web_server" {
  inventory_id = aap_inventory.bron_tf_inventory.id
  job_template_id = data.aap_job_template.deploy_web_server.id
  wait_for_completion                 = true
  wait_for_completion_timeout_seconds = 180
  triggers = {
    "aap_job_run_timestamp":timestamp()
  }
  depends_on = [
    aap_host.my_host,
    aap_group.my_group
  ]
}

resource "aap_job" "deploy_web_site" {
  inventory_id = aap_inventory.bron_tf_inventory.id
  job_template_id = data.aap_job_template.deploy_web_site.id
  wait_for_completion                 = true
  wait_for_completion_timeout_seconds = 180

  triggers = {
    "aap_job_run_timestamp":timestamp()
  }

  depends_on = [
    aap_job.webserver
  ]
}
