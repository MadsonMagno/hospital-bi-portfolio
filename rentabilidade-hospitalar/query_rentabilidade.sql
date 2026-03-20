-- Objective: Calculate Net Result and Profitability Margin
-- Logic: Integrates Costs (Daily rates, SADT, Meds) with Revenue

SELECT
    B.*,
    (RECEITA - CUSTO_TOTAL) AS RESULTADO_BRUTO,
    (CASE 
        WHEN (RECEITA - CUSTO_TOTAL) > 0 THEN (RECEITA - CUSTO_TOTAL) * 0.66
        ELSE (RECEITA - CUSTO_TOTAL)
     END) AS RESULTADO_LIQUIDO_FINAL,
    ROUND(((RECEITA - CUSTO_TOTAL) / NULLIF(RECEITA, 0)) * 100, 2) AS MARGEM_RENTABILIDADE
FROM (
    SELECT
        A.CD_ATENDIMENTO,
        A.CD_CONVENIO,
        A.NM_CONVENIO,
        Sum(DISTINCT VL_TOTAL_CONTA) AS RECEITA,
        -- Complex Cost Accumulation (Daily rates, Meds, etc.)
        (Nvl(A.diarias_internacao,0) * 688) +
        (Nvl(A.diarias_UTI,0) * 2780) +
        (Nvl(A.diarias_enfermaria,0) * 2780) +
        Nvl(A.CUSTO_MATERIAL, 0) +
        Nvl(A.CUSTO_MEDICAMENTO, 0) +
        (A.minuto_cirurgico * 7.85) AS CUSTO_TOTAL
    FROM (
        -- Subquery pulling raw data from ERP tables (reg_fat, itreg_fat, etc.)
        -- Logic: [Refer to full query in repository for details]
        SELECT 
            1 as dummy -- [Simplified for demonstration]
        FROM DUAL
    ) A
) B;
