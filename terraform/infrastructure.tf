resource "digitalocean_droplet" "machine4" {
  image    = "centos-7-x64"
  name     = "machine4.meinit.nl"
  region   = "ams3"
  size     = "512mb"
  ssh_keys = ["${digitalocean_ssh_key.default.id}"]
}

resource "cloudflare_record" "machine4" {
  domain = "meinit.nl"
  name   = "machine4"
  value  = "${digitalocean_droplet.machine4.ipv4_address}"
  type   = "A"
  ttl    = 300
}

resource "digitalocean_droplet" "machine5" {
  image    = "centos-7-x64"
  name     = "machine5.meinit.nl"
  region   = "ams3"
  size     = "512mb"
  ssh_keys = ["${digitalocean_ssh_key.default.id}"]
}

resource "cloudflare_record" "machine5" {
  domain = "meinit.nl"
  name   = "machine5"
  value  = "${digitalocean_droplet.machine5.ipv4_address}"
  type   = "A"
  ttl    = 300
}
