## rails_services -- Expanded Services for glitchwrks.com

This project is a result of outgrowing the smaller [counters (formerly site_services) Sinatra app](https://github.com/glitchwrks/counters) responsible for some of the dynamic features of glitchwrks.com. Thie original `counters` app was intended to be a microservice for a few simple functions, but ended up with interactive user-facing features bolted on the side.

This applications is currently deployed to an OpenBSD 7.6 host, running OpenBSD's `relayd` for reverse proxying and SSL/TLS.
