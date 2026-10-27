-- Work Requirement 2: UPDATE operation
-- Update Charizard's estimated value from 250.00 to 275.00.

UPDATE collection_items
SET estimated_value = 275.00
WHERE card_id = 1
RETURNING collection_item_id, card_id, estimated_value;


-- DELETE operation: Insert a temporary test record and delete it.
-- The transaction makes both operations run together.

BEGIN;

INSERT INTO collection_items
    (card_id, quantity, notes)
VALUES
    (1, 1, 'Temporary DELETE test');

DELETE FROM collection_items
WHERE notes = 'Temporary DELETE test'
RETURNING collection_item_id, card_id, quantity, notes;

COMMIT;
