locals { cfg = yamldecode(file("../config/development.yml")) }
module vpc {
    source = "../_modules/vpc"
    cfg = local.cfg
}