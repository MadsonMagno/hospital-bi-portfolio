-- Objective: Real-time Occupancy and Length of Stay Analysis
-- Environment: Oracle DB (MV ERP)

SELECT
    atendime.cd_atendimento,
    paciente.cd_paciente,
    atendime.dt_atendimento,
    -- Simple LOS calculation
    trunc(sysdate) - trunc(atendime.dt_atendimento) AS internado_ha_dias,
    leito.ds_leito,
    unid_int.ds_unid_int,
    convenio.nm_convenio,
    especialid.ds_especialid
FROM atendime
INNER JOIN paciente ON atendime.cd_paciente = paciente.cd_paciente
INNER JOIN leito ON atendime.cd_leito = leito.cd_leito
INNER JOIN unid_int ON leito.cd_unid_int = unid_int.cd_unid_int
INNER JOIN convenio ON atendime.cd_convenio = convenio.cd_convenio
LEFT JOIN esp_med ON atendime.cd_prestador = esp_med.cd_prestador AND esp_med.sn_Especial_principal = 'S'
LEFT JOIN especialid ON esp_med.cd_especialid = especialid.cd_especialid
WHERE atendime.dt_alta IS NULL -- Active admissions only
  AND atendime.tp_atendimento = 'I' -- Inpatient only
ORDER BY internado_ha_dias DESC;
