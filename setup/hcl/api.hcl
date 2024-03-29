# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MIT

services {
  id   = "emojify-api"
  name = "emojify-api"
  port = 9090

  connect {
    sidecar_service {
      port = 20001

      proxy {
        local_service_address = "127.0.0.1"
        local_service_port = 9090

        config {
          protocol = "http"
          envoy_statsd_url = "udp://127.0.0.1:9125"
        }

        upstreams {
            destination_name = "emojify-facebox"                                                                   
            local_bind_port = 8003

            config {
                protocol = "http"
            }
        }

        upstreams {
            destination_name = "emojify-cache"                                                                   
            local_bind_port = 8005
        }
      }
    }
  }
}