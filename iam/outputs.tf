output "users_arn" {
  value = aws_iam_user.users
  description = "list of IAM users created"
}

output "roles_arn" {
  value = aws_iam_role.roles
  description = "list of IAM roles created"
}