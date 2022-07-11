output "ip_publica_instancia_ec2" {
    description = "IP pública instancia"
    value = aws_instance.instancia_1.public_ip
  
}

output "ip_privada_instancia" {
    description = "IP privada instancia"
    value = aws_instance.instancia_1.private_ip
  
}

output "endpoint_rds" {
    description = "Endpoint de RDS"
    value = aws_db_instance.rds_1.endpoint
  
}


