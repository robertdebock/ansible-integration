variable "do_token" {}

provider "digitalocean" {
  version = "~> 1.20"
  token = var.do_token
}
