// Con resource creamos un nuevo recurso en aws, en la documentación podemos encontrar información de los diversos recursos junto con sus parámetros obligatorios u opcionales, en este caso levantaremos una instancia EC2 con una AMI (imagen)

// Instancia
resource "aws_instance" "instancia_1" {
    ami = "ami-0cff7528ff583bf9a"
    instance_type = "t2.micro"
    key_name = "ac_ups_terraform_202206"
    availability_zone = var.av_zone_primaria
    vpc_security_group_ids = [aws_security_group.sg_instancia.id]
    subnet_id = aws_subnet.subnet_1.id
    tags = {
      "Name" = "ec2_proyecto_lucas"
    }
    depends_on = [
      aws_security_group.sg_instancia
    ]
}


// Instancia de RDS con MySQL
resource "aws_db_instance" "rds_1" {
    allocated_storage = 10
    engine = "mysql"
    engine_version = 5.7
    instance_class = "db.t3.micro"
    db_name = "upskilling_db"
    username = "lsilvera"
    password = "d4t4b4s3"
    apply_immediately = true
    skip_final_snapshot = true
    availability_zone = var.av_zone_primaria
    db_subnet_group_name = aws_db_subnet_group.grupo_subnets.name
    vpc_security_group_ids = [aws_security_group.sg_rds.id]
    tags = {
      "Name" = "rds_proyecto_lucas"
    }
}
















