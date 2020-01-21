resource "aws_security_group" "sg_terra" {
  name = "sg_terra"
  description = "Security Group for terraform instances"
  vpc_id = "${aws_vpc.vpc_terfm.id}"

  ingress{
      from_port = 80
      to_port = 80
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  ingress{
      from_port = 22
      to_port = 22
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
  }
}
