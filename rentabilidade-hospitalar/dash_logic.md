# Business Rules: Cost Allocation Logic (MV ERP/Weknow)

The "Rentabilidade Hospitalar" case study uses a composite costing model to determine if an encounter was profitable.

## 1. Daily Rates (Hotelaria)
To avoid real-time complex cost center calculations, we use fixed daily weights based on common hospital benchmarks:
*   **Medical Unit (Internação):** R$ 688,00 per day.
*   **ICU / Emergency (UTI/Enfermaria):** R$ 2.780,00 per day.

## 2. Operating Room (CC)
Surgical profit is highly dependent on turnaround time. We calculate OR costs by:
*   **R$ 7,85 per minute** of surgical duration (`vl_tempo_duracao`).

## 3. SADT Dependencies (Diagnostics)
Profit from exams like MRI or CT-Scan is estimated as a percentage of the faturamento value to account for equipment lease and technician professional fees:
*   **Tomography:** 17% cost.
*   **Ultrasound:** 50% cost.
*   **MRI (Ressonância):** 16% cost.

## 4. Materials and Medications
Unlike other costs, these are pulled directly from the **Average Cost** (`Custo Médio`) at the time of the transaction in the inventory module (`itMVTO_ESTOQUE`).

## 5. Final Result Calculation
A 34% deduction for income tax (IRPJ) is applied to any positive balance to show clinical "Net-Net" profit to the board.
