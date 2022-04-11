with source as (
    select * from {{ source( 'northwind_bq', 'public_employees') }}
),

employees as (
    select
        /* Natural Key */
        employee_id
        /* Columms */
        ,last_name
        ,first_name
        ,title
        ,title_of_courtesy
        ,birth_date
        ,hire_date
        ,"address" as employee_address --changing to avoid "address not found" error afterwards
        ,city
        ,region
        ,postal_code
        ,country
        ,home_phone
        ,extension
        ,photo
        ,notes
        ,reports_to
        ,photo_path
    from source
)

select * from employees