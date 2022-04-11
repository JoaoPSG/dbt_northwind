with source as (
    select * from {{ source( 'northwind_bq', 'public_region') }}
),

region as (
    select
        /* Natural Key */
        region_id
        /* Columns */
        ,region_description
    from source
)

select * from region