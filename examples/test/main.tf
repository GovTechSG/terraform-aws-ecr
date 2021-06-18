module "test" {
  source = "../../"
  repo_names = {
    "my-repo" : "my-repo",
  }
  image_tag_mutability = "IMMUTABLE"

  allowed_account_arns = {
    "my-account" : "\"arn:aws:iam::123456789:root\"",
  }
}
