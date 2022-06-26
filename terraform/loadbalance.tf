resource "aws_security_group" "flask-lb-sg" {
  name = "Flask LB"
  vpc_id = aws_vpc.flask-vpc.id

  ingress {
    from_port = 80
    protocol  = "TCP"
    to_port   = 80
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port = 0
    protocol  = ""
    to_port   = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "flask-int-sg" {
  name = "flask-app-from-lb"
  description = "Access flask via load balancer"
  vpc_id = aws_vpc.flask-vpc.id

  ingress {
    from_port = var.flask_app_port
    protocol  = "TCP"
    to_port   = var.flask_app_port
    security_groups = [aws_security_group.flask-int-sg.id]
  }

  egress {
    from_port = 0
    protocol  = "-1"
    to_port   = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
}