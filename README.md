# terraform-cloudfront-lambda-edge

Deploy your CloudFront Lambda@Edge

## Prerequisites

- Install terraform
- Install AWS CLI
- Set AWS credential in your environment, 
  ```aws configure  --profile your_profile_name```

## Configuration

Modify ```terraform.tfvars.template``` to ```terraform.tfvars```, and set the tfvars

- aws_profile = "your aws profile"
- aws_region  = "your aws default region"
- resource_tags.project = "your project name"

## Deploy & Delete resources

- Deploy resources:

   `terraform init`

   `terraform plan`

   `terraform apply` 

- Delete resources:

   `terraform destroy`

## Resources

- CloudFront
- Lambda Function (Lambda@Edge)
- IAM Role
- Cloudwatch Log Group

## Reference 
- https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/lambda-examples.html