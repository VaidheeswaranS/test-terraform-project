
variable "subnet_filter" {
    description = "The subnet in which the instance need to be launched"
    type = string
    default = ""
}

variable "create_db" {
    description = "Determines wehther to create the DB or not"
    type = bool
    default = true
}
variable "db_indentifier" {
  description = "The name of the RDS instance, if omitted, Terraform will assign a random, unique identifier"
  type = string
  default = ""
}
variable "engine" {
  description = "The database engine to use"
  type = string
  default = ""
}
variable "engine_version" {
  description = "The engine version to use"
  type = string
  default = ""
}
variable "instance_class" {
  description = "The instance type of the RDS instance"
  type = string
  default = ""
}

variable "allocated_storage" {
  description = "The allocated storage in gigabytes"
  type = string
  default = ""
}

variable "storage_type" {
  description = "The type of storage"
  type = string
  default     = "gp2"
}

variable "storage_encrypted" {
  description = "Specifies whether the DB instance is encrypted"
  type = string
  default = false
}

variable "kms_key_id" {
  description = "The ARN for the KMS encryption key. If creating an encrypted replica, set this to the destination KMS ARN. If storage_encrypted is set to true and kms_key_id is not specified the default KMS key created in your account will be used"
  type = string
  default     = ""
}

variable "name" {
  description = "The DB name to create. If omitted, no database is created initially"
  type = string
  default = ""
}

variable "username" {
  description = "Username for the master DB user"
  type = string
  default = ""
}

variable "password" {
  description = "Password for the master DB user. Password given here is random. Please change the passowrd once the instance is launched"
  type = string
  default = ""
}

variable "port" {
  description = "The port on which the DB accepts connections"
  type = string
  default = ""
}

variable "iam_database_authentication_enabled" {
  description = "Specifies whether or mappings of AWS Identity and Access Management (IAM) accounts to database accounts is enabled"
  type = bool
  default     = false
}

variable "allow_major_version_upgrade" {
  description = "Indicates that major version upgrades are allowed. Changing this parameter does not result in an outage and the change is asynchronously applied as soon as possible"
  type = bool
  default     = false
}

variable "auto_minor_version_upgrade" {
  description = "Indicates that minor engine upgrades will be applied automatically to the DB instance during the maintenance window"
  type = bool
  default     = true
}

variable "apply_immediately" {
  description = "Specifies whether any database modifications are applied immediately, or during the next maintenance window"
  type = bool
  default     = false
}

variable "maintenance_window" {
  description = "The window to perform maintenance in. Syntax: 'ddd:hh24:mi-ddd:hh24:mi'. Eg: 'Mon:00:00-Mon:03:00'"
  type = string
  default = ""
}

variable "skip_final_snapshot" {
  description = "Determines whether a final DB snapshot is created before the DB instance is deleted. If true is specified, no DBSnapshot is created. If false is specified, a DB snapshot is created before the DB instance is deleted, using the value from final_snapshot_identifier"
  type = bool
  default     = false
}

variable "final_snapshot_identifier" {
  description = "The name of your final DB snapshot when this DB instance is deleted."
  type = string
  default     = ""
}

variable "backup_retention_period" {
  description = "The days to retain backups for"
  type = number
  default     = 3
}

variable "backup_window" {
  description = "The daily time range (in UTC) during which automated backups are created if they are enabled. Example: '09:46-10:16'. Must not overlap with maintenance_window"
  type = string
  default = ""
}

variable "deletion_protection" {
  description = "The database can't be deleted when this value is set to true."
  type = bool
  default     = false
}

variable "name_prefix" {
    description = "The name of the db subnet group"
    type = string
    default = ""
}

variable "subnet_ids" {
    description = "The list of subnets for the DB"
    type = list
    default = []
}

variable "identifier" {
    description = "The name of the DB instance"
    type = string
    default = ""
}

variable "sg_name" {
    description = "The name of the security group"
    type = string
    default = ""
}

variable "sg_tags" {
    description = "The tags for the security group"
    type = map
    default = {}
}

variable "sg_rules" {
    description = "The list of security group ingress rules"
    type = list
    default = []
}