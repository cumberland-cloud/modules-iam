resource "aws_iam_role" "services_roles" {
    for_each            = local.service_roles

    name                = each.value.name
    assume_role_policy  = data.aws_iam_policy_document.service_assume_role[each.key].json
}

resource "aws_iam_role_policy_attachment" "service_role_attachments" {
    for_each            = local.service_attachment_map

    role                = aws_iam_role.service_roles[each.value.role_key].name
    policy_arn          = each.value.policy_arn
}