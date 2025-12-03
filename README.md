# Welcome to the HCP Terraform building blocks of the workshop

> [!IMPORTANT]  
> You should have received an invitation to the HCP Terraform organization name 'TechXchangeNL'.
> 
> Sign Up for HCP Terraform if you have not done already -> [here](https://developer.hashicorp.com/terraform/tutorials/cloud-get-started/cloud-sign-up#sign-up-for-hcp-terraform)

> ## Prerequisites
> - HCP Cloud Platform account -> [here](https://cloud.hashicorp.com)
> - GitHub account -> [here](https://github.com)
> - Internet access
> - 💳 to be able to deploy resources to AWS 😉. We are using Hugues's credit card during this workshop.

## Intro

## The basics
Where is HCP Terraform? -> [here](https://app.terraform.io)
- Login with your username and password
  - What is my username? -> Should be your email address you gave us or the username you used during the HCP Terraform Sign Up process
  - What is my password? -> It's in your mind or in a password manager

HCP Terraform has the notion of "Organizations". For this workshop an organization named 'TechXchangeNL' has been made and your HCP Terraform account should have access once you have accepted the invitation we have sent previously. Everything you do, will be done within that organisation.

This workshop has been designed such that **you** will need to do most of the work, signifying the word "work" in workshop 😉. 
This means we only have the absolute basics set up and you need to build all the components to make everything work.

The division of work between HCP Terraform and Ansible Automation Platform (as likely already explained to you):
- Terraform: Building up and changing infrastructure in the cloud, among which are RHEL10 servers
- AAP: Configure the RHEL10 servers to become a webserver serving a website

HCP Terraform has all the credentials needed to do it's thingy in the cloud of your choice: AWS 😉.
AAP will use the integrations with Terraform to be able to do it's thing on the provisioned infrastructure. AAP has no credentials for the cloud!

So what are the basics we have set up for you:
1. HCP Terraform Organization called 'TechXchangeNL'
2. HCP Terraform Project called 'Default Project'
3. AWS Credentials set at organization level
5. AAP Credentials set at organization level
6. GitHub repository which will be used to deploy EC2 instances to AWS

## Building Blocks
You need to create some building blocks in HCP Terraform for this workshop. This document explains what you need to make. When you are done, go back to the README.md in the workshop repo.

### Workspace
Working with Terraform involves managing collections of infrastructure resources, and most organizations manage many different collections.

HCP Terraform manages infrastructure collections with workspaces instead of directories. A workspace contains everything Terraform needs to manage a given collection of infrastructure, and separate workspaces function like completely separate working directories.

You need to create a workspace in HCP Terraform. The workspace contains the infrastructure building blocks for resources to be provisioned on AWS.

> [!NOTE]  
> For our convenience we put all the workspaces in one project. Please work on your own workspace which you will create yourself. 

### Workshop Tasks
- [ ] Get familiar with the HCP Terraform UI [here](https://app.terraform.io)
- [ ] Clone the following repository in your own GitHub account: [terraform](https://github.com/TechXchangeNL/terraform.git)
- [ ] Create a workspace using the VCS-driven workflow, see [here](https://developer.hashicorp.com/terraform/tutorials/cloud-get-started/cloud-create-vcs-workspace) for all the necessary steps but not all of them are needed :wink:
- [ ] **Ask yourself**: What other workflows does HCP Terraform support to create workspaces?
- [ ] Provision the EC2 instance(s) on AWS using your workspace from the HCP Terraform UI
- [ ] **Ask yourself**: Describe the resources we deployed using HCP Terraform?
- [ ] Change the instance_type from t3.micro to t3.large in the ec2_instances.tf file
- [ ] **Ask yourself**: Describe what happened?
- [ ] In HCP Terraform: Cleanup infrastructure (see below)
- [ ] :tada: You finished the HCP Terraform building blocks of the workshop if you completed successfully the previous tasks :tada:

## Cleanup

To help manage cloud costs effectively, we prefer you queue a destroy run to clean up the resources after you finish each scenario and when you finish the workshop. Hugues will be very 😃. You can do so by queuing a destroy run in the your previously created HCP Terraform workspace. 

Remember that to properly clean up the resources, each of the child workspaces must not have any **apply** or **destroy** runs currently in progress or pending.

To clean up all resources from your provisioned workspaces, follow these steps:

- In your provisioned workspace, navigate to the **Settings** tab on the left-side navigation panel
- Click on **Destruction and Deletion**
- Scroll down and click the red box labeled **Queue destroy plan**
- Enter the name of the workspace and confirm the destroy
