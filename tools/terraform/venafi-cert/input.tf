
variable "domain" {
    default = "example.com"
    description = "The domain you own and want to use."
}

variable "store-name" {
    default = "samplestore01"
    description = "The subdomain you want to create a record set for under the domain you own"
}

/////////////////////////////
///// Venafi inputs

variable "api_key" {
  default = "REPLACE_WITH_API_KEY"
  description = "API Key to access Venafi Cloud. You will find this when you login to Venafi Cloud"
}

variable "venafi_zone_id" {
  default = "REPLACE_WITH_ZONE_ID"
  description = "Zone ID for Venafi Cloud.You will find it when you login to Venafi Cloud"
}

 



