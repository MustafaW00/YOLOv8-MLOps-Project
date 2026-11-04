output "cluster_arn" {
  value = aws_eks_cluster.main.name
}

output "cluster_arn" {
  value = aws_eks_cluster.main.endpoint
}

output "cluster_arn" {
  value = aws_eks_cluster.main.certificate_authority[0].data
}


