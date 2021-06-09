resource "aws_ecr_repository" "ecr-backend" {
  count = var.ecr-enable
  name = var.ecr-name
  image_tag_mutability = "MUTABLE"  

  image_scanning_configuration {
    scan_on_push = true
  }
}

resource "aws_ecr_lifecycle_policy" "ecr-backend" {
  count = var.ecr-enable
  repository = aws_ecr_repository.ecr-backend.0.name
  depends_on = [aws_ecr_repository.ecr-backend]

  policy = <<EOF
  {
    "rules": [
      {
        "rulePriority": 1,
        "description": "Keep last 15 images",
        "selection": {
          "tagStatus": "tagged",
          "tagPrefixList": ["dev"],
          "countType": "imageCountMoreThan",
          "countNumber": 15
        },
        "action": {
          "type": "expire"
        }
      },
      {
        "rulePriority": 2,
        "description": "Keep last 10 images",
        "selection": {
          "tagStatus": "tagged",
          "tagPrefixList": ["hml"],
          "countType": "imageCountMoreThan",
          "countNumber": 10
        },
        "action": {
          "type": "expire"
        }
      },
      {
        "rulePriority": 3,
        "description": "Keep last 5 images",
        "selection": {
          "tagStatus": "tagged",
          "tagPrefixList": ["prod"],
          "countType": "imageCountMoreThan",
          "countNumber": 5
        },
        "action": {
          "type": "expire"
        }
      },
      {
        "rulePriority": 4,
        "description": "Keep last 2 images",
        "selection": {
          "tagStatus": "untagged",
          "countType": "imageCountMoreThan",
          "countNumber": 2
        },
        "action": {
          "type": "expire"
        }
      }
    ]
  }
  EOF
}

resource "aws_ecr_repository_policy" "ecr-backend" {
  count = var.ecr-enable
  repository = aws_ecr_repository.ecr-backend.0.name
  depends_on = [aws_ecr_repository.ecr-backend]

  policy = <<EOF
  {
    "Version": "2008-10-17",
    "Statement": [
      {
        "Sid": "AllowPushPull",
        "Effect": "Allow",
        "Principal": {
          "AWS": [
            "arn:aws:iam::720414165514:root",
            "arn:aws:iam::997178980242:root",
            "arn:aws:iam::758669830309:root"
          ]
        },
        "Action": [
          "ecr:BatchCheckLayerAvailability",
          "ecr:BatchGetImage",
          "ecr:CompleteLayerUpload",
          "ecr:GetDownloadUrlForLayer",
          "ecr:InitiateLayerUpload",
          "ecr:PutImage",
          "ecr:UploadLayerPart"
        ]
      }
    ]
  }
  EOF
}
