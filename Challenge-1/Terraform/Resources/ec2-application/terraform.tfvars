instance_count              = 3
name                        = "app-server"
ami                         = "ami-02f5781cba46a5e8a"
instance_type               = "t2.micro"
subnet_filter               = "pri-sub-*"
associate_public_ip_address = false
key_name                    = "london"
user_data                   = "user_data.sh"

root_block_device = [
    {
        volume_type           = "gp2"
        volume_size           = 10
        delete_on_termination = "true"
        encypted              = "false"
    }
]

volume_tags = {
    "Name"      = "ebs_application"
    "encrypted" = "false"
}

tags = {
    "type" = "application-server"
    "description" = "EC2 instance for Application"
}

sg_name = "app_sg"

sg_tags = {
    "descrition" = "The security group that allows SSH port to access the application from anywhere"
}

sg_rules = [
    {
        type        = "ingress" 
        description = "Allows SSH access from anywhere"
        from_port   = "22"
        to_port     = "22"
        protocol    = "TCP"
        cidr_blocks = ["0.0.0.0/0"]
    }
]