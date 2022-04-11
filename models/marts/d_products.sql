with
    products as (
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
            /* Surrogate Key */
            row_number() over (order by product_id) as product_sk --auto incremental sk
            /* Natural Key */
            ,products.product_id
            ,products.supplier_id
            /* Columms */
            ,products.product_name
            ,products.quantity_per_unit
            ,products.unit_price
            ,products.units_in_stock
            ,products.units_on_order
            ,products.reorder_level
            ,products.discontinued
            ,categories.category_name
            ,categories.catetgory_description
            ,suppliers.company_name as supplier_name
            ,suppliers.contact_name as supplier_contact
            ,suppliers.contact_title as supplier_contact_title
            ,suppliers.supplier_address
            ,suppliers.city as supplier_city
            ,suppliers.region as supplier_region
            ,suppliers.postal_code as supplier_postal_code
            ,suppliers.country as supplier_country
            ,suppliers.phone as supplier_phone
            ,suppliers.fax as supplier_fax
            ,suppliers.homepage as supplier_homepage
        from products

        left join categories on products.category_id = categories.category_id
        left join suppliers on products.supplier_id = suppliers.supplier_id
    )

select * from final