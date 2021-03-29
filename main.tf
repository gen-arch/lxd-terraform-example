# create type for vm
resource "lxd_container" "zabbix" {
  name     = "zabbix"
  image    = "ubuntu:20.04"
  profiles = [lxd_profile.zabbix.name]
  type     = "virtual-machine"
}

# create type for container
resource "lxd_container" "u1" {
  name     = "u1"
  image    = "ubuntu:20.04"
  profiles = [lxd_profile.app.name]
}

#resource "lxd_container" "a1" {
#  name     = "a1"
#  image    = "images:archlinux/cloud"
#  profiles = [lxd_profile.archlinux.name]
#}


