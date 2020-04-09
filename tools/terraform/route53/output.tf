/////////////////////////////
///// Outputs

output "instance-app-url" {
    value = "${var.store_name}.${var.domain}"
    description = "publicly accessible store name"
}
