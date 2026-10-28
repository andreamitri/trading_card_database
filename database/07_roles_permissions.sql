-- Work Requirement 3: Read-only database role

CREATE ROLE card_viewer LOGIN PASSWORD 'replace_with_secure_password';

GRANT CONNECT ON DATABASE trading_card_collection TO card_viewer;

GRANT USAGE ON SCHEMA public TO card_viewer;

GRANT SELECT ON ALL TABLES IN SCHEMA public TO card_viewer;