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

    region as (
        select * from {{ ref('stg_northwind_region') }}
    ),


    final as (
        select
            /* Surrogate Key */
            row_number() over (order by employees.employee_id) as employee_sk --auto incremental surrogate key
            /* Natural Key */
            ,employees.employee_id
            /* Columns */
            ,employees.last_name
            ,employees.first_name
            ,employees.title
            ,employees.title_of_courtesy
            ,employees.birth_date
            ,employees.hire_date
            ,employees.employee_address
            ,employees.city
            ,employees.region
            ,employees.postal_code
            ,employees.country
            ,employees.home_phone
            ,employees.extension
            ,employees.photo
            ,employees.notes
            ,employees.reports_to
            ,employees.photo_path

            ,territories.territory_description

            ,region.region_description
        from employees

        left join employee_territories on employees.employee_id = employee_territories.employee_id
        left join territories on employee_territories.territory_id = territories.territory_id
        left join region on territories.region_id = region.region_id
    )

select * from final