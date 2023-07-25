resource "aws_iam_role" "tenant_role" {
    name                = each.value.name
    assume_role_policy  = data.aws_iam_policy_document.service_assume_role[each.key].json
}

resource "aws_iam_role_policy_attachment" "tenant_role_attachments" {
    for_each            = local.tenant_attachment_map

    role_name           = aws_iam_role.service_roles[each.value.role_key].name
    policy_arn          = each.value.policy_arn
}