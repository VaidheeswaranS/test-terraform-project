
resource "aws_db_instance" "db_instance" {
    count = var.create_db ? 1 : 0
    identifier = var.db_indentifier
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
    vpc_security_group_ids = var.vpc_security_group_ids
    db_subnet_group_name = var.db_subnet_group_name
    allow_major_version_upgrade = var.allow_major_version_upgrade
    auto_minor_version_upgrade = var.auto_minor_version_upgrade
    apply_immediately = var.apply_immediately
    maintenance_window = var.maintenance_window
    skip_final_snapshot = var.skip_final_snapshot
    final_snapshot_identifier = var.final_snapshot_identifier
    backup_retention_period = var.backup_retention_period
    backup_window = var.backup_window
    deletion_protection = var.deletion_protection

    timeouts {
        create = var.create_db_timeout
        update = var.update_db_timeout
        delete = var.delete_db_timeout
    }
}