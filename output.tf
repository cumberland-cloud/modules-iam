output "services_roles" {
    value               = {
        for role_key, role in aws_iam_role.service_roles:
            role_key    => {
                arn     = role.arn
                id      = role.id
                name    = role.name
            }
    }
}