
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

