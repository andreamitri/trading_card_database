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
