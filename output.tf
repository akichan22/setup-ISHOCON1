output "SSH Config" {
  value = <<SSHCONFIG

  Host ishocon
    User         ec2-user
    Hostname     ${aws_instance.ishocon-1.public_ip}
    IdentityFile ~/.ssh/${aws_instance.ishocon-1.key_name}.key
  SSHCONFIG
}
