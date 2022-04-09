with source as (
    select * from {{ source( 'northwind_bq', 'public_territories') }}
),

territories as (
    select * from source
)

select * from territories