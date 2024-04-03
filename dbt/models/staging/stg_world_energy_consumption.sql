{{
    config(
        materialized='view'
    )
}}

with world_energy_consumption as 
(
  select *,
  from {{ source('staging', 'energy_consumption_data') }}
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
    cast(population as integer) as population,
    cast(electricity_demand as numeric) as electricity_demand,
    cast(electricity_generation as numeric) as electricity_generation,
    cast(electricity_share_energy as numeric) as electricity_share_energy,
    cast(energy_per_capita as numeric) as energy_per_capita,
    cast(hydro_consumption as numeric) as hydro_consumption,
    cast(hydro_elec_per_capita as numeric) as hydro_elec_per_capita,
    cast(hydro_share_elec as numeric) as hydro_share_elec,
    cast(hydro_share_energy as numeric) as hydro_share_energy,
    cast(per_capita_electricity as numeric) as per_capita_electricity,
    cast(primary_energy_consumption as numeric) as primary_energy_consumption
from world_energy_consumption

-- For test run uncomment this
--{% if var('is_test_run', default=true) %}

--  limit 100

--{% endif %}

-- dbt build --select <model_name> --vars '{'is_test_run': 'false'}'
-- dbt build --select energy_consumption_data --vars '{'is_test_run': 'false'}'