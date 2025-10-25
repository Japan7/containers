FROM ghcr.io/cloudnative-pg/postgresql:17
USER root
COPY --from=pgvector/pgvector:0.8.1-pg17 /lib/postgresql/17/lib/vector.so /usr/lib/postgresql/17/lib/vector.so
RUN rm /usr/share/postgresql/17/extension/vector*
COPY --from=pgvector/pgvector:0.8.1-pg17 \
  /usr/share/postgresql/17/extension/vector--0.1.0--0.1.1.sql \
  /usr/share/postgresql/17/extension/vector--0.1.1--0.1.3.sql \
  /usr/share/postgresql/17/extension/vector--0.1.3--0.1.4.sql \
  /usr/share/postgresql/17/extension/vector--0.1.4--0.1.5.sql \
  /usr/share/postgresql/17/extension/vector--0.1.5--0.1.6.sql \
  /usr/share/postgresql/17/extension/vector--0.1.6--0.1.7.sql \
  /usr/share/postgresql/17/extension/vector--0.1.7--0.1.8.sql \
  /usr/share/postgresql/17/extension/vector--0.1.8--0.2.0.sql \
  /usr/share/postgresql/17/extension/vector--0.2.0--0.2.1.sql \
  /usr/share/postgresql/17/extension/vector--0.2.1--0.2.2.sql \
  /usr/share/postgresql/17/extension/vector--0.2.2--0.2.3.sql \
  /usr/share/postgresql/17/extension/vector--0.2.3--0.2.4.sql \
  /usr/share/postgresql/17/extension/vector--0.2.4--0.2.5.sql \
  /usr/share/postgresql/17/extension/vector--0.2.5--0.2.6.sql \
  /usr/share/postgresql/17/extension/vector--0.2.6--0.2.7.sql \
  /usr/share/postgresql/17/extension/vector--0.2.7--0.3.0.sql \
  /usr/share/postgresql/17/extension/vector--0.3.0--0.3.1.sql \
  /usr/share/postgresql/17/extension/vector--0.3.1--0.3.2.sql \
  /usr/share/postgresql/17/extension/vector--0.3.2--0.4.0.sql \
  /usr/share/postgresql/17/extension/vector--0.4.0--0.4.1.sql \
  /usr/share/postgresql/17/extension/vector--0.4.1--0.4.2.sql \
  /usr/share/postgresql/17/extension/vector--0.4.2--0.4.3.sql \
  /usr/share/postgresql/17/extension/vector--0.4.3--0.4.4.sql \
  /usr/share/postgresql/17/extension/vector--0.4.4--0.5.0.sql \
  /usr/share/postgresql/17/extension/vector--0.5.0--0.5.1.sql \
  /usr/share/postgresql/17/extension/vector--0.5.1--0.6.0.sql \
  /usr/share/postgresql/17/extension/vector--0.6.0--0.6.1.sql \
  /usr/share/postgresql/17/extension/vector--0.6.1--0.6.2.sql \
  /usr/share/postgresql/17/extension/vector--0.6.2--0.7.0.sql \
  /usr/share/postgresql/17/extension/vector--0.7.0--0.7.1.sql \
  /usr/share/postgresql/17/extension/vector--0.7.1--0.7.2.sql \
  /usr/share/postgresql/17/extension/vector--0.7.2--0.7.3.sql \
  /usr/share/postgresql/17/extension/vector--0.7.3--0.7.4.sql \
  /usr/share/postgresql/17/extension/vector--0.7.4.sql \
  /usr/share/postgresql/17/extension/vector.control \
  /usr/share/postgresql/17/extension/
USER 26
