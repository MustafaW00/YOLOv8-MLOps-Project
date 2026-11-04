variable "cluster_name" {
  description = "name of eks cluster"
  type        = string
}

variable "kubernetes_version" {
  description = "version of kubernetes cluster"
  type        = string
}

variable "private_subnet_ids" {
  description = "list of private subnets for the nodes"
  type        = list(string)
}

variable "node_group_name" {
  description = "name of node group"
  type        = string
}


