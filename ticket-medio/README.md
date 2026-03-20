# Case Study: Average Ticket Management in Healthcare

> A Business Intelligence solution to monitor and optimize hospital revenue per patient encounter and billing account.

## The Challenge
Hospital management needed to understand which departments (such as Surgical, ICU, and Outpatient) generated the most value per encounter and which health plans were most profitable. The lack of granular data made it difficult to negotiate contracts and allocate resources effectively across the organization.

## The Solution
I developed a unified dashboard and data pipeline to process complex billing data.
* **Tech Stack:** Oracle SQL, Weknow BI, Python.
* **Key Feature:** Segments revenue by the actual producing sector rather than the patient's admission unit.
* **Methodology:** Filtered out bundled payments and public health sector accounts to ensure an accurate calculation of the private "Average Ticket".

## Results & Impact
* **Financial Visibility:** Provided accurate average revenue per billing account and per unique patient.
* **Strategic Benchmarking:** Enabled direct comparisons between surgical and clinical units.
* **Contract Negotiation:** Delivered the data foundation required to negotiate better rates with health plans.

## Project Assets
* [query.sql](./query.sql): The sanitized SQL logic used to extract and process data from the ERP.
* [mock_hospital_data.csv](./mock_hospital_data.csv): Synthetic dataset generated for demonstration purposes.
