# Case Study: Emergency Wait Time Process Mining

> A process-mining analysis to reduce patient wait times in emergency care by identifying bottlenecks in the triaging and registration workflows.

## The Challenge
Long wait times in the Emergency Department directly impact patient satisfaction and clinical safety. The hospital needed to identify exactly where delays were occurring—whether during administrative check-in, clinical triage, or the transition to the actual physician consultation.

## The Solution
I developed a process-mining dashboard to track the complete patient lifecycle from the moment they enter the hospital doors.
* **Tech Stack:** Oracle SQL, Weknow BI.
* **Key Feature:** Time-stamp tracking that measures the exact delta between registration, triage, and doctor call.
* **Methodology:** Analyzed specific triage stations to pinpoint structural delays and monitored individual administrative throughput.

## Results & Impact
* **Triage Optimization:** Calculated the average wait time per clinical risk level (Manchester scale) to ensure critical patients were prioritized effectively.
* **Bottleneck Identification:** Highlighted specific times of day with the highest discrepancy between patient arrival and clinical assessment.
* **Operational Efficiency:** Measured the exact minutes taken to complete administrative registration, guiding targeted staff training.

## Project Assets
* [query_espera.sql](./query_espera.sql): The SQL logic for processing lifecycle timestamps.
* [mock_hospital_data.csv](./mock_hospital_data.csv): Synthetic dataset for demonstration purposes.
