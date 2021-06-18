variable "repo_names" {
  type        = map(string)
  description = "Name of ECR repository"
}

variable "project_tags" {
  type = map(string)
  default = {
    Terraform = "True"
  }
  description = "Tagging of ECR repository"
}

variable "max_days_for_untagged_images" {
  type        = number
  default     = 14
  description = "Maximum days to keep untagged images in repository"
}

variable "scan_on_push" {
  type        = bool
  default     = true
  description = "Scan container images on push"
}

variable "image_tag_mutability" {
  type        = string
  default     = "IMMUTABLE"
  description = "Whether image tags can be mutated or not"
}

variable "allowed_account_arns" {
  type        = map(string)
  description = "Map of account IDs with permission to ECR repos"
}

//variable "repository_policy" {
//  type        = string
//  description = "Policy on each ECR repo"
//}