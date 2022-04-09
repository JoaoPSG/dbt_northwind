with source as (
    select * from {{ source( 'northwind_bq', 'public_orders') }}
),

orders as (
    select * from source
)

select * from orders