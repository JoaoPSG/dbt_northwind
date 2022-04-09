with source as (
    select * from {{ source( 'northwind_bq', 'public_employee_territories') }}
),

employee_territories as (
    select * from source
)

select * from employee_territories