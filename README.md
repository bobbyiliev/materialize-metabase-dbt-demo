# Materialize + Metabase Demo

![Materialize Metabase driver demo](https://github.com/MaterializeInc/terraform-provider-materialize/assets/21223421/c85d5852-7806-407e-ad32-9c97a9aa4514)

## Before you start

- A running Materialize instance
- A running Metabase instance
- The [Materialize Metabase connector](https://github.com/MaterializeInc/metabase-materialize-driver) installed
- dbt installed
- Terraform installed (optional)

You can sign up for a free Materialize account [here](https://materialize.com/register/).

## Running Metabase (optional)

The Materialize driver is available with Metabase Cloud by default. If you have a Metabase Cloud account, you can skip this section.

If you don't have a Metabase Cloud account, you can run Metabase locally. To do so, follow the instructions below.

Start a Metabase Docker container with the Materialize driver installed:

```bash
docker run -d -p 3000:3000 materialize/metabase:1.0.3
```

## Running the demo


![A Terraform Provider for Materialize](https://res.cloudinary.com/mzimgcdn/image/upload/v1682519949/separation-of-roles-for-managing-materialize.png)

- Prepare your environment variables:

```bash
cp .env.example .env
```

- Edit `.env` and set all the variables to the correct values.
- Source the environment variables:

```bash
source .env
```

- (Optional) Create a [Materialize cluster using Terraform](https://materialize.com/blog/terraform-provider/):

```bash
cd terraform
terraform init
terraform apply
```

As this step is optional, if you don't want to use Terraform, you can skip this step and create a Materialize cluster manually:

```sql
CREATE CLUSTER auction_house SIZE 'medium';
```

- Run the dbt project:

```bash
cd dbt
dbt run
```

- Generate the dbt docs:

```bash
dbt docs generate
dbt docs serve
```

- Access Metabase at http://localhost:3000 (or your Metabase Cloud instance).

- Create a new database connection to Materialize and explore the data.

![Metabase real-time dashboard with Materialize](https://github-production-user-asset-6210df.s3.amazonaws.com/21223421/271367286-0bc92c15-0601-4acf-84d7-805b9f514a45.gif)
