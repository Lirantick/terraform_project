output "sg_instance_name" {
    description = "Nombre de security group de la instancia"
    value = var.sg_group_instancia_name
}

output "sg_rds_name" {
    description = "Nombre de security group de la instancia"
    value = var.sg_group_rds_name
}

output "av_zone_1" {
    description = "AV zone 1 escogida por el usuario"
    value = var.av_zone_primaria
}

output "av_zone_2" {
    description = "AV zone 2 escogida por el usuario"
    value = var.av_zone_secundaria
}

output "subnet_1_id" {
    description = "Nombre del subnet group"
    value = aws_subnet.subnet_1.id
}


output "subnet_group_name" {
    description = "Nombre del subnet group"
    value = var.subnet_group_name
}

