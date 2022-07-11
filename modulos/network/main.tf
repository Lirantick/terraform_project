resource "aws_vpc" "vpc_proyecto" {
    cidr_block = var.vpc_cidr
    
    tags = {
      "Name" = "vpc_lucas"
    }
}

resource "aws_internet_gateway" "internet_gateway_1" {
  vpc_id = aws_vpc.vpc_proyecto.id

  tags = {
    Name = "ig_proyecto_lucas"
  }
}


resource "aws_subnet" "subnet_1" {
    vpc_id = aws_vpc.vpc_proyecto.id
    cidr_block = var.subnet1_cidr
    availability_zone = var.av_zone_primaria

    tags = {
      "Name" = "vpc_subnet_lucas"
    }
    
    depends_on = [
      aws_vpc.vpc_proyecto
    ]
}

resource "aws_subnet" "subnet_2" {
    vpc_id = aws_vpc.vpc_proyecto.id
    cidr_block = var.subnet2_cidr
    availability_zone = var.av_zone_secundaria

    tags = {
      "Name" = "vpc_subnet_lucas_2"
    }
    
    depends_on = [
      aws_vpc.vpc_proyecto
    ]
}

resource "aws_db_subnet_group" "grupo_subnets" {
  name = var.subnet_group_name
  description = "grupo de subnets para proyecto"
  subnet_ids = ["${aws_subnet.subnet_1.id}", "${aws_subnet.subnet_2.id}"]
  
}

resource "aws_route_table" "route_table" {
  vpc_id = aws_vpc.vpc_proyecto.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.internet_gateway_1.id
  }
  
  tags = {
    Name = "route_table_lucas"
  }
}

resource "aws_route_table_association" "subnet_1" {
  subnet_id = aws_subnet.subnet_1.id
  route_table_id = aws_route_table.route_table.id
  
}

// Security group, utilizado para gestionar reglas de acceso y salida a los diferentes recursos de AWS.

resource "aws_security_group" "sg_instancia" {
    name = var.sg_group_instancia_name 
    description = "Permite a la instancia ser accedida desde SSH"
    vpc_id = aws_vpc.vpc_proyecto.id

  ingress {
    description = "SSH a Instancia"
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = [ "0.0.0.0/0" ]
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
 }

}

resource "aws_security_group" "sg_rds" {
    name = var.sg_group_rds_name
    description = "Permite a la instancia acceder a la BD"
    vpc_id = aws_vpc.vpc_proyecto.id

  ingress {
    description = "Desde instancia a RDS"
    from_port = 3306
    to_port = 3306
    protocol = "tcp"
    cidr_blocks = [ "0.0.0.0/0" ]
  }

}