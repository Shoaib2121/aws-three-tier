output "lb_security_group_id" {
  value = aws_security_group.lb_sg.id
}
output "target_group_id" {
  value = aws_lb_target_group.target_group.id

}
output "alb_dns_name" {
  value = aws_lb.public_lb.dns_name
}

output "alb_zone_id" {
  value = aws_lb.public_lb.zone_id
}