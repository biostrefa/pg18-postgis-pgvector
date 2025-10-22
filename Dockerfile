# Extend your current image
FROM pgvector/pgvector:pg18

# Install PostGIS for Postgres 18
RUN set -eux; \
    apt-get update; \
    apt-get install -y --no-install-recommends \
      postgresql-18-postgis-3 \
      postgresql-18-postgis-3-scripts \
      gdal-bin \
      proj-bin \
      postgresql-18-cron \
      postgresql-18; \
    rm -rf /var/lib/apt/lists/*

# Configure pg_cron
RUN echo "shared_preload_libraries = 'pg_cron'" >> /usr/share/postgresql/postgresql.conf.sample && \
    echo "cron.database_name = 'postgres'" >> /usr/share/postgresql/postgresql.conf.sample

# Auto-enable schemas and extensions on first init (new clusters only)
# COPY init-db.sql /docker-entrypoint-initdb.d/01-init-db.sql
