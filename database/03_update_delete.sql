-- Work Requirement 2: UPDATE operation
-- Update Charizard's estimated value from 250.00 to 275.00.

UPDATE collection_items
SET estimated_value = 275.00
WHERE card_id = 1
RETURNING collection_item_id, card_id, estimated_value;