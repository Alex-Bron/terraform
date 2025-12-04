terraform {
  required_version = ">= 1.0.0"
  
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = var.region
    default_tags {
    tags = {
      ManagedBy = "HCP Terraform"
    }
  }
}

# Configure the AAP Provider
provider "aap" {
  host = "https://caap.fvz.ansible-labs.de"
  token = var.AAP_TOKEN
}
