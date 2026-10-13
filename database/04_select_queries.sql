SELECT
    c.card_id,
    c.card_name,
    s.set_name,
    s.franchise
FROM cards AS c
INNER JOIN card_sets AS s
    ON c.set_id = s.set_id
ORDER BY c.card_id;