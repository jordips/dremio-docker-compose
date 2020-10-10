# Dremio docker-compose

This is a docker-compose for Dremio software using oficial Docker image. As you may know, to upgrade Dremio we


## Start dremio in background mode
```
docker-compose up -d
```

## Upgrade dremio to new version:

If you want to upgrade dremio to certain version you have to follow next steps:
```
docker-compose stop
docker-compose -f docker-compose.upgrade.yml build --build-arg UPGRADE_VERSION=4.7.0
docker-compose -f docker-compose.upgrade.yml run dremio "/opt/dremio/bin/dremio-admin upgrade"
```
Right now, you only have to change version in docker-compose.yml to the new version and run
```
docker-compose up -d
```

