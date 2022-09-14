# vim output.tf

output "ami-id" {
    value= data.aws_ami.self.image_id
}

output "elastic-ip" {
    value=aws_eip.packer.public_ip
}

