# Case Study: Patient Billing Governance and Reconciliation

> A centralized governance dashboard to ensure all clinical procedures are accurately captured and billed, eliminating revenue leakage.

## The Challenge
High-volume hospital operations often suffer from revenue leakage, where procedures are performed clinically but not properly registered in the billing system. The hospital required a unified, reliable view of every patient encounter to consistently reconcile clinical activity with financial records.

## The Solution
I designed a centralized patient billing control system that integrates multiple ERP modules into a single pane of glass.
* **Tech Stack:** Oracle SQL, MV ERP, Weknow BI.
* **Key Feature:** Automatic reconciliation that identifies items belonging to pre-negotiated clinical bundles versus those that must be billed individually.
* **Methodology:** Aggregated a global financial total per patient, pulling together medication costs, high-cost surgical materials, and physician fees.

## Results & Impact
* **Revenue Assurance:** Provided an accurate final billable amount after calculating estimated hospital tax deductions.
* **Bundle Compliance:** Highlighted revenue generated specifically from items not covered by standard clinical bundles.
* **Surgical Material Tracking:** Delivered precision tracking of high-cost surgical implants to prevent unbilled usage.

## Project Assets
* [query_gerencial.sql](./query_gerencial.sql): The centralized SQL view for clinical-financial reconciliation.
* [mock_hospital_data.csv](./mock_hospital_data.csv): Synthetic dataset for demonstration purposes.
