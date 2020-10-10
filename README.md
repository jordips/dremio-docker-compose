# Dremio docker-compose

This is a docker-compose for Dremio software using oficial Docker image. As you may know, to upgrade Dremio we


## Start dremio in background mode
```
docker-compose up -d
```

## Upgrade dremio to new version:

If you want to upgrade dremio to certain version these are the steps you have to follow (set UPGRADE_VERSION to desired version, replace X.X.X for instance 4.8.0):
```
docker-compose down
docker-compose -f docker-compose.upgrade.yml build --build-arg UPGRADE_VERSION=X.X.X
docker-compose -f docker-compose.upgrade.yml run dremio "/opt/dremio/bin/dremio-admin upgrade"
docker-compose down
```

Right now, you only have to change version in docker-compose.yml to the new version:
```
version: "3"

services:
  dremio:
    restart: always
    image: dremio/dremio-oss:X.X.X    # Change X.X.X to UPGRADE_VERSION

```

and run:
```
docker-compose up -d
```

