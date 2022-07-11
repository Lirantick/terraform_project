// Instancia
resource "aws_instance" "instancia_1" {
    ami = var.instance_ami
    instance_type = var.instance_type
    key_name = var.ssh_key
    availability_zone = var.av_zone_primaria
    vpc_security_group_ids = [var.sg_name]
    subnet_id = var.subnet_1_id
    tags = {
      "Name" = "ec2_proyecto_lucas"
    }
}


// Instancia de RDS con MySQL
resource "aws_db_instance" "rds_1" {
    allocated_storage = 10
    engine = var.rds_engine
    engine_version = 5.7
    instance_class = var.rds_instance_type
    db_name = "upskilling_db"
    username = var.rds_user
    password = var.rds_user_pwd
    apply_immediately = true
    skip_final_snapshot = true
    availability_zone = var.av_zone_primaria
    db_subnet_group_name = var.subnet_group_name
    vpc_security_group_ids = [var.sg_rds_name]
    tags = {
      "Name" = "rds_proyecto_lucas"
    }
}

resource "aws_eip" "elastic_ip_instancia" {
  instance = aws_instance.instancia_1.id
  vpc = true
  
}