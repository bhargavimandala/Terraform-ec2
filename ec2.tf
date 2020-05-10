resource "aws_instance" "ec2_instance" {
 count          = "${var.ec2_instance_count}"
  ami           = "${var.ec2_ami}"
  instance_type = "t2.micro"
 # user_data     = "${file("userdata.sh")}"
  user_data = "${data.template_file.user-init.rendered}"
  key_name = "${var.ec2_key}"
  tags = {
    Name = "${var.name}"
  }


}
#
data "template_file" "user-init" {
  template = "${file("${path.module}/userdata.sh")}"
}

resource "aws_ebs_volume" "ec2_ebs" {
  count             = "${var.ec2_instance_count * var.ec2_ebs_volume_count}"
  availability_zone = "${var.availability_zone}"
  size              = "${var.ec2_ebs_volume_size}"

  tags = {
    Name = "${var.name}"
  }
}


resource "aws_volume_attachment" "ebs_att" {
  force_detach=true
  count       = "${var.ec2_instance_count * var.ec2_ebs_volume_count}"
  volume_id   = "${aws_ebs_volume.ec2_ebs.*.id[count.index]}"
  device_name = "${element(var.ec2_device_names, count.index)}"
  instance_id = "${element(aws_instance.ec2_instance.*.id, count.index+1)}"
}

##
