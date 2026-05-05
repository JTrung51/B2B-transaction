CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

CREATE TABLE users (
    id         UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    email      TEXT UNIQUE NOT NULL,
    password   TEXT NOT NULL,
    created_at TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE TABLE jobs (
    id          UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    user_id     UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    type        TEXT NOT NULL,
    payload     JSONB NOT NULL,
    status      TEXT NOT NULL DEFAULT 'pending',
    result      JSONB,
    error       TEXT,
    created_at  TIMESTAMPTZ NOT NULL DEFAULT now(),
    updated_at  TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE INDEX idx_jobs_user_status ON jobs(user_id, status);