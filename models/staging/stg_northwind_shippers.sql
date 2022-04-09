with source as (
    select * from {{ source( 'northwind_bq', 'public_shippers') }}
),

shippers as (
    select * from source
)

select * from shippers