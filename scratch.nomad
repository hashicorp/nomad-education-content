# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

# job to support the "exec-users-host-volumes" guide on learn.
# Requires a host volume to be configured on the client named
# "scratch".

job "scratch" {
  datacenters = ["dc1"]
  type        = "service"

  group "group" {
    volume "scratch" {
      type      = "host"
      source    = "scratch"
      read_only = false
    }

    count = 1

    task "nobody" {
      volume_mount {
        volume      = "scratch"
        destination = "/scratch"
      }

      driver = "exec"

      config {
        command = "bash"
        args    = ["-c", "while true; do sleep 500; done"]
      }
    }

    task "user1" {
      volume_mount {
        volume      = "scratch"
        destination = "/scratch"
      }

      driver = "exec"

      config {
        command = "bash"
        args    = ["-c", "while true; do sleep 500; done"]
      }

      user = "user1"
    }
  }
}
