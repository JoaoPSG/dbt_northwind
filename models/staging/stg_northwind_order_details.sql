with source as (
    select * from {{ source( 'northwind_bq', 'public_order_details') }}
),

order_details as (
    select
        /* Natural Key */
        order_id
        ,product_id
         /* Columms */
        ,unit_price
        ,quantity
        ,discount
    from source
)

select * from order_details