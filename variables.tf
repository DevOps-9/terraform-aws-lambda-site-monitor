#Module      : LABEL
#Description : Terraform label module variables
variable "name" {
  type        = string
  default     = ""
  description = "Lambda Name  (e.g. `app` or `cluster`)."
}

variable "repository" {
  type        = string
  default     = ""
  description = "Terraform current module repo"

  validation {
    # regex(...) fails if it cannot find a match
    condition     = can(regex("^https://", var.repository))
    error_message = "The module-repo value must be a valid Git repo link."
  }
}

variable "environment" {
  type        = string
  default     = ""
  description = "Lambda Environment (e.g. `prod`, `dev`, `staging`)."
}

variable "label_order" {
  type        = list
  default     = []
  description = "Label order, e.g. `name`,`application`."
}

variable "enabled" {
  type        = bool
  default     = true
  description = "Whether to create lambda function."
}

variable "ssl_check_enabled" {
  type        = bool
  default     = true
  description = "Whether to create lambda function."
}

variable "monitor_enabled" {
  type        = bool
  default     = true
  description = "Whether to create lambda function."
}

variable "variables" {
  type        = map
  default     = {}
  description = "A map that defines environment variables for the Lambda function."
}

variable "ssl_variables" {
  type        = map
  default     = {}
  description = "A map that defines environment variables for the Lambda function."
}

variable "slack_variables" {
  type        = map
  default     = {}
  description = "A map that defines environment variables for the Lambda function."
}

variable "managedby" {
  type        = string
  default     = "hello@clouddrove.com"
  description = "ManagedBy, eg 'CloudDrove'."
}

variable "schedule_expression" {
  type        = string
  default     = "cron(*/5 * * * ? *)"
  description = "Schedule expression for site monitor lambda function."
}

variable "ssl_schedule_expression" {
  type        = string
  default     = "cron(*/5 * * * ? *)"
  description = "Schedule expression for site monitor lambda function."
}

variable "subnet_ids" {
  type        = list
  default     = []
  description = "Subnet IDs."
  sensitive   = true
}

variable "security_group_ids" {
  type        = list
  default     = []
  description = "Security Group IDs."
  sensitive   = true
}

variable "timeout" {
  type        = number
  default     = 30
  description = "timeout."
}