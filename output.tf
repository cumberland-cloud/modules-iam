output "policies" {
    description         = "Map of IAM policies."
    value               = {
        for policy_key, policy in aws_iam_policy.this:
            policy_key  => {
                arn     = policy.arn
                id      = policy.id
                name    = policy.name
            }
    }
}

output "service_roles" {
    description         = "Map of IAM Service roles."
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
    description         = "Map of IAM tenant role attributes."
    value               = {
        arn             = aws_iam_role.tenant_role.arn
        id              = aws_iam_role.tenant_role.id
        name            = aws_iam_role.tenant_role.name
    }
}