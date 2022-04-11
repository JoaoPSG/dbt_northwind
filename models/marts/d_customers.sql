with
    customers as (
        select * from {{ ref('stg_northwind_customers') }} 
    ),

    final as (
        select
            /* Surrogate Key */
            row_number() over (order by customer_id) as customer_sk --auto incremental surrogate key
            /* Natural Key */
            ,customer_id
            /* Columms */
            ,company_name
            ,contact_name
            ,contact_title
            ,customer_address
            ,city
            ,region
            ,postal_code
            ,country
            ,phone
            ,fax
        from customers
    )

select * from final