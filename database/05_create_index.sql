-- Work Requirement 3: Index on card names

CREATE INDEX IF NOT EXISTS idx_cards_card_name
ON cards(card_name);