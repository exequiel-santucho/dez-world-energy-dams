{{
    config(
        materialized='view'
    )
}}

with world_dams as 
(
  select *,
  from {{ source('staging', 'dams_data') }}
  where country is not null
)
select
    -- identifiers
    cast(country as string) as country,
    cast(iso_code as string) as iso_code,
    -- data
    cast(purpose as string) as purpose,
    cast(total_hydropowers_dams as integer) as total_hydropowers_dams
from world_dams
order by country

-- For test run uncomment this
--{% if var('is_test_run', default=true) %}

--  limit 100

--{% endif %}

-- dbt build --select <model_name> --vars '{'is_test_run': 'false'}'
-- dbt build --select dams_data --vars '{'is_test_run': 'false'}'