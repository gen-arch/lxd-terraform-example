resource "lxd_profile" "zabbix" {
  name = "zabbix"

  config = {
    "boot.autostart"   = "true"
    "environment.HOGE" = "hogehoge"
    "user.user-data"   = file("./template/cloud-init/zabbix-docker.yml")
  }

  device {
    name = "eth0"
    type = "nic"
    properties = {
      network = lxd_network.net1.name
    }
  }

  device {
    name = "eth1"
    type = "nic"
    properties = {
      nictype : "macvlan"
      parent : "enp0s31f6" # write your device name
    }
  }

  device {
    name = "root"
    properties = {
      "path" = "/"
      "pool" = "default"
    }
    type = "disk"
  }
}

resource "lxd_profile" "app" {
  name = "app"

  config = {
    "boot.autostart"   = "true"
    "environment.HOGE" = "hogehoge"
    "user.user-data"   = file("./template/cloud-init/app.yml")
  }

  device {
    name = "eth0"
    type = "nic"
    properties = {
      network = lxd_network.net1.name
    }
  }

  device {
    name = "root"
    properties = {
      "path" = "/"
      "pool" = "default"
    }
    type = "disk"
  }
}


resource "lxd_profile" "archlinux" {
  name = "archlinux"

  config = {
    "boot.autostart" = "true"
    "user.user-data" = file("./template/cloud-init/archlinux.yml")
  }

  device {
    name = "eth0"
    type = "nic"
    properties = {
      network = lxd_network.net1.name
    }
  }

  device {
    name = "root"
    properties = {
      "path" = "/"
      "pool" = "default"
    }
    type = "disk"
  }
}

