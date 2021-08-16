provider "aws" {
  region = var.aws_region
}

/*
  Manually fill out the configuration block,
  as TF does not import configuration, only resources.
  Then:
    terraform init
    terraform import aws_instance.appserver_example <aws_instance_id>

  Import is first prepared, before it's success
*/
resource "aws_instance" "appserver_example" {
  ami           = var.aws_ami
  instance_type = "t2.micro"
}

output "inst_id" {
  value = aws_instance.appserver_example.id
}