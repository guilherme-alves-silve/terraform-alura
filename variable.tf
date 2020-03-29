variable "amis" {
    type = map(string)

    default = {
        "us-east-1" = "ami-07ebfd5b3428b6f4d"
        "us-east-2" = "ami-0e01ce4ee18447327"
    }
}

variable "cdir-acesso-remoto" {
    type = list(string)

    default = [
        "YOUR_IP_HERE/NUMBER",
        "YOUR_IP_HERE/NUMBER",
    ]
}

variable "key-name" {
    default = "terraform-alura"
}