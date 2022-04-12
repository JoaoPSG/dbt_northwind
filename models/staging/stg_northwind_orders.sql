with source as (
    select * from {{ source( 'northwind_bq', 'public_orders') }}
),

orders as (
    select
        /* Natural Key */
        cast(order_id as int) as order_id 
        /* Foreing Key */    
        ,customer_id
        ,employee_id
        /* Columns */
        ,cast(order_date as date) as order_date 
        ,cast(required_date as date) as required_date 
        ,cast(shipped_date as date) as shipped_date 
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