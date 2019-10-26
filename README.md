# honey_ports
Very simple but effective docker deployed honeypot to detect port scanning in your environment.

### Configure ports to be exposed
Edit or add ports within the brackets on line 14 of honey_ports.sh

```for p in {80,3306}; do```

Also expose corresponding ports in line 17 of dockerfile

```EXPOSE 80 3306```

### Build container image

```docker build -t honey_ports .```

### Run honey_ports container

```sudo docker run -d -v /var/log:/logs_out honey_ports```

By default logs of attempted connections will be written to "hp_connections.log" which is stored on a mounted volume on the host.
