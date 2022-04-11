with source as (
    select * from {{ source( 'northwind_bq', 'public_suppliers') }}
),

suppliers as (
    select
        /* Natural Key */
        supplier_id
        /* Columns */
        ,company_name
        ,contact_name
        ,contact_title
        ,"address" as supplier_address --changing here because of name error afterwards
        ,city
        ,region
        ,postal_code
        ,country
        ,phone
        ,fax
        ,homepage
    from source
)

select * from suppliers