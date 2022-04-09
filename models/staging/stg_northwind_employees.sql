with source as (
    select * from {{ source( 'northwind_bq', 'public_employees') }}
),

employees as (
    select * from source
)

select * from employees