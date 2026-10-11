variable "sagemaker_code_repositories" {
  description = <<EOT
Map of sagemaker_code_repositories, attributes below
Required:
    - code_repository_name
    - git_config (block):
        - branch (optional)
        - repository_url (required)
        - secret_arn (optional)
Optional:
    - region
    - tags
    - tags_all
EOT

  type = map(object({
    code_repository_name = string
    region               = optional(string)
    tags                 = optional(map(string))
    tags_all             = optional(map(string))
    git_config = object({
      branch         = optional(string)
      repository_url = string
      secret_arn     = optional(string)
    })
  }))
  validation {
    condition = alltrue([
      for k, v in var.sagemaker_code_repositories : (
        (length(v.code_repository_name) >= 1 && length(v.code_repository_name) <= 63) && (can(regex("^[0-9A-Za-z](-*[0-9A-Za-z])*$", v.code_repository_name)))
      )
    ])
    error_message = "all of: must be between 1 and 63 characters; Valid characters are a-z, A-Z, 0-9, and - (hyphen)."
  }
  validation {
    condition = alltrue([
      for k, v in var.sagemaker_code_repositories : (
        v.git_config.branch == null || (length(v.git_config.branch) >= 1 && length(v.git_config.branch) <= 1024)
      )
    ])
    error_message = "must be between 1 and 1024 characters"
  }
  # Note: 1 additional provider-side validator is enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

