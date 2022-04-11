with source as (
    select * from {{ source( 'northwind_bq', 'public_products') }}
),

products as (
    select
        /* Natural Key */
        product_id
        /* Foreing Key */
        ,supplier_id
        ,category_id
        /* Columns */
        ,product_name
        ,quantity_per_unit
        ,unit_price
        ,units_in_stock
        ,units_on_order
        ,reorder_level
        ,discontinued
    from source
)

select * from products