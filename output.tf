output "policies" {
    value               = {
        for policy_key, policy in aws_iam_policy.this:
            policy_key  => {
                arn     = policy.arn
                id      = policy.id
                name    = policy.name
            }
    }
}

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

output "tenant_role" {
    value               = {
        arn             = aws_iam_role.tenant_role.arn
        id              = aws_iam_role.tenant_role.id
        name            = aws_iam_role.tenant_role.name
    }
}