with order_details as (
    select * from {{ ref('stg_northwind_order_details') }} 
),

orders as (
    select * from {{ ref('stg_northwind_orders') }}
),



final as (
    select * from order_details

    left join orders on order_details.order_id = orders.order_id
)

select * from final