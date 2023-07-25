data "aws_iam_policy_document" "service_assume_role" {
    for_each                    = local.services

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

data "aws_iam_policy_document" "platform" { # TODO: policy for tenant access
    statement {
    }
}