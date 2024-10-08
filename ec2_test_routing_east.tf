provider "aws" {

 region     = "us-east-1"
}

# data "aws_vpc" "vpc_id" {
  
#   filter {
#     name = "tag:Name"
#     values = ["*-virginia-vpc"]
#   } 
# }

# data "aws_subnet" "subnet" {
#   vpc_id = data.aws_vpc.vpc_id.id

#   filter {
#     name   = "tag:Name"
#     values = ["*-private-subnet-az1"]
#   }
# }

# resource "aws_iam_role" "rackspace_role" {
#   name                = "rackspace-role"
#   assume_role_policy = <<EOF
# {
#   "Version": "2012-10-17",
#   "Statement": [
#     {
#       "Action": "sts:AssumeRole",
#       "Principal": {
#         "Service": "ec2.amazonaws.com"
#       },
#       "Effect": "Allow",
#       "Sid": ""
#     }
#   ]
# }
# EOF
# }

# resource "aws_iam_policy_attachment" "policy" {
#   name = "instance-rackspace-policy"
#   roles = ["${aws_iam_role.rackspace_role.name}"]
#   policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
# }

# resource "aws_iam_instance_profile" "instance_rackspace_role" {
#   name = "instance-rackspace-role"
#   role = "${aws_iam_role.rackspace_role.name}"
# }

# resource "tls_private_key" "rsa_4096_key_rackspace_routing" {
#   algorithm = "RSA"
#   rsa_bits  = 4096
# }

# resource "aws_key_pair" "key_rackspace_routing" {
#   key_name   = "rackspace-routing"
#   public_key = "${tls_private_key.rsa_4096_key_rackspace_routing.public_key_openssh}"
# }

#   root_block_device {
#     volume_size = "8"
#     volume_type = "gp2"
#     delete_on_termination = "true"
#     }

#   tags = {
#     Name = "rackspace-test"
#   }
# }

resource "aws_security_group" "instance_test_routing" {
  vpc_id = "vpc-094fc7ca07a9b39c4"
  name = "rackspace-test-sg"
  description = "rackspace-test-routing"
  
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
  
  ingress {
    from_port = -1
    to_port = -1
    protocol = "icmp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
   tags = {
        Name = "rackspace-test-sg"
    }

}
