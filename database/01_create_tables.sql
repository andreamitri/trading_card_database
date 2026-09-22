-- PRO2003 Work Requirement 1
-- Trading Card Collection Database

CREATE TABLE card_sets (
    set_id          integer GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    set_name        varchar(150) NOT NULL,
    franchise       varchar(50) NOT NULL,
    release_date    date,
    description     text,

    UNIQUE (franchise, set_name),
    CHECK (franchise IN ('Pokemon', 'Marvel', 'FIFA'))
);

CREATE TABLE card_types (
    type_id          integer GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    type_name        varchar(80) NOT NULL UNIQUE,
    description      text
);

CREATE TABLE cards (
    card_id          integer GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    set_id           integer NOT NULL REFERENCES card_sets(set_id),
    type_id          integer NOT NULL REFERENCES card_types(type_id),
    card_name        varchar(150) NOT NULL,
    card_number      varchar(30) NOT NULL,
    rarity           varchar(50),
    release_date     date,

    UNIQUE (set_id, card_number)
);

CREATE TABLE collection_items (
    collection_item_id  integer GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    card_id             integer NOT NULL REFERENCES cards(card_id),
    card_condition      varchar(20) NOT NULL,
    quantity            integer NOT NULL DEFAULT 1 CHECK (quantity > 0),
    purchase_price      numeric(12, 2) CHECK (purchase_price >= 0),
    estimated_value     numeric(12, 2) CHECK (estimated_value >= 0),
    storage_location    varchar(120),
    acquired_date       date,
    notes               text,

    CHECK (card_condition IN (
        'Mint',
        'Near Mint',
        'Excellent',
        'Good',
        'Played',
        'Poor',
        'Sealed'
    ))
);

CREATE TABLE decks (
    deck_id          integer GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    deck_name        varchar(120) NOT NULL UNIQUE,
    description      text,
    created_at       timestamptz NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE deck_cards (
    deck_id          integer NOT NULL REFERENCES decks(deck_id),
    card_id          integer NOT NULL REFERENCES cards(card_id),
    quantity         integer NOT NULL DEFAULT 1 CHECK (quantity > 0),
    notes            text,

    PRIMARY KEY (deck_id, card_id)
);