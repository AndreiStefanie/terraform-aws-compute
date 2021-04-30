variable "aws_region" {}

variable "instance_count" {
  default = 1
}

variable "instance_type" {
  default = "t2.micro"
}

variable "key_name" {
  default = "tf-key"
}

variable "public_key_material" {

}

variable "security_group" {

}

variable "subnets" {

}

variable "volume_size" {
  default = 8
}
