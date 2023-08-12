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