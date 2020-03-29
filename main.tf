provider "aws" {
    version = "~> 2.0"
    region = "us-east-1"
}

provider "aws" {
    alias = "us-east-2"
    version = "~> 2.0"
    region = "us-east-2"
}

resource "aws_instance" "dev" {
    count = 3
    ami = var.amis["us-east-1"]
    instance_type = "t2.micro"
    key_name = var.key-name

    tags = {
        Name = "dev-${count.index}"
    }

    vpc_security_group_ids = [
        "${aws_security_group.acesso-ssh.id}",
    ]
}

resource "aws_instance" "dev-4" {
    ami = var.amis["us-east-1"]
    instance_type = "t2.micro"
    key_name = var.key-name

    tags = {
        Name = "dev-4"
    }

    vpc_security_group_ids = [
        "${aws_security_group.acesso-ssh.id}",
    ]

    depends_on = [
        aws_s3_bucket.dev-4,
    ]
}

resource "aws_instance" "dev-5" {
    ami = var.amis["us-east-1"]
    instance_type = "t2.micro"
    key_name = var.key-name

    tags = {
        Name = "dev-5"
    }

    vpc_security_group_ids = [
        "${aws_security_group.acesso-ssh.id}",
    ]

}

resource "aws_instance" "dev-6" {
    provider = aws.us-east-2
    ami = var.amis["us-east-2"]
    instance_type = "t2.micro"
    key_name = var.key-name

    tags = {
        Name = "dev-6"
    }

    vpc_security_group_ids = [
        "${aws_security_group.acesso-ssh-us-east-2.id}",
    ]

    depends_on = [
        aws_dynamodb_table.dynamodb-homologacao,
    ]
}

resource "aws_instance" "dev-7" {
    provider = aws.us-east-2
    ami = var.amis["us-east-2"]
    instance_type = "t2.micro"
    key_name = var.key-name

    tags = {
        Name = "dev-7"
    }

    vpc_security_group_ids = [
        "${aws_security_group.acesso-ssh-us-east-2.id}",
    ]

    depends_on = [
        aws_dynamodb_table.dynamodb-homologacao,
    ]
}

resource "aws_s3_bucket" "dev-4" {
    bucket = "guilhermealvessilve-dev-4"
    acl    = "private"

    tags = {
        Name = "guilhermealvessilve-dev-4"
    }
}

resource "aws_dynamodb_table" "dynamodb-homologacao" {
    provider = aws.us-east-2
    name           = "GameScores"
    billing_mode   = "PAY_PER_REQUEST"
    hash_key       = "UserId"
    range_key      = "GameTitle"

    attribute {
        name = "UserId"
        type = "S"
    }

    attribute {
        name = "GameTitle"
        type = "S"
    }
}