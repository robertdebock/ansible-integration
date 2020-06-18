resource "digitalocean_droplet" "server1" {
  image    = "centos-7-x64"
  name     = "server1.meinit.nl"
  region   = "ams3"
  size     = "2gb"
  ssh_keys = ["digitalocean_ssh_key.default.id"]
}

resource "digitalocean_droplet" "server2" {
  image    = "centos-7-x64"
  name     = "server2.meinit.nl"
  region   = "ams3"
  size     = "4gb"
  ssh_keys = ["digitalocean_ssh_key.default.id"]
}
