resource "digitalocean_droplet" "machine1" {
  image    = "centos-7-x64"
  name     = "machine1.meinit.nl"
  region   = "ams3"
  size     = "2gb"
  ssh_keys = ["${digitalocean_ssh_key.default.id}"]
}

resource "cloudflare_record" "machine1" {
  domain = "meinit.nl"
  name   = "machine1"
  value  = "${digitalocean_droplet.machine1.ipv4_address}"
  type   = "A"
  ttl    = 300
}

resource "digitalocean_droplet" "machine2" {
  image    = "centos-7-x64"
  name     = "machine2.meinit.nl"
  region   = "ams3"
  size     = "4gb"
  ssh_keys = ["${digitalocean_ssh_key.default.id}"]
}

resource "cloudflare_record" "machine2" {
  domain = "meinit.nl"
  name   = "machine2"
  value  = "${digitalocean_droplet.machine2.ipv4_address}"
  type   = "A"
  ttl    = 300
}
