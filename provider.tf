provider "aws" {
  region = "ap-northeast-1"
  alias  = "tokyo"

  assume_role {
    role_arn = var.role_arn
  }
}

provider "aws" {
  region = "us-east-1"
  alias  = "virginia"

  assume_role {
    role_arn = var.role_arn
  }
}