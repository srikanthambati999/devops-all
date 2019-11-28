variable "key_name" {
  default = "jen-terra"
}

variable "pvt_key" {
  default = "/home/jen-terra.pem"
}
variable "access_key" {
  default = "/home/access_key"
}
variable "secret_key" {
  default = "/home/secret_key"
}
variable "us-east-zones" {
  default = ["us-east-1a","us-east-1b"]
}

variable "sg-id" {
  default = "sg-0ad33ce61dc97380c"
}
