{{ config(materialized='source') }}

CREATE SOURCE {{ this }}
FROM LOAD GENERATOR AUCTION
(TICK INTERVAL '50ms')
FOR ALL TABLES
WITH (SIZE = '3xsmall')
