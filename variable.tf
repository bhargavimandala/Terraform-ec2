variable "accesskey_id" {}
variable "secretkey" {}
variable "region" {}
variable "ec2_ami" {}
variable "instance_class" {}
variable "name" {
#type = "list"
}
variable "availability_zone" {}
variable "ec2_key" {}
variable "ec2_ebs_volume_size" {}
variable "ec2_instance_count" {
default = 2
}
variable "ec2_ebs_volume_count" {
default = 3
}
variable "ec2_device_names" {
type = "list"

}
