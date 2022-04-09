with source as (
    select * from {{ source( 'northwind_bq', 'public_categories') }}
),

categories as (
    select * from source
)

select * from categories