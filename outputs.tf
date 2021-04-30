output "instances" {
  value     = aws_instance.this[*]
  sensitive = true
}
