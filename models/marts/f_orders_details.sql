with
    /* from Stage */
    order_details as (
        select * from {{ ref('stg_northwind_order_details') }} 
    ),

    orders as (
        select * from {{ ref('stg_northwind_orders') }}
    ),

    shippers as (
        select * from {{ ref('stg_northwind_shippers') }}
    ),

    /* from Dimensions */
    d_customers as (
        select
            customer_sk
            ,customer_id
        from {{ ref('d_customers') }}
    ),

    d_employees as (
        select
            employee_sk
            ,employee_id        
        from {{ ref('d_employees') }}
    ),

    d_products as (
        select
            product_sk
            ,product_id
        from {{ ref('d_products') }}
    ),


    final as (
        select
            /* Surrogate Key */
            row_number() over (order by order_details.order_id, order_details.product_id) as orders_details_sk --auto incremental surrogate key
            /* Natural Key */
            ,orders.order_id
            ,order_details.product_id
            /* Foreing Key */
            ,customer_sk
            ,employee_sk
            ,product_sk
            /* Columns */
            ,order_details.unit_price
            ,order_details.quantity
            ,order_details.discount

            ,cast(orders.order_date as datetime) as order_date 
            ,cast(orders.required_date as datetime) as required_date 
            ,cast(orders.shipped_date as datetime) as shipped_date 

            ,orders.freight
            ,orders.ship_name
            ,orders.ship_address
            ,orders.ship_city
            ,orders.ship_region
            ,orders.ship_postal_code
            ,orders.ship_country

            ,shippers.company_name as shipper_name
            ,shippers.phone as shipper_phone
        
        from order_details

        left join orders on order_details.order_id = orders.order_id
        left join d_products on order_details.product_id = d_products.product_id

        left join d_customers on orders.customer_id = d_customers.customer_id
        left join d_employees on orders.employee_id = d_employees.employee_id
        left join shippers on orders.shipper_id = shippers.shipper_id
        
    )

select * from final