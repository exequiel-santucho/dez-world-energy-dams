# Tutorial

---

### 1. Getting Started

For this tutorial, we will focus on the data engineering part of the project. So, we'll start with the raw dataset that's already been downloaded and stored in `./data`.

Python version: 3.10.0

### 2. Provisioning Cloud Resources

We'll use Terraform to provision the resources required for this project:

- A Cloud Storage bucket (Data lake)

- A BigQuery dataset (for warehousing)

The code for implementing all these resources is in `./terraform/main.tf`. You can customize the names, zones, and values in the `./terraform/variables.tf` file.

##### Authenticate

Obtain a .json key for your Google Cloud Service Account with permissions for Cloud Storage and BigQuery.

##### Deploy

Open a terminal and run the following commands:

- `terraform init`
- `terraform plan`
- `terraform apply`

Check the provisioned resources in Google Cloud Platform. If you want to eliminate the services created run:

- `terraform destroy`

More detailed instructions [here](https://github.com/DataTalksClub/data-engineering-zoomcamp/tree/main/01-docker-terraform).

### 3. Transforming and loading to GCP with Mage

You can install Mage using pip or conda, though this may cause dependency issues without the proper environment:

```bash
pip install mage-ai
```

After that you should install Mage dependiencies. This use Google Cloud Storage for data import or export:

```bash
pip install mage-ai[google-cloud-storage]
```

Create new project and launch tool:

```bash
mage start [project_name]
```

In our case, `[project_name] = 'mage'`

Open Mage:

Open [http://localhost:6789](http://localhost:6789/) in your browser.

If you explore `./mage` folder you could see that the entire pipeline is defined across some files summarized as:

- Load data

- Transform data

- Export data

Also you can see `./images` folder for detailed concatenation of this files for every dataset.

More detailed instructions [here](https://github.com/DataTalksClub/data-engineering-zoomcamp/tree/main/02-workflow-orchestration).

### 4. Analytics Engineering with dbt

 The goal here is transforming the data loaded in Data Warehouse (Google Cloud Storage) into Analytical Views developing a dbt project. By this stage you should have already:

- A running warehouse (BigQuery)
- A set of running pipelines ingesting the project dataset (Mage)
- The datasets from `./data` ingested into GCS in a *.parquet* format.

##### Setting up dbt for using BigQuery (cloud)

- Open a free developer dbt cloud account following [this link.](https://www.getdbt.com/signup/)

- Following these instructions to connect to your BigQuery instance.

- More detailed instructions [here](https://github.com/DataTalksClub/data-engineering-zoomcamp/blob/main/04-analytics-engineering/dbt_cloud_setup.md).

The transformation lineage is contained in the `./dbt/models` folder, and in `./images` you can see an overview of that.

### 5. Dashboarding

After saving the transformed data into BigQuery, you can start a Looker Studio project and follow along [this tutorial](https://www.youtube.com/watch?v=39nLTs74A3E&list=PL3MmuxUbc_hJed7dXYoJw8DoCuVHhGEQb&index=49) to represent data of interest.
