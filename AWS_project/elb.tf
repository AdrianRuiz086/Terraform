# Resource: aws_route_elb
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/elb

resource "aws_elb" "elb" {
  name            = "elb"
  security_groups = [aws_security_group.allow-lb.id]

  listener {
    instance_port     = 80
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }

  subnets = [aws_subnet.public_subnet.id]

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    target              = "HTTP:80/"
    interval            = 5
  }

  instances                   = [aws_instance.public-instance.id]
  cross_zone_load_balancing   = true
  idle_timeout                = 10
  connection_draining         = true
  connection_draining_timeout = 10

  # Tag assigned to ELB intance
  tags = {
    Name = "elb"
  }

}
