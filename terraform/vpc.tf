data "aws_subnets" "subnets" {
  filter {
    name   = "vpc-id"
    values = ["vpc-07a8ae8ec81713f40"]
  }
}
