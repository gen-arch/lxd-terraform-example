resource "lxd_network" "net1" {
  name = "net1"

  config = {
    "ipv4.address" = "10.150.19.1/24"
    "ipv4.nat"     = "true"
  }
}
