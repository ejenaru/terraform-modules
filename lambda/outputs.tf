output "lambda_function_arn" {
  value = aws_lambda_function.lambda_function.arn
}

output "lambda_function_id" {
  value = aws_lambda_function.lambda_function.id
}

output "ecr_repository_url" {
  value = aws_ecr_repository.lambda_repo.repository_url
}

output "lambda_exec_role" {
  value = aws_iam_role.lambda_exec_role
}