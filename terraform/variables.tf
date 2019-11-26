variable "key_name" {
  default = "jenkins"
}

variable "pvt_key" {
  default = "/home/srikanth.pem"
}

variable "us-east-zones" {
  default = ["us-east-1a", "us-east-1b"]
}

variable "sg-id" {
  default = "sg-a47d76e4"
}
