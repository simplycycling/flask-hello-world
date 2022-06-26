provider "aws" {
  profile = "default"
  region = "ap-southeast-2"
}

resource "aws_ecs_cluster" "flask-cluster" {
  name = "hello world"

  tags = {
    Name = "hw-flask"
  }
}