# Case Study: Pending Account Balances and Revenue in Transit

> A tracking mechanism to identify and reduce revenue in transit by monitoring unbilled hospital accounts.

## The Challenge
Hospital cash flow is heavily impacted by the time it takes to finalize medical accounts after patient discharge. Delays in document transit between clinical units and the billing department create significant financial bottlenecks that can lead to missed collection opportunities.

## The Solution
I developed an aging and tracking dashboard to monitor the status of every pending account in the billing pipeline.
* **Tech Stack:** Oracle SQL, Weknow BI.
* **Key Feature:** Aging buckets (0-10, 11-30, 30+ days) and physical document tracking integration.
* **Methodology:** Classified accounts by discharge status to prioritize high-value collections that were delayed purely by administrative processes.

## Results & Impact
* **Risk Mitigation:** Tracked accounts at risk of denial due to submission delays.
* **Process Improvement:** Identified specific departments with the highest documentation backlog.
* **Financial Visibility:** Provided an accurate view of the total dollar value currently locked in the billing pipeline.

## Project Assets
* [query_contas.sql](./query_contas.sql): The SQL logic for aging and documentation tracking.
* [mock_hospital_data.csv](./mock_hospital_data.csv): Synthetic dataset for demonstration purposes.
