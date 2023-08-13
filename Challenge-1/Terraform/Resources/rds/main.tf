
locals {
    db_subnet_groupp_name = module.db_subnet_group.db_subnet_group_id
}

module "db" {
    source = "../Challenge-1/Terraform/Modules/rds/db-instance"
    create_db = var.create_db
    db_indentifier = var.db_indentifier
    engine = var.engine
    engine_version = var.engine_version
    instance_class = var.instance_class
    allocated_storage = var.allocated_storage
    storage_type = var.storage_type
    storage_encrypted = var.storage_encrypted
    kms_key_id = var.kms_key_id
    name = var.name
    username = var.username
    password = var.password
    port = var.port
    iam_database_authentication_enabled = var.iam_database_authentication_enabled
    vpc_security_group_ids = concat([aws_security_group.tf_sg.id], [data.terraform_remote_state.vpc.outputs.vpc_default_security_group])
    db_subnet_group_name = local.db_subnet_groupp_name
    allow_major_version_upgrade = var.allow_major_version_upgrade
    auto_minor_version_upgrade = var.auto_minor_version_upgrade
    apply_immediately = var.apply_immediately
    maintenance_window = var.maintenance_window
    skip_final_snapshot = var.skip_final_snapshot
    final_snapshot_identifier = var.final_snapshot_identifier
    backup_retention_period = var.backup_retention_period
    backup_window = var.backup_window
    deletion_protection = var.deletion_protection
}

module "db_subnet_group" {
    source = "../Challenge-1/Terraform/Modules/rds/db-subnet-group"
    name_prefix = var.db_indentifier
    subnet_ids = data.aws_subnet_ids.subnet_ids.ids
    identifier = var.db_indentifier
}