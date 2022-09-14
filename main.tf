# vim main.tf

# elastic ip creation

resource "aws_eip" "packer" {
  vpc      = true
}

#elastic ip association

resource "aws_eip_association" "eip_assoc" {
  instance_id   = aws_instance.webserver.id
  allocation_id = aws_eip.packer.id
}


resource "aws_instance" "webserver" {

    
  ami                    =  data.aws_ami.self.image_id
  instance_type          =  "t2.micro"
  key_name               =  "devops-class"
  vpc_security_group_ids =  [ "sg-04182bdfbfa17d831" ]
  tags = {
    Name = "webserver-prod"
  }

  lifecycle {
    create_before_destroy = true
  }

}


