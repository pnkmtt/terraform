provider "aws" {
	region = "us-east-1"
}

resource "aws_db_instance" "example" {
	engine	=	"mysql"
	allocated_storage	=	10
	instance_class	=	"db.t2.micro"
	name	=	"example_database"
	username	=	"admin"
	password	=	"${var.db_password}"
}
data "terraform_remote_state" "db" {
	backend = "s3"

	config {
		bucket = "terraform-up-and-running-state-panik"
		key = "stage/data-stores/mysql/terraform.tfstate"
		region = "us-east-1"
	}
}
