resource "aws_ecr_repository" "repo" {
  for_each             = var.repo_names
  name                 = each.value
  image_tag_mutability = var.image_tag_mutability

  image_scanning_configuration {
    scan_on_push = var.scan_on_push
  }

  tags = merge(var.tags, {
    Name = each.value
  })
}

resource "aws_ecr_pull_through_cache_rule" "main" {
  for_each = var.pull_through_cahce_rules

  ecr_repository_prefix = each.value.prefix
  upstream_registry_url = each.value.url
}

resource "aws_ecr_lifecycle_policy" "lifecycle" {
  for_each   = aws_ecr_repository.repo
  repository = each.value.name

  depends_on = [aws_ecr_repository.repo]

  policy = <<EOF
{
  "rules": [
    {
      "rulePriority": 2,
      "description": "Remove untagged images",
      "selection": {
        "tagStatus": "untagged",
        "countType": "sinceImagePushed",
        "countNumber": ${var.max_days_for_untagged_images},
        "countUnit": "days"
      },
      "action": {
        "type": "expire"
      }
    }
  ]
}
EOF
}

locals {
  aws_principals = join(",", values(var.allowed_account_arns))
}

resource "aws_ecr_repository_policy" "policy" {
  for_each   = aws_ecr_repository.repo
  repository = each.value.name
  depends_on = [aws_ecr_lifecycle_policy.lifecycle]

  policy = <<EOF
{
  "Version": "2008-10-17",
  "Statement": [
    {
      "Sid": "PushPull",
      "Effect": "Allow",
      "Principal": {
        "AWS": [${local.aws_principals}]
      },
      "Action": [
        "ecr:BatchGetImage",
        "ecr:BatchCheckLayerAvailability",
        "ecr:CompleteLayerUpload",
        "ecr:DescribeImages",
        "ecr:DescribeRepositories",
        "ecr:GetDownloadUrlForLayer",
        "ecr:InitiateLayerUpload",
        "ecr:ListImages",
        "ecr:PutImage",
        "ecr:UploadLayerPart"
      ]
    }
  ]
}
EOF
}
