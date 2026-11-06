terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
    helm = {
      version = "~> 3.0"
      source  = "hashicorp/helm"
    }
  }


  required_version = ">=1.5"

  backend "s3" {
    bucket       = "terraform-state-bucket-mustafawarsamee"
    key          = "mlops/yolo/cluster/terraform-state"
    region       = "eu-west-1"
    use_lockfile = true
  }
}

provider "aws" {
  region = "eu-west-1"
}

provider "helm" {
  kubernetes = {
    host                   = module.eks.cluster_endpoint
    cluster_ca_certificate = base64decode(module.eks.cluster_ca)
    exec = {
      command     = "aws"
      api_version = "client.authentication.k8s.io/v1beta1"
      args        = ["eks", "get-token", "--cluster-name", module.eks.cluster_name]
    }
  }

}
