with order_details as (
    select * from {{ ref('stg_northwind_order_details') }} 
),

orders as (
    select * from {{ ref('stg_northwind_orders') }}
),



final as (
    select
        orders.*
        ,order_details.unit_price
        ,order_details.quantity
        ,order_details.discount
    
    from order_details

    left join orders on order_details.order_id = orders.order_id
)

select * from final