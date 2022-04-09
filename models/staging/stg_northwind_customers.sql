with source as (
    select * from {{ source( 'northwind_bq', 'public_customers') }}
),

customers as (
    select * from source
)

select * from customers