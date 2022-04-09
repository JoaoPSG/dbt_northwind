with source as (
    select * from {{ source( 'northwind_bq', 'public_products') }}
),

products as (
    select * from source
)

select * from products