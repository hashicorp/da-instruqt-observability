# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MIT

services {
    id   = "emojify-facebox"
    name = "emojify-facebox"
    port = 9090

    connect {
        sidecar_service {
            port = 20003

            proxy {
                local_service_address = "127.0.0.1"
                local_service_port = 9090

                config {
                    protocol = "http"
                    envoy_statsd_url = "udp://127.0.0.1:9125"
                }
            }
        }
    }                                                                                         
} 