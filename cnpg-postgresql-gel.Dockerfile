FROM ghcr.io/cloudnative-pg/postgresql:17
USER root
COPY --from=pgvector/pgvector:0.7.4-pg17 /lib/postgresql/17/lib/vector.so /usr/lib/postgresql/17/lib/vector.so
USER 26
