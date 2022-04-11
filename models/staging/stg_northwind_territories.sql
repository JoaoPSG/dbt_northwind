with source as (
    select * from {{ source( 'northwind_bq', 'public_territories') }}
),

territories as (
    select
        /* Natural Key */
        territory_id
        /* Columns */
        ,territory_description
        ,region_id
    from source
)

select * from territories