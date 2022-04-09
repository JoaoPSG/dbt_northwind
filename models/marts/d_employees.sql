with
    employees as (
        select * from {{ ref('stg_northwind_employees') }} 
    ),

    territories as (
        select * from {{ ref('stg_northwind_territories') }} 
    ),

    employee_territories as (
        select * from {{ ref('stg_northwind_employee_territories') }} 
    ),


    final as (
        select
            employees.*
            ,territories.territory_description
            ,territories.region_id
        from employees

        left join employee_territories on employees.employee_id = employee_territories.employee_id
        left join territories on employee_territories.territory_id = territories.territory_id
    )

select * from final