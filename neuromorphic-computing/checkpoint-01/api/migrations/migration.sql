use 'checkpoint';

create table temperature (
    id uuid primary key,
    'value' int,
    create_at timestamptz,
);
