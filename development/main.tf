module VPC {
    source = "./VPC"
    subnets_azs = var.subnets_azs
}

module compute {
    source = "./compute"
    vpc_id = module.VPC.vpc_id
    public_subnets_ids = module.VPC.public_subnets_ids
    private_subnets_ids = module.VPC.private_subnets_ids
}

module cloudwatch {
    source = "./cloudwatch"
    private_instances_ids = module.compute.instances_ids
}