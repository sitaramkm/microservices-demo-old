/////////////////////////////
///// AWS Provider

provider "aws" {
  region                  = "us-east-1"
  profile                 = "default"
  shared_credentials_file = "~/.aws/credentials"
}

/////////////////////////////
///// DNS Record
data "aws_route53_zone" "exampledomain" {
     name = "${var.domain}."
}

resource "aws_route53_record" "record-set" {
  zone_id = "${data.aws_route53_zone.exampledomain.zone_id}"
  name    = "${var.store_name}.${var.domain}"
  type    = "CNAME"
  ttl     = "300"
  records = ["${var.external_ip_from_frontend_svc}"]
}
