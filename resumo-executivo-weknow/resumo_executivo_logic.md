# Executive KPI Definitions

The following metrics are aggregated in the **Resumo Weknow** dashboard to provide a holistic view of hospital health.

| KPI | Definition | Source Module |
|---|---|---|
| **Ticket Médio** | Total Net Revenue / Unique Patients | Reg_Fat / Reg_Amb |
| **Margem assistencial** | (Revenue - Direct Clinical Costs) / Revenue | Reg_Fat / Est_Pro |
| **Taxa de Ocupação** | Occupied Beds / Total Bed Capacity | Atendime / Leito |
| **DSO (Days Sales Outstanding)** | Avg. Time from Discharge to Remittance | Movdoc / Remessa_Fat |
| **Custo de Hotelaria** | Sum of daily weights (R$ 688 / R$ 2780) | Itreg_Fat |
| **Surgical Throughput** | Total minutes in OR / Available OR minutes | Aviso_Cirurgia |

## Logic Integration
This dashboard does not run its own complex queries; instead, it consumes the aggregated outputs of the specialized dashboards (Ticket Médio, Rentabilidade, etc.) to ensure data consistency across all management levels.
