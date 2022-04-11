with source as (
    select * from {{ source( 'northwind_bq', 'public_employee_territories') }}
),

employee_territories as (
    select
        employee_id 
        ,territory_id
    from source
)

select * from employee_territories