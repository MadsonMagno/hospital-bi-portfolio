-- Objective: Process-mining patient wait times in ED
-- logic: Calculate deltas between lifecycle timestamps

SELECT
    tp.ds_tipo_tempo_processo,
    tp.dh_processo,
    tp.nm_local_estacao,
    tp.ds_sequencia_processo,
    tp.cd_atendimento,
    paciente.nm_paciente,
    usuarios.nm_usuario as atendente
FROM dbamv.sacr_tempo_processo tp
LEFT JOIN dbasgu.usuarios on tp.nm_usuario = usuarios.cd_usuario
LEFT JOIN dbamv.atendime on tp.cd_atendimento = atendime.cd_atendimento
LEFT JOIN dbamv.paciente on atendime.cd_paciente = paciente.cd_paciente
WHERE tp.dh_processo >= sysdate - 30 -- Last 30 days
ORDER BY tp.dh_processo DESC;
