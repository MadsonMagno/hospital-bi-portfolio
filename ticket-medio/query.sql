-- Objective: Pull sanitized revenue data for Ticket Médio analysis
-- Environment: Oracle DB (MV ERP)

SELECT
    dt_competencia,
    conta,
    valor_liquido,
    tp_atendimento,
    cd_paciente,
    nm_convenio,
    nm_setor_produziu,
    CASE
        WHEN cd_gru_fat = 1 AND cd_setor_produziu NOT IN (3, 9) THEN qt_lancamento
        ELSE 0
    END AS qt_diaria
FROM (
    -- HOSPITAL (ITREG_FAT)
    SELECT
        fatura.dt_competencia,
        reg_fat.cd_reg_fat as conta,
        nvl(itlan_med.vl_liquido, itreg_fat.vl_total_conta) as valor_liquido,
        decode(atendime.tp_atendimento, 'I', 'Internado', 'U', 'Urgência', 'A', 'Ambulatorial', 'E', 'Externo') as tp_atendimento,
        atendime.cd_paciente,
        convenio.nm_convenio,
        setor.nm_setor as nm_setor_produziu,
        itreg_fat.cd_gru_fat,
        itreg_fat.qt_lancamento
    FROM dbamv.reg_fat
    JOIN dbamv.itreg_fat ON (reg_fat.cd_reg_fat = itreg_fat.cd_reg_fat)
    JOIN dbamv.convenio ON (reg_fat.cd_convenio = convenio.cd_convenio)
    JOIN dbamv.atendime ON (reg_fat.cd_atendimento = atendime.cd_atendimento)
    JOIN dbamv.setor ON (itreg_fat.cd_setor = setor.cd_setor)
    LEFT JOIN dbamv.itlan_med ON (itlan_med.cd_reg_fat = itreg_fat.cd_reg_fat AND itlan_med.cd_lancamento = itreg_fat.cd_lancamento)
    WHERE reg_fat.cd_multi_empresa = 1
      AND nvl(itreg_fat.sn_pertence_pacote, 'N') = 'N' -- Exclude bundled items
      AND convenio.tp_convenio <> 'H' -- Exclude Public Health / SUS
      AND nvl(itlan_med.vl_liquido, itreg_fat.vl_total_conta) > 0
)
WHERE rownum <= 1000; -- Limit for reporting demonstration
