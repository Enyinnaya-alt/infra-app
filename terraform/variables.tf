variable "instance_type" {
  default = "t2.micro"
}

variable "ami" {
  default = "ami-05b10e08d247fb927"  
}

variable "key_name" {
  default = "stage 4"  # Replace with your EC2 key pair name
}

variable "security_group" {
  default = "todo-app-sg"
}

variable "domain_name" {
  default = "princecloud.site"
}