# Case Study: Hospital Occupancy and Length of Stay (LOS)

> A real-time monitoring system designed to track bed availability and patient stay duration to optimize hospital capacity.

## The Challenge
Managing bed turnover is a significant operational challenge in healthcare. Without real-time visibility into how long patients have been in each unit, the hospital faces bottlenecks in emergency admissions and delays in elective surgeries.

## The Solution
I built a real-time occupancy capability dashboard to provide a live pulse of the hospital's capacity.
* **Tech Stack:** Oracle SQL, MV ERP, Weknow BI.
* **Key Feature:** Live calculation of stay duration based on active admissions.
* **Methodology:** Integrated patient demographic data and medical specialties to pinpoint units experiencing the highest demand.

## Results & Impact
* **Proactive Flow Management:** Tracked the percentage of available beds currently in use across the entire hospital.
* **Length of Stay Optimization:** Calculated the average duration of stay per medical specialty to improve discharge planning.
* **Outlier Detection:** Created an early warning system to highlight patients with unusually long stays for clinical review.

## Project Assets
* [query_ocupacao.sql](./query_ocupacao.sql): The SQL logic for real-time occupancy tracking.
* [mock_hospital_data.csv](./mock_hospital_data.csv): Synthetic dataset for demonstration purposes.
