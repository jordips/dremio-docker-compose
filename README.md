# Dremio docker-compose

This is a docker-compose for Dremio software using oficial Docker image. As you may know, to upgrade Dremio we

## How to

Start dremio in background mode:
```
docker-compose up -d
```

Upgrade dremio to new version:
```
docker-compose down
docker-compose -f docker-compose.upgrade.yml build --build-arg UPGRADE_VERSION=4.7.0
docker-compose -f docker-compose.upgrade.yml run dremio "ls -lh"
```
