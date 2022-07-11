terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.20.1"
    }
  }
}

provider "aws" {
  default_tags {
    tags = {
      env = "ac-tr-202206",
      "cost:env" = "academy",
      "cost:project" = "ac-us-terraform-202206"
    }
  }
}
                          