resource "aws_security_group" "todo_app_sg" {
  name = var.security_group

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 3000
    to_port     = 3000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "todo_app" {
  ami           = var.ami
  instance_type = var.instance_type
  key_name      = var.key_name
  security_groups = [aws_security_group.todo_app_sg.name]

  provisioner "local-exec" {
    command = <<EOT
      mkdir -p ../ansible  # Ensure ansible directory exists
      echo "[servers]" > ../ansible/inventory
      echo "${self.public_ip} ansible_user=ec2-user ansible_ssh_private_key_file=~/.ssh/stage_4.pem" >> ../ansible/inventory
    EOT
  
  }
}