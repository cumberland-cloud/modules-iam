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