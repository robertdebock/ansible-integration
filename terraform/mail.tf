resource "digitalocean_droplet" "machine1" {
  image    = "debian-9-x64"
  name     = "machine1.meinit.nl"
  region   = "nyc3"
  size     = "512mb"
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
  image    = "fedora-28-x64"
  name     = "machine2.meinit.nl"
  region   = "nyc3"
  size     = "512mb"
  ssh_keys = ["${digitalocean_ssh_key.default.id}"]
}

resource "cloudflare_record" "machine2" {
  domain = "meinit.nl"
  name   = "machine2"
  value  = "${digitalocean_droplet.machine2.ipv4_address}"
  type   = "A"
  ttl    = 300
}

resource "digitalocean_droplet" "machine3" {
  image    = "centos-7-x64"
  name     = "machine3.meinit.nl"
  region   = "nyc3"
  size     = "512mb"
  ssh_keys = ["${digitalocean_ssh_key.default.id}"]
}

resource "cloudflare_record" "machine3" {
  domain = "meinit.nl"
  name   = "machine3"
  value  = "${digitalocean_droplet.machine3.ipv4_address}"
  type   = "A"
  ttl    = 300
}
