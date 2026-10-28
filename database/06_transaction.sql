-- Work Requirement 3: Transaction
-- Transfer one owned copy of Pikachu from Binder A to Binder B.

BEGIN;

UPDATE collection_items
SET quantity = quantity - 1
WHERE card_id = 2
  AND storage_location = 'Binder A'
  AND quantity >= 1;

INSERT INTO collection_items
    (card_id, card_condition, quantity, storage_location, notes)
VALUES
    (2, 'Excellent', 1, 'Binder B', 'Transferred from Binder A');

COMMIT;