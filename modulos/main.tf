#-----------------------------------------
#     DEFINIMOS EL PROVEEDOR             -
#-----------------------------------------

terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.20.1"
    }
  }
}

provider "aws" {
  default_tags {
    tags = {
      env = "ac-tr-202206",
      "cost:env" = "academy",
      "cost:project" = "ac-us-terraform-202206"
    }
  }
}

#-----------------------------------------
#     CREAMOS LA RED USANDO MÓDULOS      -
#-----------------------------------------

module "networking_module" {
    source = "./network"

    //Estas variables no son necesarias puesto que el modulo las tiene seteadas por defecto, aún así, para probar, las paso igualmente.
    vpc_cidr = "10.0.0.0/16"
    av_zone_primaria = "us-east-1a"
    av_zone_secundaria = "us-east-1b"
}


    //Al usar este modulo lanza un fallo que no logro solucionar, diciendo que no se encuentran los security groups, sin embargo los mismos si existen y lo verifique por consola.
module "instancia_rds_module" {
    source = "./instancia_rds"

    depends_on = [
      module.networking_module
    ]
    //Usamos los outputs del modulo networking para configurar el modulo instancia_rds
    
    //Variables de EC2
    av_zone_primaria = module.networking_module.av_zone_1
    av_zone_secundaria = module.networking_module.av_zone_2
    sg_name = module.networking_module.sg_instance_name
    subnet_1_id = module.networking_module.subnet_1_id

    //Variables de RDS

    rds_db_name = "lucas_db"
    rds_user = "lucas_terraform"
    rds_user_pwd = "t3rr4f04m"
    sg_rds_name = module.networking_module.sg_rds_name
    subnet_group_name = module.networking_module.subnet_group_name
}
