# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MIT

services {
    id   = "emojify-ingress"
    name = "emojify-ingress"
    port = 80

    connect {
        sidecar_service {
            port = 20002

            proxy {
                local_service_address = "127.0.0.1"
                local_service_port = 80

                config {
                    protocol = "http"
                    envoy_statsd_url = "udp://127.0.0.1:9125"
                }

                upstreams {
                    destination_name = "emojify-website"                                                                   
                    local_bind_port = 8000

                    config {
                        protocol = "http"
                    }
                }

                upstreams {
                    destination_name = "emojify-api"                                                                   
                    local_bind_port = 8001

                    config {
                        protocol = "http"
                    }
                }
            }
        }
    }
}