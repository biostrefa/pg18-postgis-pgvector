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

# Optional: auto-enable on first init (new clusters only)
# COPY init-extensions.sql /docker-entrypoint-initdb.d/10-extensions.sql
