variable "vpc_cidr" {
    description = "Seleccione el CIDR para su VPC"
    type = string
    default = "10.0.0.0/16"
}

variable "subnet1_cidr" {
    description = "Seleccione el CIDR para su VPC"
    type = string
    default = "10.0.1.0/24"
}

variable "subnet2_cidr" {
    description = "Seleccione el CIDR para su VPC"
    type = string
    default = "10.0.2.0/24"
}

variable "av_zone_primaria" {
    description = "Seleccione su AV"
    type = string
    default = "us-east-1a"
}

variable "av_zone_secundaria" {
    description = "Seleccione su AV secundaria"
    type = string
    default = "us-east-1b"
}

variable "subnet_group_name" {
    description = "Nombre de grupo de subnets"
    type = string
    default = "subnet_group_rds"
}

variable "sg_group_instancia_name" {
    description = "Nombre del SG de la instancia "
    type = string
    default = "sg_group_instancia"
}

variable "sg_group_rds_name" {
    description = "Nombre del SG de RDS "
    type = string
    default = "sg_group_rds"
}