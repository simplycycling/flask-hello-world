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

# create container task TODO figure out how to do that
/*
Not currently sure where to go with this - I need to get a little farther into
the buildkite workflow before understanding where the best place to publish the
image would be
*/

