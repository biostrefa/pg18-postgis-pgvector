# PostgreSQL 18 with pgvector and PostGIS

docker build -t pg18-postgis-pgvector .

docker build -t ghcr.io/biostrefa/pg18-postgis-pgvector:latest .

## Other extensions:

### pg_trgm
This extension provides functions and operators for determining the similarity of text based on trigram matching. It's excellent for implementing fuzzy search, which can help users find events even if they have typos in their search query.

### pg_cron
A simple cron-based job scheduler that runs inside the database. You could use it to schedule tasks like sending event reminders, archiving past events, or updating event statuses.

### pg_stat_statements
This extension tracks execution statistics of all SQL statements executed by a server. It's invaluable for debugging and identifying performance bottlenecks in your queries.

### Full-Text Search
PostgreSQL's built-in FTS is powerful for searching through event descriptions and titles. You can create a tsvector column and a tsquery to perform complex text searches.
