
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