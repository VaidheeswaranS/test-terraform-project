
subnet_filter = "pri-sub-*"
db_indentifier = "mysql-db"
engine = "mysql"
engine_version= "5.7"
instance_class = "db.t2.micro"
allocated_storage = "20"
storage_type = "gp2"
name = "my_db"
username = "master_user"
password = "master_password" # Change this once the instance is created to avoid security risk
port = "3306"
final_snapshot_identifier = "mysql-db-final-snapshot"

sg_name = "db_sg"

sg_tags = {
    "descrition" = "The security group that allows DB port access only from VPC"
}

sg_rules = [
  {
    "type"        = "ingress"
    "description" = "RDS Access from VPC"
    "from_port"   = "3306"
    "to_port"     = "3306"
    "protocol"    = "TCP"
    "cidr_blocks" = ["10.0.0.0/16"]
  },     
  {
    "type"        = "egress"
    "description" = "Allow all access"
    "from_port"   = "-1"
    "to_port"     = "-1"
    "protocol"    = "-1"
    "cidr_blocks" = ["0.0.0.0/0"]
  }
]
