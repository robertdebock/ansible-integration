variable "do_token" {}
variable "cf_token" {}

provider "digitalocean" {
  version = "~> 1.20"
  token = var.do_token
}

provider "cloudflare" {
  version = "~> 2.0"
  api_key = var.cf_token
  email = "robert@meinit.nl"
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

resource "cloudflare_record" "server1" {
  zone_id = "meinit.nl"
  name    = "server1"
  value   = digitalocean_droplet.server1.ipv4_address
  type    = "A"
  ttl     = 3600
}

resource "digitalocean_droplet" "server2" {
  image    = "centos-7-x64"
  name     = "server2.meinit.nl"
  region   = "ams3"
  size     = "4gb"
  ssh_keys = [digitalocean_ssh_key.default.id]
}

resource "cloudflare_record" "server2" {
  zone_id = "meinit.nl"
  name    = "server2"
  value   = digitalocean_droplet.server2.ipv4_address
  type    = "A"
  ttl     = 3600
}