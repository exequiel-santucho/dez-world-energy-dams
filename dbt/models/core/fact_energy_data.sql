{{
    config(
        materialized='table'
    )
}}

-- wec: world_energy_consumption
-- whg: world_hydropower_generation
-- wd: world_dams

with wec as (
    select *,
    from {{ ref('stg_world_energy_consumption') }}
),
whg as (
    select *,
    from {{ ref('stg_world_hydropower_generation') }}
),
wd as (
    select *,
    from {{ ref('stg_world_dams') }}
)
select
    wec.country,
    wec.year,
    wec.iso_code,
    wec.population,
    wec.electricity_demand,
    wec.electricity_generation,
    wec.hydro_consumption,
    whg.hydro_generation,
    wd.total_hydropowers_dams
from wec
left join whg
on wec.idx = whg.idx
left join wd
on wec.iso_code = wd.iso_code