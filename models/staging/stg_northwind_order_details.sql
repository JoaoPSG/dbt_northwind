with source as (
    select * from {{ source( 'northwind_bq', 'public_order_details') }}
),

order_details as (
    select * from source
)

select * from order_details