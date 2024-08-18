resource "aws_lightsail_instance" "web_server" {
  name              = "web-server"
  availability_zone = "us-east-1a"  # Specify the availability zone
  blueprint_id      = "amazon_linux_2"  # Specify the desired blueprint (Amazon Linux 2)
  bundle_id         = "nano_2_0"  # Specify the instance size

  user_data = <<-EOF
              #!/bin/bash
              sudo yum install httpd -y
              sudo systemctl start httpd
              sudo systemctl enable httpd
              echo "<h1>This Server is created using Terraform </h1>" | sudo tee /var/www/html/index.html
              EOF
}


output "public_ip" {
  description = "The public IP of the Lightsail instance"
  value       = aws_lightsail_instance.web_server.public_ip_address`
}