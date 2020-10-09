ARG  UPGRADE_VERSION=latest
FROM dremio/dremio-oss:${UPGRADE_VERSION}

ENTRYPOINT ["/bin/sh"]
