with products as (
    select * from {{ ref('stg_northwind_products') }} 
),

categories as (
    select * from {{ ref('stg_northwind_categories') }}
),

suppliers as (
    select * from {{ ref('stg_northwind_suppliers') }}
),



final as (
    select * from products

    left join categories on products.category_id = categories.category_id
    left join suppliers on products.supplier_id = suppliers.supplier_id
)

select * from final