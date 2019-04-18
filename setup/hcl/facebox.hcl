services {
    id   = "emojify-facebox"
    name = "emojify-facebox"
    port = 8080

    connect {
        sidecar_service {
            port = 20000

            proxy {
                local_service_address = "127.0.0.1"
                local_service_port = 8080

                config {
                    protocol = "http"
                    envoy_statsd_url = "udp://127.0.0.1:9125"
                }
            }
        }
    }                                                                                         
} 