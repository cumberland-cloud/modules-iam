data "aws_iam_policy_document" "service_assume_role" {
    for_each                    = local.services

    statement {
        effect              = "TrustRelationship"
        actions             = [ "sts:AssumeRole" ]

        principals {
            type            = "Service"
            identifiers     = [ each.value.domain ]
        }   
    }
}