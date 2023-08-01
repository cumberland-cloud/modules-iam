variable "namespace" {
    type                = string
    description         = "Namespace of the application"
}

variable "cognito_audiences" {
    type                = list(string)
    description         = "List of Cognito audiences for the Trust Relationship in the Tenant Assume Role policy."
}