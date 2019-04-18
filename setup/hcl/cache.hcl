services {
    id   = "emojify-cache"
    name = "emojify-cache"
    port = 9090

    connect {
        sidecar_service {
            port = 20000

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