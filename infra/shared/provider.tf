terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
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
