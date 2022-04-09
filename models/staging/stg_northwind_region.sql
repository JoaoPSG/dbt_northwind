with source as (
    select * from {{ source( 'northwind_bq', 'public_region') }}
),

region as (
    select * from source
)

select * from region