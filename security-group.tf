resource "aws_security_group" "acesso-ssh" {
    name        = "acesso-ssh"
    description = "Acesso com ssh"

    ingress {
        description = "Acesso com ssh"
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        cidr_blocks = var.cdir-acesso-remoto
    }

    tags = {
        Name = "acesso-ssh"
    }
}

resource "aws_security_group" "acesso-ssh-us-east-2" {
    name        = "acesso-ssh"
    description = "Acesso com ssh"

    ingress {
        description = "Acesso com ssh"
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        cidr_blocks = var.cdir-acesso-remoto
    }

    tags = {
        Name = "acesso-ssh"
    }
}