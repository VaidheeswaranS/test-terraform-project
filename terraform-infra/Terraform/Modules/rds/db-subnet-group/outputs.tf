
output "db_subnet_group_id" {
  description = "The db subnet group name"
  value       = aws_db_subnet_group.db_subnet_group.id
}

output "db_subnet_group_arn" {
  description = "The db subnet group arn"
  value       = aws_db_subnet_group.db_subnet_group.arn
}