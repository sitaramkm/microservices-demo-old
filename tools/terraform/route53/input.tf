/////////////////////////////
///// AWS Inputs

variable "domain" {
    default = "example.com"
    description = "The domain you own and want to use."
}

variable "store_name" {
    default = "samplestore01"
    description = "The subdomain you want to create a record set for under the domain you own"
}

variable "external_ip_from_frontend_svc" {
  default = "REPLACE_WITH_THE_VALUE_OF_EXTERNAL_IP"
  description = "Your output from kubectl get svc frontend-external -o jsonpath=\"{.status.loadBalancer.ingress[*].hostname}\""
}