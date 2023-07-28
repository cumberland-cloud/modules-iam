data "aws_iam_policy_document" "service_assume_role" {
    for_each                    = local.service_roles

    statement {
        sid                 = "TrustRelationship"
        effect              = "Allow"
        actions             = [ "sts:AssumeRole" ]

        principals {
            type            = "Service"
            identifiers     = [ each.value.domain ]
        }   
    }
}

data "aws_iam_policy_document" "logging" {
    statement {
        effect              = "Allow"

        actions             = [
        "logs:CreateLogGroup",
        "logs:CreateLogStream",
        "logs:PutLogEvents"
        ]

        resources           = ["arn:aws:logs:*:*:*"]
    }
}


# TODO
# data "aws_iam_policy_document" "platform" { # TODO: policy for tenant access
#     statement {
#     }
# }

resource "aws_iam_policy" "this" {
    for_each                = local.policies

    name                    = each.value.name
    description             = each.value.description
    policy                  = each.value.policy
}