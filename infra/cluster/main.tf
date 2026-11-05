module "vpc" {
  source = "../modules/vpc"

  vpc_cidr = "10.0.0.0/16"

  azs = ["eu-west-1a", "eu-west-1b", "eu-west-1c"]

  public_subnet = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]

  private_subnet = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]
}


module "eks" {
  source = "../modules/eks"

  node_group_name = "node-group"

  kubernetes_version = "1.35"

  cluster_name = "mlops-cluster"

  private_subnet_ids = module.vpc.private_subnet_ids
}
