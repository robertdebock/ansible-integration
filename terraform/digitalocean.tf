variable "do_token" {}

provider "digitalocean" {
  version = "~> 1.20"
  token = var.do_token
}

resource "digitalocean_ssh_key" "default" {
  name       = "integration"
  public_key = file("id_rsa.pub")
}

resource "digitalocean_droplet" "server1" {
  image    = "centos-7-x64"
  name     = "server1.meinit.nl"
  region   = "ams3"
  size     = "2gb"
  ssh_keys = [digitalocean_ssh_key.default.id]
}

resource "digitalocean_droplet" "server2" {
  image    = "centos-7-x64"
  name     = "server2.meinit.nl"
  region   = "ams3"
  size     = "4gb"
  ssh_keys = [digitalocean_ssh_key.default.id]
}

data "digitalocean_domain" "default" {
   name = "meinit.nl"
}

resource "digitalocean_record" "server1" {
  domain = data.digitalocean_domain.default.name
  type = "A"
  name = "server1"
  value = digitalocean_droplet.server1.ipv4_address
}

resource "digitalocean_record" "server2" {
  domain = data.digitalocean_domain.default.name
  type = "A"
  name = "server2"
  value = digitalocean_droplet.server2.ipv4_address
}
