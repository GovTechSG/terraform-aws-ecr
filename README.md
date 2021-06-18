## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Resources

| Name | Type |
|------|------|
| [aws_ecr_lifecycle_policy.lifecycle](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecr_lifecycle_policy) | resource |
| [aws_ecr_repository.repo](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecr_repository) | resource |
| [aws_ecr_repository_policy.policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecr_repository_policy) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_allowed_account_arns"></a> [allowed\_account\_arns](#input\_allowed\_account\_arns) | Map of account IDs with permission to ECR repos | `map(string)` | n/a | yes |
| <a name="input_image_tag_mutability"></a> [image\_tag\_mutability](#input\_image\_tag\_mutability) | Whether image tags can be mutated or not | `string` | `"IMMUTABLE"` | no |
| <a name="input_max_days_for_untagged_images"></a> [max\_days\_for\_untagged\_images](#input\_max\_days\_for\_untagged\_images) | Maximum days to keep untagged images in repository | `number` | `14` | no |
| <a name="input_project_tags"></a> [project\_tags](#input\_project\_tags) | Tagging of ECR repository | `map(string)` | <pre>{<br>  "Terraform": "True"<br>}</pre> | no |
| <a name="input_repo_names"></a> [repo\_names](#input\_repo\_names) | Name of ECR repository | `map(string)` | n/a | yes |
| <a name="input_scan_on_push"></a> [scan\_on\_push](#input\_scan\_on\_push) | Scan container images on push | `bool` | `true` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_ecr"></a> [ecr](#output\_ecr) | ECR repository name |
