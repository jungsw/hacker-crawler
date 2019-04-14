CREATE SCHEMA news_articles;

GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA news_articles TO developer;
GRANT ALL PRIVILEGES ON ALL SEQUENCES IN SCHEMA news_articles TO developer;
GRANT ALL PRIVILEGES ON SCHEMA news_articles TO developer;

ALTER DEFAULT PRIVILEGES IN SCHEMA news_articles GRANT ALL ON TABLES TO developer;
ALTER DEFAULT PRIVILEGES FOR ROLE developer IN SCHEMA news_articles GRANT ALL ON TABLES TO developer;
ALGER DEFAULT PRIVILEGES FOR ROLE developer IN SCHEMA news_articles GRANT ALL ON SEQUENCES TO developer;

CREATE TABLE IF NOT EXISTS news_articles.s3_docs (
  id SERIAL NOT NULL PRIMARY KEY,
  source VARCHAR(64) NOT NULL,
  match_id VARCHAR(64) NOT NULL,
  source_document_id INTEGER,
  s3_key VARCHAR(255) NOT NULL,
  scraped_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);
CREATE INDEX s3_docs_date ON news_articles.s3_docs (
  source, scraped_at, checksum
);
CREATE INDEX s3_docs_match_id ON news_articles.s3_docs (
  source, checksum, scraped_at
);

/*
CREATE TABLE IF NOT EXISTS news_articles.{tablename} (
  id SERIAL NOT NULL PRIMARY KEY,
  s3_doc_id SERIAL NOT NULL,
  match_id VARCHAR(64) NOT NULL UNIQUE,
  checksum VARCHAR(255),
  document jsonb,
  scraped_at TIMESTAMP NOT NULL,
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);
CREATE UNIQUE INDEX match_id_created_at_idx ON news_articles.{tablename} (
  match_id, created_at
);
CREATE INDEX {tablename}_created_at_idx on news_articles.{tablename} (created_at);
*/

