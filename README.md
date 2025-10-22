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
- `vector` - pgvector for vector embeddings and similarity search
- `postgis` - Spatial and geographic objects for location-based queries
- `pg_cron` - Cron-based job scheduler for automated database tasks
- `pg_stat_statements` - SQL execution statistics and performance monitoring
- `pg_trgm` - Trigram matching for fuzzy text search
- `pgcrypto` - Cryptographic functions for hashing and encryption
- `citext` - Case-insensitive text type for emails and usernames
- `unaccent` - Text search dictionary for removing accents from characters
- `fuzzystrmatch` - Fuzzy string matching functions (soundex, levenshtein, metaphone)

## Extension Details

### vector (pgvector)
Enables vector similarity search for AI/ML applications. Store and query embeddings from models like OpenAI, Cohere, or local models. Supports multiple distance metrics (L2, inner product, cosine).

**Use cases:** Semantic search, recommendation systems, RAG applications, image similarity.

### postgis
Comprehensive spatial database capabilities for geographic objects. Supports geometry and geography types, spatial indexing, and complex GIS operations.

**Use cases:** Location-based services, mapping applications, geofencing, spatial analysis.

### pg_trgm
Trigram-based text similarity matching for fuzzy search. Provides operators for similarity scoring and GIN/GiST index support for fast searches.

**Use cases:** Autocomplete, typo-tolerant search, duplicate detection, fuzzy matching.

### pg_cron
Cron-based job scheduler running inside PostgreSQL. Schedule recurring tasks using standard cron syntax.

**Use cases:** Automated maintenance, scheduled reports, data archiving, periodic cleanup.

**Note:** Pre-configured with `shared_preload_libraries = 'pg_cron'` and `cron.database_name = 'postgres'`. Jobs must be scheduled from the `postgres` database.

### pg_stat_statements
Tracks execution statistics for all SQL statements. Essential for performance monitoring and query optimization.

**Use cases:** Query performance analysis, identifying slow queries, resource usage monitoring.

### pgcrypto
Cryptographic functions for secure data handling. Includes hashing (MD5, SHA), encryption (AES, Blowfish), and random data generation.

**Use cases:** Password hashing, data encryption, secure token generation, PGP encryption.

### citext
Case-insensitive text type that preserves original case but compares case-insensitively.

**Use cases:** Email addresses, usernames, case-insensitive unique constraints.

### unaccent
Text search dictionary that removes accents and diacritical marks from characters. Improves search across different language inputs.

**Use cases:** International text search, accent-insensitive matching, multilingual applications.

**Example:**
```sql
SELECT unaccent('Hôtel Café'); -- Returns: Hotel Cafe
```

### fuzzystrmatch
Fuzzy string matching algorithms for approximate string comparison. Includes soundex, metaphone, levenshtein distance, and more.

**Use cases:** Name matching, spell checking, duplicate detection, phonetic search.

**Functions:**
- `soundex()` - Phonetic algorithm for English names
- `metaphone()` - Improved phonetic algorithm
- `levenshtein()` - Edit distance between strings
- `dmetaphone()` - Double metaphone algorithm

**Example:**
```sql
SELECT levenshtein('kitten', 'sitting'); -- Returns: 3
SELECT soundex('Smith'), soundex('Smythe'); -- Both return: S530
```
