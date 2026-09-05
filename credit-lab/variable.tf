variable "aws_region" {
  description = "AWS region for all lab resources."
  type        = string
  default     = "us-east-1"
}

variable "name_prefix" {
  description = "Short, lowercase prefix used in resource names."
  type        = string
  default     = "explore-lab"
}

variable "db_name" {
  description = "Initial PostgreSQL database name."
  type        = string
  default     = "appdb"
}

variable "db_username" {
  description = "RDS master username."
  type        = string
  default     = "appadmin"
}

variable "db_password" {
  description = "RDS master password. Supply through terraform.tfvars or TF_VAR_db_password; it is stored in Terraform state."
  type        = string
  sensitive   = true

  validation {
    condition     = length(var.db_password) >= 8
    error_message = "db_password must be at least 8 characters."
  }
}

variable "db_instance_class" {
  description = "Smallest broadly available RDS instance class; check free-tier/credit eligibility for your account."
  type        = string
  default     = "db.t3.micro"
}

variable "allocated_storage" {
  description = "RDS storage in GiB."
  type        = number
  default     = 20
}

variable "skip_final_snapshot" {
  description = "Leave true for a disposable lab. False requires final_snapshot_identifier during destroy."
  type        = bool
  default     = true
}

variable "final_snapshot_identifier" {
  description = "Snapshot identifier used only when skip_final_snapshot is false."
  type        = string
  default     = null
}

variable "bedrock_model_ids" {
  description = "Bedrock foundation-model IDs this lab role may invoke. Enable access to these in the chosen region."
  type        = list(string)
  default     = ["amazon.nova-micro-v1:0"]
}

variable "tags" {
  description = "Additional tags for lab resources."
  type        = map(string)
  default     = {}
}
