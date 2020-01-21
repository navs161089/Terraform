resource "aws_vpc" "vpc_terfm" {
  cidr_block = "10.0.0.0/16"
  enable_dns_support = "true"
  enable_dns_hostnames = "true"
  enable_classiclink = "false"
  instance_tenancy = "default"

  tags = {
      Name = "vpc_terfm"
  }
}
resource "aws_subnet" "terfm-subnet1" {
    vpc_id = "${aws_vpc.vpc_terfm.id}"
    cidr_block = "10.0.1.0/24"
    map_public_ip_on_launch = "true"
    tags = {
        Name = "terfm-subnet1"
    }

}
resource "aws_subnet" "terfm-subnet2" {
  vpc_id = "${aws_vpc.vpc_terfm.id}"
  cidr_block = "10.0.2.0/24"
  map_public_ip_on_launch = "true"
  tags = {
      Name = "terfm-subnet2"
  }

}

resource "aws_internet_gateway" "terra_gw" {
    vpc_id = "${aws_vpc.vpc_terfm.id}"
    tags = {
        Name = "terra_gw"
    }

}


resource "aws_route_table" "terra_rtable1" {
    vpc_id = "${aws_vpc.vpc_terfm.id}"
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = "${aws_internet_gateway.terra_gw.id}"

         }
        tags = {
            Name = "terra_rtable1"
        }
        
}

resource "aws_route_table" "terra_rtable2" {
    vpc_id = "${aws_vpc.vpc_terfm.id}"
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = "${aws_internet_gateway.terra_gw.id}"

         }
        tags = {
            Name = "terra_rtable2"
        }

}
resource "aws_route_table_association" "rtable1_aterfm" {
  subnet_id = "${aws_subnet.terfm-subnet1.id}"
  route_table_id = "${aws_route_table.terra_rtable1.id}"
}

resource "aws_route_table_association" "rtable2_aterfm" {
  subnet_id = "${aws_subnet.terfm-subnet2.id}"
  route_table_id = "${aws_route_table.terra_rtable2.id}"
}
