-- Query 1: Display cards with their sets using INNER JOIN.
SELECT
    c.card_id,
    c.card_name,
    s.set_name,
    s.franchise
FROM cards AS c
INNER JOIN card_sets AS s
    ON c.set_id = s.set_id
ORDER BY c.card_id;

-- Query 2: Count cards by franchise using COUNT, JOIN and GROUP BY.

SELECT
    s.franchise,
    COUNT(c.card_id) AS total_cards
FROM cards AS c
INNER JOIN card_sets AS s
    ON c.set_id = s.set_id
GROUP BY s.franchise
ORDER BY total_cards DESC;

-- Query 3: Calculate total cards owned using SUM.

SELECT
    SUM(quantity) AS total_cards_owned
FROM collection_items;

-- Query 4: Calculate average estimated value using AVG.

SELECT
    ROUND(AVG(estimated_value), 2) AS average_estimated_value
FROM collection_items;

-- Query 5: Find card sets containing more than one card.

SELECT
    s.set_name,
    COUNT(c.card_id) AS total_cards
FROM card_sets AS s
INNER JOIN cards AS c
    ON s.set_id = c.set_id
GROUP BY s.set_id, s.set_name
HAVING COUNT(c.card_id) > 1
ORDER BY total_cards DESC, s.set_name;

-- Query 6: Find cards with an estimated value above the average.

SELECT
    c.card_name,
    ci.card_condition,
    ci.estimated_value
FROM collection_items AS ci
INNER JOIN cards AS c
    ON ci.card_id = c.card_id
WHERE ci.estimated_value > (
    SELECT AVG(estimated_value)
    FROM collection_items
)
ORDER BY ci.estimated_value DESC;

-- Query 7: Calculate total collection value by franchise.

SELECT
    s.franchise,
    ROUND(SUM(ci.quantity * ci.estimated_value), 2)
        AS total_collection_value
FROM collection_items AS ci
INNER JOIN cards AS c
    ON ci.card_id = c.card_id
INNER JOIN card_sets AS s
    ON c.set_id = s.set_id
GROUP BY s.franchise
ORDER BY total_collection_value DESC;

-- Query 8: Count the different cards in each deck.

SELECT
    d.deck_name,
    COUNT(dc.card_id) AS different_cards,
    SUM(dc.quantity) AS total_card_copies
FROM decks AS d
INNER JOIN deck_cards AS dc
    ON d.deck_id = dc.deck_id
GROUP BY d.deck_id, d.deck_name
ORDER BY total_card_copies DESC;