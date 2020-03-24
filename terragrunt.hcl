terraform {
  source = "git::git@github.com:terraform-aws-modules/terraform-aws-redshift.git?ref=v2.2.0"
}

include {
  path = find_in_parent_folders()
}

dependencies {
  paths = ["../vpc", "../security-group_1"]
}

dependency "vpc" {
  config_path = "../vpc"
}

dependency "security-group_1" {
  config_path = "../security-group_1"
}

###########################################################
# View all available inputs for this module:
# https://registry.terraform.io/modules/terraform-aws-modules/redshift/aws/2.2.0?tab=inputs
###########################################################
inputs = {
  # The name of the database to create
  # type: string
  cluster_database_name = "sunny-mako"

  # Custom name of the cluster
  # type: string
  cluster_identifier = "set-finch"

  # Password for master user
  # type: string
  cluster_master_password = "g9x3cjnIeUpk"

  # Master username
  # type: string
  cluster_master_username = "rat"

  # Node Type of Redshift cluster
  # type: string
  cluster_node_type = "dc2.large"

  # Number of nodes in the cluster (values greater than 1 will trigger 'cluster_type' of 'multi-node')
  # type: number
  cluster_number_of_nodes = 14

  # List of subnets DB should be available at. It might be one subnet.
  # type: list(string)
  subnets = dependency.vpc.outputs.redshift_subnets

  # A list of Virtual Private Cloud (VPC) security groups to be associated with the cluster.
  # type: list(string)
  vpc_security_group_ids = [dependency.security-group_1.outputs.this_security_group_id]

  
}
