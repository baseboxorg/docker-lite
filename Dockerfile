#
# Lightweight Docker in Docker image
#
########################################################

FROM baseboxorg/docker-resin:18.03 as builder

#FROM alpine:3.7
FROM resin/armhf-alpine

RUN [ "cross-build-start" ]

COPY --from=builder /usr/local/bin/docker /usr/local/bin/
COPY --from=builder /usr/local/bin/docker-entrypoint.sh /usr/local/bin/

RUN [ "cross-build-end" ]

ENTRYPOINT ["docker-entrypoint.sh"]
