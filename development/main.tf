locals { cfg = yamldecode(file("../config/development.yml")) }
module vpc {
    source = "../_modules/vpc"
    cfg = local.cfg
}

module "ec2" {
    source = "../_modules/ec2"
    vpc_id = module.vpc.vpc_id
    private_subnets_ids = module.vpc.private_subnets_ids
    public_subnets_ids = module.vpc.public_subnets_ids
    cfg = local.cfg
}
  