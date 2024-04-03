-- SQL queries for create tables in BigQuery before use dbt.

CREATE OR REPLACE EXTERNAL TABLE `dez-final-project.energy_data.energy_consumption_data`
OPTIONS (
  format = 'parquet',
  uris = ['gs://data_lake_bucket_dez-final-project/world_energy_consumption.parquet']
);

CREATE OR REPLACE EXTERNAL TABLE `dez-final-project.energy_data.hydropower_generation_data`
OPTIONS (
  format = 'parquet',
  uris = ['gs://data_lake_bucket_dez-final-project/world_hydropower_generation.parquet']
);

CREATE OR REPLACE EXTERNAL TABLE `dez-final-project.energy_data.dams_data`
OPTIONS (
  format = 'parquet',
  uris = ['gs://data_lake_bucket_dez-final-project/world_dams.parquet']
);