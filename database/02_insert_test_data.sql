
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
     'Football trading cards from the 2022 World Cup.')
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
    (5, 5, 'Kylian Mbappe', '7', 'Rare', '2022-01-01')
RETURNING card_id, card_name, set_id, type_id;