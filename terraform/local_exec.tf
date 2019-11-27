terraform {
  backend "local" {
    path = "/tmp/terraform/workspace/terraform.tfstate"
  }

}

provider "aws" {
  version = "~> 2.0"
  region     = "us-east-1"
  access_key = "AKIAZDHBYI2Y4LK37YA2"
  secret_key = "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"
  }

resource "aws_instance" "backend" {
  ami                    = "ami-00068cd7555f543d5"
  instance_type          = "t2.micro"
  key_name               = "${var.key_name}"
  

}

resource "null_resource" "remote-exec-1" {
    connection {
    user        = "ec2-user"
    type        = "ssh"
    private_key = "${file(var.pvt_key)}"
    host        = "${aws_instance.backend.public_ip}"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo yum update",
      "sudo yum install python sshpass -y",
    ]
  }
}

resource "null_resource" "ansible-main" {
provisioner "local-exec" {
  command = <<EOT
        sleep 100;
        > jenkins-ci.ini;
        echo "[jenkins-ci]"| tee -a jenkins-ci.ini;
        export ANSIBLE_HOST_KEY_CHECKING=False;
        echo "${aws_instance.backend.public_ip}" | tee -a jenkins-ci.ini;
        ansible-playbook -e  sshKey=${var.pvt_key} -i jenkins-ci.ini ./ansible/setup-backend.yaml -u ec2-user -v
    EOT
}
}
