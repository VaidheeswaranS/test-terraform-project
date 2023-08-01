
output "db_instance_address" {
    description = "Address of the DB instance"
    value = aws_db_instance.db_instance.*.address
}

output "db_instance_arn" {
    description = "The ARN of the db instance"
    value = aws_db_instance.db_instance.*.arn
}

output "db_instance_endpoint" {
    description = "The endpoint of the DB instance"
    value = aws_db_instance.db_instance.*.endpoint
}

output "db_instance_id" {
    description = "The id of the DB instance"
    value = aws_db_instance.db_instance.*.id
}