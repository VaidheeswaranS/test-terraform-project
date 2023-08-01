
resource "aws_db_subnet_group" "db_subnet_group" {
    name_prefix = var.name_prefix
    description = "The subnet group for the DB instance"
    subnet_ids = var.subnet_ids

    tags = {
        Name = format("%s-%s", "db-subnet-group", var.identifier)
    }
}