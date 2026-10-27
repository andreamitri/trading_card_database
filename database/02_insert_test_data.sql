
-- Work Requirement 2: Populate the trading card database
-- Database: trading_card_collection


INSERT INTO card_sets
    (set_name, franchise, release_date, description)
VALUES
    ('Base Set', 'Pokemon', '1999-01-09',
     'The original Pokemon trading card set.'),
    ('Scarlet and Violet', 'Pokemon', '2023-03-31',
     'Pokemon cards from the Scarlet and Violet era.'),
    ('Marvel Beginnings', 'Marvel', '2011-01-01',
     'Trading cards featuring Marvel characters.'),
    ('Marvel Masterpieces', 'Marvel', '2022-01-01',
     'Collectible Marvel character artwork cards.'),
    ('World Cup Qatar 2022', 'FIFA', '2022-01-01',
     'Football trading cards from the 2022 World Cup.'),
    ('Pokemon Promo Cards', 'Pokemon', '2024-01-01',
     'A small promotional set containing one card.')
RETURNING set_id, set_name;



INSERT INTO card_types (type_name, description)
VALUES
    ('Pokemon', 'Pokemon character cards'),
    ('Trainer', 'Pokemon trainer and support cards'),
    ('Marvel Hero', 'Marvel superhero cards'),
    ('Marvel Villain', 'Marvel villain cards'),
    ('Football Player', 'Professional football player cards')
RETURNING type_id, type_name;

INSERT INTO cards
    (set_id, type_id, card_name, card_number, rarity, release_date)
VALUES
    (1, 1, 'Charizard', '4/102', 'Rare Holo', '1999-01-09'),
    (1, 1, 'Pikachu', '58/102', 'Common', '1999-01-09'),
    (1, 1, 'Blastoise', '2/102', 'Rare Holo', '1999-01-09'),
    (1, 1, 'Venusaur', '15/102', 'Rare Holo', '1999-01-09'),
    (2, 1, 'Miraidon ex', '81/198', 'Double Rare', '2023-03-31'),
    (2, 2, 'Professor Research', '189/198', 'Uncommon', '2023-03-31'),
    (3, 3, 'Spider-Man', '1', 'Rare', '2011-01-01'),
    (3, 3, 'Iron Man', '2', 'Rare', '2011-01-01'),
    (4, 4, 'Thanos', '10', 'Ultra Rare', '2022-01-01'),
    (4, 3, 'Captain America', '11', 'Rare', '2022-01-01'),
    (5, 5, 'Lionel Messi', '10', 'Rare', '2022-01-01'),
    (5, 5, 'Kylian Mbappe', '7', 'Rare', '2022-01-01'),
((SELECT set_id FROM card_sets
  WHERE set_name = 'Pokemon Promo Cards'
    AND franchise = 'Pokemon'),
 1, 'Pikachu Promo', 'PROMO-001', 'Promo', '2024-01-01')
RETURNING card_id, card_name, set_id, type_id;



INSERT INTO collection_items
    (card_id, card_condition, quantity,
     purchase_price, estimated_value,
     storage_location, acquired_date, notes)
VALUES
    (1, 'Near Mint', 1, 150.00, 250.00,
     'Binder A', '2025-01-15', 'Charizard'),

    (2, 'Excellent', 3, 5.00, 8.00,
     'Binder A', '2025-02-10', 'Pikachu'),

    (3, 'Near Mint', 1, 80.00, 120.00,
     'Binder A', '2025-03-05', 'Blastoise'),

    (4, 'Good', 2, 40.00, 65.00,
     'Binder B', '2025-03-20', 'Venusaur'),

    (5, 'Near Mint', 2, 15.00, 25.00,
     'Binder B', '2025-04-01', 'Miraidon ex'),

    (6, 'Mint', 4, 2.00, 3.50,
     'Deck Box A', '2025-04-15', 'Trainer cards'),

    (7, 'Near Mint', 1, 30.00, 45.00,
     'Binder C', '2025-05-01', 'Spider-Man'),

    (8, 'Excellent', 2, 20.00, 35.00,
     'Binder C', '2025-05-12', 'Iron Man'),

    (9, 'Mint', 1, 100.00, 160.00,
     'Display Case', '2025-06-01', 'Thanos'),

    (10, 'Near Mint', 1, 25.00, 40.00,
     'Binder C', '2025-06-15', 'Captain America'),

    (11, 'Near Mint', 2, 50.00, 75.00,
     'Binder D', '2025-07-01', 'Lionel Messi'),

    (12, 'Excellent', 3, 30.00, 55.00,
     'Binder D', '2025-07-20', 'Kylian Mbappe')
RETURNING collection_item_id, card_id, quantity;



INSERT INTO decks (deck_name, description)
VALUES
    ('Classic Pokemon Deck',
     'A collection of classic Pokemon cards.'),

    ('Scarlet and Violet Deck',
     'A deck featuring Pokemon and Trainer cards.'),

    ('Marvel Heroes Deck',
     'A collection of Marvel superhero cards.')
RETURNING deck_id, deck_name;


INSERT INTO deck_cards (deck_id, card_id, quantity, notes)
VALUES
    (1, 1, 1, 'Charizard'),
    (1, 2, 3, 'Pikachu'),
    (1, 3, 1, 'Blastoise'),
    (1, 4, 2, 'Venusaur'),
    (2, 5, 2, 'Miraidon ex'),
    (2, 6, 4, 'Professor Research'),
    (3, 7, 1, 'Spider-Man'),
    (3, 8, 2, 'Iron Man'),
    (3, 10, 1, 'Captain America')
RETURNING deck_id, card_id, quantity;