output "user_pool_id" {
  description = "User PoolのID"
  value       = aws_cognito_user_pool.main.id
}

output "user_pool_arn" {
  description = "User PoolのARN"
  value       = aws_cognito_user_pool.main.arn
}

output "user_pool_endpoint" {
  description = "User Poolのエンドポイント（JWT検証のissuer URL等で使用）"
  value       = aws_cognito_user_pool.main.endpoint
}

output "user_pool_client_id" {
  description = "User Pool ClientのID"
  value       = aws_cognito_user_pool_client.main.id
}
