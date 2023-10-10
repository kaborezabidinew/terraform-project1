# docker install
sudo yum update -y
sudo yum install docker
sudo usermod -aG docker ec2-user
sudo service docker start