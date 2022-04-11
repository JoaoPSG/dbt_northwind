with source as (
    select * from {{ source( 'northwind_bq', 'public_categories') }}
),

categories as (
    select
        category_id
        ,category_name
        ,"description" as catetgory_description

    from source
)

select * from categories