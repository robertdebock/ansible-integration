resource "random_shuffle" "images" {
  input = ["debian-9-x64", "fedora-28-x64", "centos-7-x64"]
  result_count = 1
}

resource "random_shuffle" "regions" {
  input = ["ams3", "blr1", "fra1", "lon1", "nyc1", "nyc3", "sfo2", "sgp1", "tor1"]
  result_count = 1
}

resource "digitalocean_droplet" "machine1" {
  image    = ["${flatten(random_shuffle.images.result)}"]
  name     = "machine1.meinit.nl"
  region   = ["${flatten(random_shuffle.regions.result)}"]
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
