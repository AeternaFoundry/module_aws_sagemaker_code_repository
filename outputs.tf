output "sagemaker_code_repositories_id" {
  description = "Map of id values across all sagemaker_code_repositories, keyed the same as var.sagemaker_code_repositories"
  value       = { for k, v in aws_sagemaker_code_repository.sagemaker_code_repositories : k => v.id if v.id != null && length(v.id) > 0 }
}
output "sagemaker_code_repositories_arn" {
  description = "Map of arn values across all sagemaker_code_repositories, keyed the same as var.sagemaker_code_repositories"
  value       = { for k, v in aws_sagemaker_code_repository.sagemaker_code_repositories : k => v.arn if v.arn != null && length(v.arn) > 0 }
}
output "sagemaker_code_repositories_code_repository_name" {
  description = "Map of code_repository_name values across all sagemaker_code_repositories, keyed the same as var.sagemaker_code_repositories"
  value       = { for k, v in aws_sagemaker_code_repository.sagemaker_code_repositories : k => v.code_repository_name if v.code_repository_name != null && length(v.code_repository_name) > 0 }
}
output "sagemaker_code_repositories_git_config" {
  description = "Map of git_config values across all sagemaker_code_repositories, keyed the same as var.sagemaker_code_repositories"
  value       = { for k, v in aws_sagemaker_code_repository.sagemaker_code_repositories : k => one(v.git_config) if v.git_config != null && length(v.git_config) > 0 }
}
output "sagemaker_code_repositories_region" {
  description = "Map of region values across all sagemaker_code_repositories, keyed the same as var.sagemaker_code_repositories"
  value       = { for k, v in aws_sagemaker_code_repository.sagemaker_code_repositories : k => v.region if v.region != null && length(v.region) > 0 }
}
output "sagemaker_code_repositories_tags" {
  description = "Map of tags values across all sagemaker_code_repositories, keyed the same as var.sagemaker_code_repositories"
  value       = { for k, v in aws_sagemaker_code_repository.sagemaker_code_repositories : k => v.tags if v.tags != null && length(v.tags) > 0 }
}
output "sagemaker_code_repositories_tags_all" {
  description = "Map of tags_all values across all sagemaker_code_repositories, keyed the same as var.sagemaker_code_repositories"
  value       = { for k, v in aws_sagemaker_code_repository.sagemaker_code_repositories : k => v.tags_all if v.tags_all != null && length(v.tags_all) > 0 }
}

