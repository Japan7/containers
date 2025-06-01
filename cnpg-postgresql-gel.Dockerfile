ARG PG_VERSION=17
ARG VECTOR_VERSION=0.7.4
FROM ghcr.io/cloudnative-pg/postgresql:${PG_VERSION}
USER root
COPY --from=pgvector/pgvector:${VECTOR_VERSION}-pg${PG_VERSION} /lib/postgresql/${PG_VERSION}/lib/vector.so /usr/lib/postgresql/${PG_VERSION}/lib/vector.so
USER 26
