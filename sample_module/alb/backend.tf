terraform {
    backend "s3" {
        bucket = "reshma-cloud-practice"
        key = "tfstatefiles/alb/terraform.tfstate"
        region = "us-east-1"

      
    }
  
}