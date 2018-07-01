resource "aws_instance" "ishocon-1" {
    ami           = "ami-03134665"
    instance_type = "c4.xlarge"
    key_name      = "${var.key_name}"
    monitoring    = true
    associate_public_ip_address = "true"
    vpc_security_group_ids = [
      "${aws_security_group.ishocon.id}"
    ]
    tags {
        Name = "ishocon"
    }
}

resource "aws_security_group" "ishocon" {
    name = "ishocon"
    description = "security_groups for ishocon"
    ingress {
     from_port = 22
     to_port = 22
     protocol = "tcp"
     cidr_blocks = ["0.0.0.0/0"]
    }
    ingress {
      from_port = 80
      to_port = 80
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
    egress {
      from_port = 0
      to_port = 0
      protocol = "-1"
      cidr_blocks = ["0.0.0.0/0"]
    } 
}
