resource "aws_ecr_repository" "lambda_repo" {
  name = var.ecr_repository_name
}

resource "aws_iam_role" "lambda_exec_role" {
  name               = "${var.resource_name}_exec_role"
  assume_role_policy = var.trust_policy
}

resource "aws_iam_role_policy" "lambda_secrets_policy" {
  name   = "${var.resource_name}_secrets_policy"
  role   = aws_iam_role.lambda_exec_role.id
  policy = var.role_policy
}

resource "aws_lambda_function" "lambda_function" {
  function_name = var.resource_name
  role          = aws_iam_role.lambda_exec_role.arn
  package_type  = "Image"
  image_uri     = "${aws_ecr_repository.lambda_repo.repository_url}:latest"
  timeout       = var.timeout

  environment {
    variables = var.environment_variables
  }
}
