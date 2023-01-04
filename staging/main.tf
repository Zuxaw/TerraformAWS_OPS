locals { cfg = yamldecode(file("../config/staging.yml")) }
module vpc {
    source = "../_modules/vpc"
    cfg = local.cfg
}

module "ec2-ha" {
    source = "../_modules/ec2-ha"
    cfg = local.cfg
    vpc_id = module.vpc.vpc_id
    public_subnets_ids = module.vpc.public_subnets_ids
    private_subnets_ids = module.vpc.private_subnets_ids
}

module "lambda" {
    source = "../_modules/lambda"
    url = module.ec2-ha.public_ip
    cron_rate = local.cfg.lambda.cron_rate
    cfg = local.cfg
}