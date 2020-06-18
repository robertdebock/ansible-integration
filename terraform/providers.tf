variable "do_token" {}

provider "digitalocean" {
  version = "~> 2.7"
  token = "${var.do_token}"
}

variable "cloudflare_email" {}
variable "cloudflare_token" {}

provider "cloudflare" {
  version = "~> 2.0"
  email = "${var.cloudflare_email}"
  api_key = "${var.cloudflare_token}"
}
