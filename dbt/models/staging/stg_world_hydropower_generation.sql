{{
    config(
        materialized='view'
    )
}}

with world_hydropower_generation as 
(
  select *,
  from {{ source('staging', 'hydropower_generation_data') }}
  where country is not null
)
select
    -- index
    {{ dbt_utils.generate_surrogate_key(['iso_code', 'year']) }} as idx,
    -- identifiers
    cast(country as string) as country,
    cast(year as integer) as year,
    cast(iso_code as string) as iso_code,
    -- data
    cast(hydro_generation as numeric) as hydro_generation
from world_hydropower_generation
order by country, year

-- For test run uncomment this
--{% if var('is_test_run', default=true) %}

--  limit 100

--{% endif %}

-- dbt build --select <model_name> --vars '{'is_test_run': 'false'}'
-- dbt build --select hydropower_generation_data --vars '{'is_test_run': 'false'}'