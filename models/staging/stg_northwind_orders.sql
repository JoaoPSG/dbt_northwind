with source as (
    select * from {{ source( 'northwind_bq', 'public_orders') }}
),

orders as (
    select
        /* Natural Key */
        order_id
        /* Foreing Key */    
        ,customer_id
        ,employee_id
        /* Columns */
        ,order_date
        ,required_date
        ,shipped_date
        ,ship_via as shipper_id
        ,freight
        ,ship_name
        ,ship_address
        ,ship_city
        ,ship_region
        ,ship_postal_code
        ,ship_country
    from source
)

select * from orders