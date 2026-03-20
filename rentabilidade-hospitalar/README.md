# Case Study: Hospital Profitability Tracking

> An advanced tracking system that transitions hospital financial reporting from gross revenue to net profit per patient encounter.

## The Challenge
Hospital boards often struggle to determine the true margin of clinical procedures because costs—such as supplies, medications, physician fees, and daily room rates—are siloed from revenue data. Without a unified view, the organization cannot identify loss leaders or optimize high-performing clinical areas.

## The Solution
I engineered a comprehensive profitability engine that calculates the net result for individual patient encounters.
* **Tech Stack:** Oracle SQL, MV ERP, Weknow BI.
* **Key Feature:** A cost allocation engine that integrates daily room rates, diagnostic percentages, and operating room minute costs.
* **Methodology:** Implemented strict provisioning rules for expected denials and taxes to ensure conservative margin reporting.

## Results & Impact
* **True Margin Tracking:** Empowered decision-makers to track the bottom line after all operational costs and tax deductions.
* **Efficiency Highlighting:** Identified the true profitability of different medical specialties.
* **Cost Discrepancy Identification:** Exposed gaps between billed amounts and real operational expenses.

## Project Assets
* [query_rentabilidade.sql](./query_rentabilidade.sql): The SQL logic for net result calculation.
* [dash_logic.md](./dash_logic.md): Documentation of the business rules for cost allocation.
* [mock_hospital_data.csv](./mock_hospital_data.csv): Synthetic dataset for demonstration purposes.
