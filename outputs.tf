output "name" {
  value = aws_key_pair.this.id
}

output "filename" {
  value     = local_sensitive_file.private_key.filename
  sensitive = true
}
