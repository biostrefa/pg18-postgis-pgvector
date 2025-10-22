# PostgreSQL 18 with pgvector and PostGIS

A PostgreSQL 18 Docker image with pgvector, PostGIS, and additional useful extensions pre-configured.

## Quick Start

```bash
docker build -t pg18-postgis-pgvector .
docker run -d -p 5432:5432 -e POSTGRES_PASSWORD=yourpassword pg18-postgis-pgvector
```

Or build for GitHub Container Registry:

```bash
docker build -t ghcr.io/biostrefa/pg18-postgis-pgvector:latest .
```

## Automatic Initialization

On first startup, the following schemas and extensions are automatically created:

**Schemas:**
- `auth` - For authentication-related tables
- `core` - For core application tables

**Extensions:**
- `vector` - pgvector for vector embeddings
- `postgis` - Spatial and geographic objects
- `pg_cron` - Cron-based job scheduler
- `pg_stat_statements` - SQL execution statistics
- `pg_trgm` - Trigram matching for fuzzy search
- `pgcrypto` - Cryptographic functions
- `citext` - Case-insensitive text type

## Other extensions:

### pg_trgm
This extension provides functions and operators for determining the similarity of text based on trigram matching. It's excellent for implementing fuzzy search, which can help users find events even if they have typos in their search query.

### pg_cron
A simple cron-based job scheduler that runs inside the database. You could use it to schedule tasks like sending event reminders, archiving past events, or updating event statuses.

**Note:** pg_cron is pre-configured with `shared_preload_libraries = 'pg_cron'` and `cron.database_name = 'postgres'`. Jobs must be scheduled from the `postgres` database. To use a different database, override these settings in your `postgresql.conf`.

### pg_stat_statements
This extension tracks execution statistics of all SQL statements executed by a server. It's invaluable for debugging and identifying performance bottlenecks in your queries.

### Full-Text Search
PostgreSQL's built-in FTS is powerful for searching through event descriptions and titles. You can create a tsvector column and a tsquery to perform complex text searches.
