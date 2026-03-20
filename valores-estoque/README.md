# Case Study: Healthcare Inventory Valuation

> A real-time financial valuation system designed to ensure clinical availability while minimizing capital lock-up in medical supplies.

## The Challenge
Managing medical supplies, including high-cost items and medications, requires a critical balance between clinical readiness and financial efficiency. The hospital needed a unified view of inventory value across multiple warehouses to quickly identify overstocking issues or imminent clinical shortages.

## The Solution
I created a comprehensive inventory valuation dashboard that tracks thousands of SKUs across all hospital departments.
* **Tech Stack:** Oracle SQL, MV ERP, Weknow BI.
* **Key Feature:** Real-time integration with inventory modules to calculate total value based strictly on the current average cost.
* **Methodology:** Segmented items by drug class and location, distinguishing between donated supplies and hospital-owned inventory to ensure completely accurate financial reporting.

## Results & Impact
* **Capital Efficiency:** Provided a clear view of the total financial asset value currently held in the warehouses.
* **Strategic Purchasing:** Enabled drill-down analysis into high-cost items versus standard commodities to guide procurement strategies.
* **Cash Flow Optimization:** Identified slow-moving items that were unnecessarily tying up hospital capital.

## Project Assets
* [query_estoque.sql](./query_estoque.sql): The SQL logic for multi-warehouse inventory valuation.
* [mock_hospital_data.csv](./mock_hospital_data.csv): Synthetic dataset for demonstration purposes.
