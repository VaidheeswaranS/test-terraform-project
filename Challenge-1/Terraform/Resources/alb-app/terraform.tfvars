name                             = "app-alb"
subnet_filter                    = "pri-sub-*"
enable_cross_zone_load_balancing = true
is_load_balancer_internal        = true

lb_tags = {
    "Type" = "app-alb"
}

target_groups = [
    {
        name     = "app-tg"
        port     = "8080"
        protocol = "HTTP"
    }
]

http_tcp_listeners = [
    {
        port     = "80"
        protocol = "HTTP"
    }
]

tg_tags = {
    "Name"         = "app-tg"
    "Type"         = "app servers TG"
}

sg_name = "app_alb_security_group"

sg_tags = {
    "description" = "The security group that allows HTTP access from anywhere for the ALB"
}

sg_rules = [
    {
        type        = "ingress"
        description = "Allow HTTP access from anywhere"
        from_port   = "80"
        to_port     = "80"
        protocol    = "TCP"
        cidr_blocks = ["0.0.0.0/0"]
    },
    {
        type        = "egress"
        description = "Allow all access"
        from_port   = "-1"
        to_port     = "-1"
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
]