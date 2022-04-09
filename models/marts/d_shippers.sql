with shippers as (
    select * from {{ ref('stg_northwind_shippers') }} 
),


final as (
    select * from shippers
)

select * from final