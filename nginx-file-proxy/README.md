# jakes/nginx-file-proxy
---

![nginx 1.7.11](https://img.shields.io/badge/nginx-latest-brightgreen.svg) ![License MIT](https://img.shields.io/badge/license-MIT-blue.svg)

This is a sample file proxy image. Also you can use it to fake Firewall.


### Usage
---

```
docker run -ti -p 80:80 -e SOURCE_URL="URL" -e HOSTNAME="HOSTNAME" jakes/nginx-file-proxy
```

#### Tips
1. SOURCE_URL must have prefix HTTP or HTTPS
2. HOSTNAME has no prefix
3. If you use other proxy to be front, please link the proxy container with alias 'host' and set HOSTNAME to domain triggered.

### Examples
---
#### Reverse Proxy for Google

It's very easy to do it. Run the command following:
```
docker run -ti -p 80:80 -e SOURCE_URL="https://www.google.com" -e HOSTNAME="YOU DOMAIN" jakes/nginx-file-proxy
```
