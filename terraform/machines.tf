resource "digitalocean_domain" "default" {
  name = "meinit.nl"
}

resource "digitalocean_droplet" "server1" {
  image    = "centos-7-x64"
  name     = "server1.meinit.nl"
  region   = "ams3"
  size     = "2gb"
  ssh_keys = ["digitalocean_ssh_key.default.id"]
}

resource "cloudflare_record" "server1" {
  domain = digitalocean_domain.default.name
  name   = "server1"
  value  = "digitalocean_droplet.server1.ipv4_address"
  type   = "A"
  ttl    = 300
}

resource "digitalocean_droplet" "server2" {
  image    = "centos-7-x64"
  name     = "server2.meinit.nl"
  region   = "ams3"
  size     = "4gb"
  ssh_keys = ["digitalocean_ssh_key.default.id"]
}

resource "cloudflare_record" "server2" {
  domain = digitalocean_domain.default.name
  name   = "server2"
  value  = "digitalocean_droplet.server2.ipv4_address"
  type   = "A"
  ttl    = 300
}
