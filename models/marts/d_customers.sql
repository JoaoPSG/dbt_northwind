with
    customers as (
        select * from {{ ref('stg_northwind_customers') }} 
    ),


    final as (
        select * from customers
    )

select * from final