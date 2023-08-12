instance_count              = 3
name                        = "web-server"
ami                         = "ami-089ffe32605122764"
instance_type               = "t2.micro"
subnet_filter               = "pub-sub-*"
associate_public_ip_address = true
key_name                    = "ec2"
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
    "Name"      = "ebs_web"
    "encrypted" = "false"
}

tags = {
    "type" = "web-server"
    "description" = "EC2 instance for web server"
}

sg_name = "web_sg"

sg_tags = {
    "descrition" = "The security group that allows SSH and HTTP port access from anywhere"
}

sg_rules = [
    {
        type        = "ingress" 
        description = "Allows SSH access from anywhere"
        from_port   = "22"
        to_port     = "22"
        protocol    = "TCP"
        cidr_blocks = ["0.0.0.0/0"] # Restrict this to a specific IP range or your IP to strict security
    }
]