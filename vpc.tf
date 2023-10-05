resource "aws_vpc" "vpc1" {
  cidr_block           = "172.120.0.0/16"
  enable_dns_support   = "true"
  enable_dns_hostnames = "true"
  instance_tenancy     = "default"

  tags = {
    Name = "Terraform-vpc"
    env  = "Dev"
  }
}
## Subnet

resource "aws_subnet" "public_subnet1" {
    vpc_id = "${aws_vpc.vpc1.id}"
    cidr_block = "172.120.1.0/24"
    map_public_ip_on_launch = "true"
    availability_zone = "us-east-1a"

    tags={
        Name = "public_subnet1"
    }
   
}

resource "aws_subnet" "public_subnet2" {
    vpc_id = "${aws_vpc.vpc1.id}"
    cidr_block = "172.120.2.0/24"
    map_public_ip_on_launch = "true"
    availability_zone = "us-east-1b"

    tags={
        Name = "public_subnet2"
    } 
}

## Private subnet

resource "aws_subnet" "private_subnet1" {
    vpc_id = "${aws_vpc.vpc1.id}"
    cidr_block = "172.120.3.0/24"
    availability_zone = "us-east-1a"

    tags={
        Name = "private_subnet1"
    } 
  
}

resource "aws_subnet" "private_subnet2" {
    vpc_id = "${aws_vpc.vpc1.id}"
    cidr_block = "172.120.4.0/24"
    availability_zone = "us-east-1b"

    tags={
        Name = "private_subnet2"
    } 
  
}
