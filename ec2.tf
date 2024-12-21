# Proveedor de AWS
provider "aws" {
  region = "us-east-1" # Reemplaza con la región que deseas usar
}

# Definición de la instancia EC2
resource "aws_instance" "example" {
  ami           = "ami-0166fe664262f664c"  # Reemplaza con el ID de la AMI que deseas usar
  instance_type = "t2.micro"                # El tipo de instancia, elige según tus necesidades
  key_name      = "keypem1"             # Reemplaza con el nombre de tu par de claves

  # Configuración de red
  network_interface {
    network_interface_id = aws_network_interface.example.id
    device_index         = 0
  }

  # Configurar seguridad (puertos abiertos, como el puerto 22 para SSH)
  security_groups = ["default"]

  # Configuración de etiquetas
  tags = {
    Name = "MyTerraformEC2"
  }
}
