terraform {
  backend "s3"{

  }
}

provider "aws"{
    region = var.aws_region
}

module "network"{
    source = "../../modules/network"
    env = var.env
    vpc_cidr = var.vpc_cidr
    enable_ng = var.enable_ng

}

module "compute"{
    source = "../../modules/compute"
    env = var.env
    subnet_ids = module.network.private_app_subnet_ids
    vpc_id = module.network.vpc_id
    instance_type = var.instance_type
    min = var.asg_min
    desired = var.asg_desired
    max = var.asg_max
}

module "database"{
    source = "../../modules/database"
    create_rds = var.create_rds
    env = var.env
    subnet_ids = module.network.private_db_subnet_ids
    vpc_id = module.network.vpc_id
    db_password = var.db_password
}

module "monitoring"{
    source = "../../modules/monitoring"
    asg_name = module.compute.asg_name
}