resource "digitalocean_ssh_key" "default" {
  name       = "integration"
  public_key = "${file("id_rsa.pub")}"
}

resource "digitalocean_droplet" "machine6" {
  image    = "centos-7-x64"
  name     = "machine6.meinit.nl"
  region   = "ams3"
  size     = "512mb"
  ssh_keys = ["${digitalocean_ssh_key.default.id}"]
}

resource "cloudflare_record" "machine6" {
  domain = "meinit.nl"
  name   = "machine6"
  value  = "${digitalocean_droplet.machine6.ipv4_address}"
  type   = "A"
  ttl    = 300
}

resource "digitalocean_droplet" "machine7" {
  image    = "centos-7-x64"
  name     = "machine7.meinit.nl"
  region   = "ams3"
  size     = "512mb"
  ssh_keys = ["${digitalocean_ssh_key.default.id}"]
}

resource "cloudflare_record" "machine7" {
  domain = "meinit.nl"
  name   = "machine7"
  value  = "${digitalocean_droplet.machine7.ipv4_address}"
  type   = "A"
  ttl    = 300
}
