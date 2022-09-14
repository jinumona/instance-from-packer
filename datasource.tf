
# vim datasource.tf
data "aws_ami" "self" {
 
  most_recent      = true
  owners           = ["self"]

  filter {
    name   = "name"
    values = ["zomato-prod-*"]
  }
}
