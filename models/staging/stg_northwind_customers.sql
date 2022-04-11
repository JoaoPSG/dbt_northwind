with
    source as (
        select * from {{ source( 'northwind_bq', 'public_customers') }}
    ),

    customers as (
        select
            /* Natural Key */
            customer_id
            /* Columms */
            ,company_name 
            ,contact_name
            ,contact_title
            ,"address" as customer_address --renaming to avoid errors downstream
            ,city
            ,region
            ,postal_code
            ,country
            ,phone
            ,fax
        from source
    )

select * from customers