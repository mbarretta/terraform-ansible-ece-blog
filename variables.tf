#######################################################
#### Variables to configure (or be prompted about) ####
#######################################################

# Your IP address, so that you will be whitelisted against security groups
variable "trusted_network" {
  description = "CIDR formatted IP (<IP Address>/32) or Network that will be allowed administrative access"
}

# General name tag that will be given to spun up instances
variable "project_name" {
  description = "An idenfitying name used for names of cloud resources"
}

variable "aws_access_key" {
  description = "AWS access key"
}

variable "aws_secret_key" {
  description = "AWS secret key"
}

#######################################################
######### Variables you may want to configure #########
#######################################################

# Region to set up ece in
variable "aws_region" {
  default = "us-east-1"
}

# The name of the AMI in the AWS Marketplace
variable "aws_ami_name" {
  default = "CentOS Linux 7 x86_64 HVM*"
}

# The owner of the AMI
variable "aws_ami_owner" {
  default = "679593333241" # centos.org
}

# User to log in to instances and perform install
# This is dependent upon the AMI you use, so make sure these are in sync. For example, an Ubuntu AMI would use the ubuntu user
variable "remote_user" {
  default = "centos"
}

# Desired AZs, must have 3.
variable "zones" {
  type    = list(string)
  default = ["a","b","c"]
}

# Path to your public key, which will be used to log in to ece instances
variable "public_key" {
  default = "~/.ssh/id_rsa.pub"
}

# Path to your private key that matches your public from ^^
variable "private_key" {
  default = "~/.ssh/id_rsa"
}

#######################################################
#### Editable ECE installation-specific variables #####
#######################################################

# Ece version to be installed by ansible
# Must be supported by the ansible playbook
variable "ece-version" {
  default="2.4.3"
}

# ECE instances's VPC & Subnet cidr
variable "cidr" {
  default = "192.168.100.0/24"
}

# ECE instance type
variable "aws_instance_type" {
  default = "i3.xlarge"
}

# An additional volume that will be used by ECE, and its OS represented name. For i3 instances, this is nvme0n1.
# If you use a different instance type, this value will change, as well as the resource definition in servers.tf
variable "device_name" {
  default="nvme0n1"
}
