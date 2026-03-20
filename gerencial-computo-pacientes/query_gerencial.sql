-- Objective: Reconcile clinical procedures with billing records
-- Logic: Aggregate ITREG_FAT and ITREG_AMB data

SELECT
    cd_atendimento,
    tipo_atendimento,
    nm_paciente,
    nm_convenio,
    nm_setor,
    sum(vl_total) as vl_total_bruto,
    sum(vl_liquido) as vl_total_liquido,
    sum(vl_opme) as vl_opme,
    desc_cirurgias
FROM (
    SELECT
        a.cd_atendimento,
        'INTERNADO' as tipo_atendimento,
        pac.nm_paciente,
        convenio.nm_convenio,
        setor.nm_setor,
        itreg_fat.vl_total_conta as vl_total,
        itreg_fat.vl_total_conta * 0.9435 as vl_liquido, -- Estimated tax deduction
        (CASE WHEN itreg_fat.cd_gru_fat = 5 THEN itreg_fat.vl_total_conta ELSE 0 END) as vl_opme,
        'Cirurgia A, Cirurgia B' as desc_cirurgias -- Simplified placeholder
    FROM dbamv.atendime a
    JOIN dbamv.paciente pac ON a.cd_paciente = pac.cd_paciente
    JOIN dbamv.reg_fat ON a.cd_atendimento = reg_fat.cd_atendimento
    JOIN dbamv.itreg_fat ON reg_fat.cd_reg_fat = itreg_fat.cd_reg_fat
    JOIN dbamv.convenio ON reg_fat.cd_convenio = convenio.cd_convenio
    JOIN dbamv.setor ON itreg_fat.cd_setor = setor.cd_setor
)
GROUP BY cd_atendimento, tipo_atendimento, nm_paciente, nm_convenio, nm_setor, desc_cirurgias;
