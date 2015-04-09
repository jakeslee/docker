# jakes/nginx-proxy

![nginx 1.7.11](https://img.shields.io/badge/nginx-1.7.11-brightgreen.svg) ![License MIT](https://img.shields.io/badge/license-MIT-blue.svg)

### Changes
---

- Turn on SPDY support for SSL.
- ~~The image set *client_max_body_size* to 100m.~~

- Remove *client_max_body_size* from Dockfile. 

### TODO
---

If you want to change *client_max_body_size*, please mount directory /etc/nginx/vhost.d/ to host, then create a file named VIRTUAL_HOST.conf for specified container.

```yml
web:
  image: wordpress
  links:
    - db:db
  environment:
    - VIRTUAL_HOST=example.com
    - VIRTUAL_PORT=80
```

You can specify a path on the host machine (==HOST:CONTAINER==) via volumes.

```
conffile:
  image: busybox
  command: echo "conf store"
  volumes:
    - /path/to/vhost:/etc/nginx/vhost.d
```

Then mount it it *web*.

```
web:
  ...
  volumes_from:
    - conffile
  ...
```

Finally, create a file example.com.conf in /path/to/vhost, such as we want to set custom *client_max_body_size* for example.com. And restart nginx container to apply new configuration.

```
$ echo 'client_max_body_size 100m;' > /path/to/vhost/example.com/conf
```

