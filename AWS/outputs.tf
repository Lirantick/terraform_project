
output "ip_publica_instancia" {
    description = "IP pública instancia"
    value = aws_instance.instancia_1.public_ip
  
}

output "ip_privada_instancia" {
    description = "IP privada instancia"
    value = aws_instance.instancia_1.private_ip
  
}



