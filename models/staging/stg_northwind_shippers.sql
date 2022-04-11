with source as (
    select * from {{ source( 'northwind_bq', 'public_shippers') }}
),

shippers as (
    select
        /* Natural Key */
        shipper_id
        /* Columns */
        ,company_name
        ,phone
    from source
)

select * from shippers