// Variables EC2

variable "instance_type" {
    description = "Seleccione el sabor de la instancia"
    type = string
    default = "t2.micro"
}

variable "ssh_key" {
    description = "Seleccione el nombre de su key ssh"
    type = string
    default = "ac_ups_terraform_202206"
}

variable "instance_ami" {
    description = "Seleccione su ami"
    type = string
    default = "ami-0cff7528ff583bf9a"
}

variable "av_zone_primaria" {
    description = "Seleccione su AV"
    type = string
}

variable "av_zone_secundaria" {
    description = "Seleccione su AV secundaria"
    type = string
}

variable "sg_name" {
    description = "Nombre de security group para su instancia"
    type = string
}

variable "subnet_1_id" {
    description = "ID de subnet 1"
    type = string
  
}

//Variables RDS

variable "rds_engine" {
    description = "Seleccione el motor de su RDS"
    type = string
    default = "mysql"
}

variable "rds_instance_type" {
    description = "Seleccione el sabor de la instancia RDS"
    type = string
    default = "db.t3.micro"
}

variable "rds_db_name" {
    description = "Seleccione el nombre de su DB"
    type = string
}

variable "rds_user" {
    description = "Seleccione el usuario de su DB"
    type = string
}

variable "rds_user_pwd" {
    description = "Seleccione la password de su DB"
    type = string
}

variable "sg_rds_name" {
    description = "Nombre de security group para su DB"
    type = string
}

variable "subnet_group_name" {
    description = "Nombre del subnet group para RDS"
    type = string
  
}
