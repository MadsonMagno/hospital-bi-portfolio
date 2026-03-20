-- Objective: Track Pending Billing accounts and Aging
-- Logic: Join faturamento data with document transit (MOVDOC)

SELECT
    tp_atendimento,
    conta,
    cd_atendimento,
    nm_convenio,
    dt_alta,
    dt_fatura,
    nm_setor_documento,
    situacao_atendimento,
    CASE
        WHEN trunc(sysdate) - dt_fatura <= 10 THEN '10 dias'
        WHEN trunc(sysdate) - dt_fatura <= 30 THEN '30 dias'
        ELSE 'Acima de 30 dias'
    END as grupo_dias_pendente,
    valor
FROM (
    SELECT
        atendime.tp_atendimento,
        reg_fat.cd_reg_fat as conta,
        atendime.cd_atendimento,
        convenio.nm_convenio,
        trunc(atendime.dt_alta) as dt_alta,
        trunc(reg_fat.dt_final) as dt_fatura,
        setor.nm_setor as nm_setor_documento,
        nvl(itlan_med.vl_liquido, itreg_fat.vl_total_conta) as valor,
        CASE
            WHEN nvl(reg_fat.sn_fechada,'N') = 'N' AND dt_alta IS NULL THEN 'ABERTA - SEM ALTA'
            WHEN nvl(reg_fat.sn_fechada,'N') = 'N' AND dt_alta IS NOT NULL THEN 'ABERTA - COM ALTA'
            ELSE 'FECHADA'
        END as situacao_atendimento
    FROM dbamv.reg_fat
    JOIN dbamv.itreg_fat ON (reg_fat.cd_reg_fat = itreg_fat.cd_reg_fat)
    JOIN dbamv.convenio ON (reg_fat.cd_convenio = convenio.cd_convenio)
    JOIN dbamv.atendime ON (reg_fat.cd_atendimento = atendime.cd_atendimento)
    LEFT JOIN dbamv.setor ON (setor.cd_setor = itreg_fat.cd_setor)
    LEFT JOIN dbamv.itlan_med ON (itlan_med.cd_reg_fat = itreg_fat.cd_reg_fat)
    WHERE NOT EXISTS (
        SELECT 1 FROM dbamv.remessa_fatura r 
        WHERE r.cd_remessa = reg_fat.cd_remessa AND r.sn_fechada = 'S'
    )
)
WHERE rownum <= 1000;
