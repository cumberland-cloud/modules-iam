resource "aws_iam_policy" "this" {
    for_each                = local.policies

    name                    = each.value.name
    description             = each.value.description
    policy                  = each.value.policy
}