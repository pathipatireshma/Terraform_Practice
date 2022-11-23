terraform {
    backend "s3" {
        bucket = "reshma-cloud-practice"
        key = "tfstatefiles/asg/terraform.tfstate"
        region = "us-east-1"

      
    }
  
}