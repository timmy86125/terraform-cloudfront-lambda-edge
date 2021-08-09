#############################################
# Variable
#############################################

variable "aws_profile" {
  type = string
}

variable "aws_region" {
  default = "us-east-1"
  type    = string
}

variable "resource_tags" {
  type        = map(string)
  default     = null
  description = "Additional Tags that need to be attached to every resource."
}

variable "cloudfront_distribution_info" {
  type        = map(string)
  description = "For CloudFront distribution information"
}