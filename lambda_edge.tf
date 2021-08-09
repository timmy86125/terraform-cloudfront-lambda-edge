#############################################
# Lambda Edge
#############################################

module "lambda_edge" {
  source        = "terraform-aws-modules/lambda/aws"
  publish       = true
  create_role   = false
  lambda_role   = aws_iam_role.lambda_edge_role.arn
  function_name = "lambda-edge-viewer-response"
  description   = "For CloudFront viewer response Lambda@Edge"
  handler       = "lambda_function.lambda_handler"
  runtime       = "python3.8"
  source_path   = "./lambda_function.py"
  tags          = var.resource_tags
}