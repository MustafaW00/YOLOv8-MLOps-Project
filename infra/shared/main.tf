module "ecr" {
  source    = "../modules/ecr"
  ecr_repos = ["yolov8n-frontend", "yolov8n-backend"]
}

import {
  to = module.ecr.aws_ecr_repository.this["yolov8n-frontend"]
  id = "yolov8n-frontend"
}
import {
  to = module.ecr.aws_ecr_repository.this["yolov8n-backend"]
  id = "yolov8n-backend"
}
