locals { cfg = yamldecode(file("../config/production.yml")) }
module vpc {
    source = "../_modules/vpc"
    cfg = local.cfg
}