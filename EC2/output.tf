output "Image-Id" {
  value = aws_ami_from_instance.golden-Ami.id
}
output "public-instance" {
  value = aws_instance.web_instance.id
}