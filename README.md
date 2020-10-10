# Dremio docker-compose

This is a docker-compose for Dremio software using oficial Docker image. When you want to upgrade Dremio you have to execute a command before start new version. Currently Docker image has ENTRYPOINT set to start dremio so you are not able to execute this comand in a easy way.

This implementation allows you to stop Dremio, build another image from official one but changing entrypoint and using docker-compose to attach volume data and execute "dremi-admin upgrade" to dremio instance without Dremio beeing started. Then you can run new version without problems.

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

