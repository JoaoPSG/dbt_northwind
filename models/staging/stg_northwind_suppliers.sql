with source as (
    select * from {{ source( 'northwind_bq', 'public_suppliers') }}
),

suppliers as (
    select * from source
)

select * from suppliers