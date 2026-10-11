resource "aws_sagemaker_code_repository" "sagemaker_code_repositories" {
  for_each = var.sagemaker_code_repositories

  code_repository_name = each.value.code_repository_name
  region               = each.value.region
  tags                 = each.value.tags
  tags_all             = each.value.tags_all

  git_config {
    branch         = each.value.git_config.branch
    repository_url = each.value.git_config.repository_url
    secret_arn     = each.value.git_config.secret_arn
  }
}

