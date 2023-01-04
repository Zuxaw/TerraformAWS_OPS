locals { cfg = yamldecode(file("../config/staging.yml")) }
module vpc {
    source = "../_modules/vpc"
    cfg = local.cfg
}