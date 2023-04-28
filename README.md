# ShadBot Environment #

## Docker ##
---
If your docker-compose version is less than 2.1.0 please upgrade it. 
The reason is that after 2.1.0 docker include the DOCKER_BUILDKIT=1 in their default config

### LocalOsmosis ###
---
Create the LocalOsmosis image: 
```
$ osmosis/make localnet-build
```

### LocalSecret ###
 ---
( if use pulsar2 - testnet skip this step)


Pull the LocalSecret image
```
$ secret/docker pull ghcr.io/scrtlabs/localsecret
```

### Build containers ###
---
```
$ docker-compose -f tokentransfer.yml build --no-cache
```

### Run containers ###
---
``` 
$ docker-compose -f tokentransfer.yml up -d

$ docker-compose -f tokentransfer.yml down 
```

### Pulsar2 - SecretTestnet ###
---

Uncoment the chain _[pulsar-2]_ in _relayer_hermes/config.toml_

### Note ###
If modify the configuration file just rebuild the containers!

### Run Hermes ###
---

```
$ docker exec -it relayer bash
$ root@71a69ae93138:/home/hermes# ./run_relayer



```

``` 
$ docker exec relayer hermes query connections --chain localosmosis 

$ docker exec relayer hermes query connections --chain localsecret

$ docker exec relayer hermes query connections --chain pulsar-2

```

Have fun!