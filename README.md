# World Energy and Dams

---

### Introduction

This project is part of the [Data Engineering Zoomcamp](https://github.com/DataTalksClub/data-engineering-zoomcamp). As part of the project, I developed an end-to-end data pipeline, loading and processing data from different sources.

The primary objective of this project is to establish a streamlined data pipeline for transforming, storing, and visualizing data automatically.

Given that the data is static, the data pipeline operates as a one-time process.

> **Disclaimer:** The datasets used for this project are relatively smalls datasets. The main idea of this project wasn't to deal with a big dataset at this point, but rater build a pipeline that can fetch, organize and transform present data. But above all, to answer some questions that arose during the formulation of the problem.

### Problem

Global electricity consumption is rising due to population growth, industrial expansion, and technological progress, raising sustainability concerns with traditional fossil fuels. To tackle these challenges, a shift to renewable sources like hydroelectric power is crucial. Hydroelectric energy, from flowing or falling water, is reliable, scalable, and eco-friendly, contrasting with fossil fuels' emissions. Its significance lies in reducing greenhouse gases, addressing climate change, and supporting sustainable development, while also offering non-energy benefits like water management and flood control.

In this sense, we try to answer the following questions:

1. How has global energy consumption evolved in recent years?

2. How the contribution of hydroelectric energy has evolved worldwide?

3. What is the number of dams per country that contribute to the generation of hydroelectric energy?

### Tools

1. **Cloud:**
   
   - [Google Cloud Platform (GCP)](https://cloud.google.com/?utm_source=bing&utm_medium=cpc&utm_campaign=latam-AR-all-es-dr-BKWS-all-all-trial-e-dr-1707800-LUAC0016410&utm_content=text-ad-none-any-DEV_c-CRE_-ADGP_Hybrid+%7C+BKWS+-+MIX+%7C+Txt_+GCP-General-KWID_43700067403123893-kwd-77859523038025:loc-8&utm_term=KW_Google+Cloud+Platform-ST_Google+Cloud+Platform&gclid=f110f2a74b1b1da673c894aa2e0948fa&gclsrc=3p.ds&hl=en)
   
   - [Terraform (IaC)](https://www.terraform.io/)

2. **Data Ingestion (batch):**
   
   - [Mage](https://www.mage.ai/)

3. **Data Lake:**
   
   - [Google Cloud Storage](https://cloud.google.com/storage?hl=en)

4. **Data Transformations and Processing:**
   
   - [dbt](https://www.getdbt.com/)

5. **Data Warehousing:**
   
   - [Google BigQuery](https://cloud.google.com/bigquery?hl=en)

6. **Dashboarding:**
   
   - [Google Looker Studio](https://lookerstudio.google.com/overview)

### Architecture



<img title="" src="file:///D:/2024/programacion/data_engineering_zoomcamp-data_talks/data-engineering-zoomcamp-homework/final_project/images/arquitecture.PNG" alt="COLOCAR" data-align="center">

### Conclusion

Check the dashboard [***HERE***](https://lookerstudio.google.com/reporting/652f3bbd-89da-4436-a6d9-8d927817c877).

After analyzing data from the year 2000 to the present, we can be said that:

1. Global energy demand (measured in TWh) has increased by approximately 100%.

2. The contribution of hydroelectric energy has also increased by approximately 100%, although this contribution represents only 10% of total demand.

3. The United States is the country with the largest number of dams for hydroelectric generation, with 341. However, the largest amount of hydroelectric energy generated (in TWh) occurs in China, with 95 dams.

---

### Folder navigation

#### `./code`

**- exploration.ipynb**

Notebook with Python script to data exploration.

**- queries.sql**

SQL queries for create tables in BigQuery before use dbt.

#### `./data`

**- world_dams.csv; world_dams_meta.csv**

This csv database contains hydropower dam locations (lat/long) as well as physical, electrical, and administrative information to help stakeholders identify opportunities for future hydro-connected solar installations. Obtained from [here](https://energydata.info/dataset/global-dams-database).

**- world_energy_consumption.csv; world_energy_consumption_meta.csv**

This dataset consists of energy consumption and production of each country in respective years. This is a collection of key metrics maintained by [*Our World in Data*](https://ourworldindata.org/energy). It is updated regularly and includes data on energy consumption (primary energy, per capita, and growth rates), energy mix, electricity mix and other relevant metrics. Obtained from [here](https://www.kaggle.com/datasets/pralabhpoudel/world-energy-consumption?resource=download).

**- world_hydropower_generation.csv**

This dataset is compiled by Our World in Data based on two sources:  BP Statistical Review of World Energy and Ember. Obtanied from [here](https://www.kaggle.com/datasets/jorgesandoval/hydropower-generation).

#### `./dbt`

Sub folders and files for the whole dbt project.

#### `./images`

Various images of mage pipelines and dbt models, among other things

#### `./keys`

Folder for secrets. Inside you can put your .json key from GCP.

#### `./looker_studio`

Dashboard resulting from the design in looker studio and access link.

#### `./mage`

Sub folders and files for the whole mage project.

#### `./terraform`

**- main.tf**

Main configuration file for Terraform, defining the infrastructure as code to provision (or destroy) all the necessary resources in the cloud.

**- variables.tf**

File containing variable definitions used in the main Terraform file (main.tf), facilitating code customization and reuse.

---

### Tutorial

For the instructions and walkthrough, please refer to [TUTORIAL.md](https://github.com/exequiel-santucho/dez-world-energy-dams/blob/main/TUTORIAL.md).
