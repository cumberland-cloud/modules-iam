locals {
    service_roles               = {
        api_gateway             = {
            domain              = "apigateway.amazonaws.com"
            name                = "api-gateway-executor"
            attachments         = {
                cloudwatch      = "arn:aws:iam::aws:policy/service-role/AmazonAPIGatewayPushToCloudWatchLogs"
            }
        }
        lambda                  = {
            domain              = "lambda.amazonaws.com"
            name                = "lambda-executor"
            attachments         = { }
        }
    }
    service_attachments         = flatten([
        for role_key, role in local.service_roles: [
            for policy_key, policy_arn in role.attachments: {
                role_key        = role_key
                policy_arn      = policy_arn
            }
        ]
    ])
    service_attachment_map      = {
        for index, attachment in local.service_attachments:
            index               => attachment
    }
    tenant_attachment_map       = {

    }
}