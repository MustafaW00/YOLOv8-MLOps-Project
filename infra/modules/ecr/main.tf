resource "aws_ecr_repository" "this" {
  for_each = toset(var.ecr_repos)
  name     = each.key

  image_tag_mutability = "IMMUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }

  tags = {
    Name = each.key
  }
}
