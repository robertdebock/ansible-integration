resource "digitalocean_droplet" "machine8" {
  image    = "centos-7-x64"
  name     = "machine8.meinit.nl"
  region   = "lon1"
  size     = "1gb"
  ssh_keys = ["${digitalocean_ssh_key.default.id}"]
}

resource "cloudflare_record" "machine8" {
  domain = "meinit.nl"
  name   = "machine8"
  value  = "${digitalocean_droplet.machine8.ipv4_address}"
  type   = "A"
  ttl    = 300
}

resource "digitalocean_droplet" "machine9" {
  image    = "ubuntu-18-04-x64"
  name     = "machine9.meinit.nl"
  region   = "lon1"
  size     = "2gb"
  ssh_keys = ["${digitalocean_ssh_key.default.id}"]
}

resource "cloudflare_record" "machine9" {
  domain = "meinit.nl"
  name   = "machine9"
  value  = "${digitalocean_droplet.machine9.ipv4_address}"
  type   = "A"
  ttl    = 300
}
