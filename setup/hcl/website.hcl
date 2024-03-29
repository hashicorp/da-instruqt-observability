# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MIT

services {
    id   = "emojify-website"
    name = "emojify-website"
    port = 5000

    connect {
        sidecar_service {
            port = 20000

            proxy {
                local_service_address = "127.0.0.1"
                local_service_port = 80

                config {
                    protocol = "http"
                    envoy_statsd_url = "udp://127.0.0.1:9125"
                }
            }
        }
    }
}