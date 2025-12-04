##############################################################################
# Variables File
#
# Here is where we store the default values for all the variables used in our
# Terraform code. If you create a variable with no default, the user will be
# prompted to enter it (or define it via config file or command line flags.)

# TFC Workspace ID for inventory naming
variable "TFC_WORKSPACE_ID" {}

variable "organization_name" {
  description = "The organization in AAP and HCP Terraform"
  default     = "TechXchangeNL"
}

variable "region" {
  description = "The region where the resources are created."
  default     = "eu-north-1"
}

variable "instance_name_prefix" {
  description = "Prefix for the name tag of EC2 instances (* Required)"
  type        = string
  default     = "abr"
}

variable "instance_type" {
  description = "Specifies the AWS instance type."
  default     = "t2.micro"
}

variable "security_group_name" {
  description = "Name for the security group"
  type        = string
  default     = "ec2-instances-sg"
}

variable "vpc_id" {
  description = "VPC ID to create resources in (if not provided, the default VPC will be used)"
  type        = string
  default     = null
}


variable "subnet_id" {
  description = "Subnet ID to launch the instances in (if not provided, a subnet from the default VPC will be used)"
  type        = string
  default     = null
}

variable "ssh_key_name" {
  description = "Name of the SSH key pair to use for the instances"
  type        = string
  default     = "techxchangenl"
}

variable "tags" {
  description = "Tags to apply to all resources"
  type        = map(string)
  default = {
    Terraform   = "true"
    Environment = "workshop"
    CostCenter  = "personal"
    OS          = "RHEL"
    Role        = "webserver"
  }
}

# Variable to store the URL for the AAP Event Stream
variable "aap_eventstream_url" {
  description = "The URL of the AAP Event Stream"
  type        = string
  default     = "https://caap.fvz.ansible-labs.de:443/eda-event-streams/api/eda/v1/external_event_stream/b0c1ea56-e512-4e24-adcc-3d31ddca336d/post/"
}

# Variable to store the AAP details
variable "aap_host" {
  description = "The URL of the Ansible Automation Platform instance"
  type        = string
  default     = "https://caap.fvz.ansible-labs.de:443"
}
