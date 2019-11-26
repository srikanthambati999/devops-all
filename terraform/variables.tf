variable "key_name" {
  default = "terraform"
}

variable "pvt_key" {
  default = "/home/jenkins.pem"
}

variable "us-east-zones" {
  default = ["us-east-1a"]
}

variable "sg-id" {
  default = "sg-0d71af2c2ffa77231"
}
