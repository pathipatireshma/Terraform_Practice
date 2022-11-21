terraform {
    backend "s3" {
        bucket = "reshma-cloud-practice"
        key = "tfstatefiles/"
        region = "us-east-1"

      
    }
  
}