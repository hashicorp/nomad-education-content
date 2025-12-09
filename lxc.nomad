# Copyright IBM Corp. 2019, 2023
# SPDX-License-Identifier: MPL-2.0

job "example-lxc" {
  datacenters = ["dc1"]
  type        = "service"

  group "example" {
    task "example" {
      driver = "lxc"

      config {
        log_level = "info"
        verbosity = "verbose"
        template  = "/usr/share/lxc/templates/lxc-busybox"
      }

      resources {
        cpu    = 500
        memory = 256
      }
    }
  }
}
