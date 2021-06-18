output "ecr" {
  description = "ECR repository name"
  value = [
    for repo in aws_ecr_repository.repo :
    repo.arn
  ]
}
