resource "digitalocean_droplet" "machine8" {
  image    = "centos-7-x64"
  name     = "machine8.meinit.nl"
  region   = "ams3"
  size     = "2gb"
  ssh_keys = ["${digitalocean_ssh_key.default.id}"]
}

resource "cloudflare_record" "machine8" {
  domain = "meinit.nl"
  name   = "machine8"
  value  = "${digitalocean_droplet.machine8.ipv4_address}"
  type   = "A"
  ttl    = 300
}
