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
    select
        products.*
        ,categories.category_name
        ,categories.description
        ,suppliers.company_name
        ,suppliers.contact_name
        ,suppliers.contact_title
        ,suppliers.address
        ,suppliers.city
        ,suppliers.region
        ,suppliers.postal_code
        ,suppliers.country
        ,suppliers.phone
        ,suppliers.fax
        ,suppliers.homepage
    
    from products

    left join categories on products.category_id = categories.category_id
    left join suppliers on products.supplier_id = suppliers.supplier_id
)

select * from final