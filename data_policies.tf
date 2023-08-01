data "aws_iam_policy_document" "service_assume_role" {
    for_each                    = local.service_roles

    statement {
        sid                 = "ServiceTrustRelationship"
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
        sid                 = "LogPerms"
        effect              = "Allow"
        actions             = [
        "logs:CreateLogGroup",
        "logs:CreateLogStream",
        "logs:PutLogEvents"
        ]
        resources           = ["arn:aws:logs:*:*:*"]
    }
}