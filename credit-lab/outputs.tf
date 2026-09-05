output "rds_endpoint" {
  description = "Private RDS endpoint; it is reachable only after you add a deliberate inbound security-group rule."
  value       = aws_db_instance.app.address
}

output "rds_database_name" {
  value = aws_db_instance.app.db_name
}

output "lambda_function_url" {
  description = "Public lab URL. Remove/destroy promptly after testing."
  value       = aws_lambda_function_url.ci_hook.function_url
}

output "bedrock_lab_role_arn" {
  description = "Role with scoped Bedrock invoke permissions; creating it does not submit a Bedrock prompt."
  value       = aws_iam_role.bedrock_lab.arn
}

output "bedrock_allowed_model_ids" {
  value = var.bedrock_model_ids
}
