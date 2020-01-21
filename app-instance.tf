resource "aws_instance" "inst1_terfm" {
  ami = "${var.inst_ami}"
  instance_type = "${var.instype}"
  subnet_id = "${aws_subnet.terfm-subnet1.id}"
  vpc_security_group_ids = ["${aws_security_group.sg_terra.id}"]
  key_name = "${var.keypair}"
}
resource "aws_instance" "inst2_terfm" {
  ami = "${var.inst_ami}"
  instance_type = "${var.instype}"
  subnet_id = "${aws_subnet.terfm-subnet2.id}"
  vpc_security_group_ids = ["${aws_security_group.sg_terra.id}"]
  key_name = "${var.keypair}"
}
