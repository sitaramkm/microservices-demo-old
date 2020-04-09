/////////////////////////////
///// AWS Provider

provider "aws" {
  region                  = "us-east-1"
  profile                 = "default"
  shared_credentials_file = "~/.aws/credentials"
}


/////////////////////////////
///// Venafi Cloud Provider

provider "venafi" {
  api_key      = "${var.api_key}"
  zone         = "${var.venafi_zone_id}"
}

/////////////////////////////
///// Venafi Certificate

## Request certificate from Venafi
resource "venafi_certificate" "web" {
  common_name = "${var.store-name}.${var.domain}"
}

## Venafi created certificate is imported to AWS ACM for futher use by AWS services.
resource "aws_acm_certificate" "cert" {
    private_key = "${venafi_certificate.web.private_key_pem}"
    certificate_body = "${venafi_certificate.web.certificate}"
    certificate_chain = "${venafi_certificate.web.chain}"
}