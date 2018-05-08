resource "digitalocean_ssh_key" "default" {
  name       = "integration"
  public_key = "${file("id_rsa.pub")}"
}
