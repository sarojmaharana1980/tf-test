provider "aws"{
    profile = "";
    region = "";

}
resource "aws_s3_bucket" "b" {
  bucket = "my-tf-test-bucket"
  acl    = "private"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}

add code by seeing tf code present at teeraform site