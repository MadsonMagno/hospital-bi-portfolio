import csv
import random
from datetime import datetime, timedelta
import os

def generate_csv(filename, headers, data):
    with open(filename, mode='w', newline='', encoding='utf-8') as f:
        writer = csv.writer(f)
        writer.writerow(headers)
        writer.writerows(data)
    print(f"Generated {filename}")

def main():
    base_path = r"c:\Users\John.araujo\Downloads\Mestrado Madson\Formação+CD\hospital-bi-portfolio"
    
    start_date = datetime(2025, 1, 1)
    convenios = ['Bradesco Saúde', 'Unimed', 'Amil', 'SulAmérica', 'Particular']
    pacientes = [f"Paciente Fictício {i}" for i in range(1, 201)]
    setores = ['Pronto Socorro', 'Internação', 'UTI Adulto', 'Centro Cirúrgico', 'Ambulatório']
    
    # 1. Ticket Medio
    headers_tm = ['dt_competencia', 'conta', 'valor_liquido', 'tp_atendimento', 'cd_paciente', 'nm_convenio', 'nm_setor_produziu', 'qt_diaria']
    data_tm = []
    for i in range(100):
        dt = (start_date + timedelta(days=random.randint(0, 60))).strftime('%Y-%m')
        data_tm.append([dt, 1000+i, round(random.uniform(200, 15000), 2), random.choice(['I', 'A', 'U']), random.randint(100, 999), random.choice(convenios), random.choice(setores), random.randint(1, 5)])
    generate_csv(os.path.join(base_path, "ticket-medio", "mock_hospital_data.csv"), headers_tm, data_tm)

    # 2. Rentabilidade
    headers_rent = ['CD_ATENDIMENTO', 'CD_CONVENIO', 'NM_CONVENIO', 'RECEITA', 'CUSTO_TOTAL', 'RESULTADO_BRUTO', 'RESULTADO_LIQUIDO_FINAL', 'MARGEM_RENTABILIDADE']
    data_rent = []
    for i in range(100):
        rec = round(random.uniform(5000, 50000), 2)
        cost = round(rec * random.uniform(0.3, 0.45), 2)
        bruto = round(rec - cost, 2)
        liq = round(bruto * 0.66, 2) if bruto > 0 else bruto
        marg = round((liq/rec)*100, 2)
        data_rent.append([2000+i, random.randint(10, 50), random.choice(convenios), rec, cost, bruto, liq, marg])
    generate_csv(os.path.join(base_path, "rentabilidade-hospitalar", "mock_hospital_data.csv"), headers_rent, data_rent)

    # 3. Ocupacao
    headers_oc = ['cd_atendimento', 'cd_paciente', 'dt_atendimento', 'internado_ha_dias', 'ds_leito', 'ds_unid_int', 'nm_convenio', 'ds_especialid']
    data_oc = []
    for i in range(100):
        dias = random.randint(1, 30)
        dt = (datetime.now() - timedelta(days=dias)).strftime('%Y-%m-%d')
        data_oc.append([3000+i, random.randint(100, 999), dt, dias, f"Leito {random.randint(1, 50)}", random.choice(['UTI', 'Enfermaria', 'Apartamento']), random.choice(convenios), random.choice(['Cardiologia', 'Ortopedia', 'Clínica Médica'])])
    generate_csv(os.path.join(base_path, "ocupacao-hospitalar", "mock_hospital_data.csv"), headers_oc, data_oc)

    # 4. Saldo Contas
    headers_sc = ['tp_atendimento', 'conta', 'cd_atendimento', 'nm_convenio', 'dt_alta', 'dt_fatura', 'nm_setor_documento', 'situacao_atendimento', 'grupo_dias_pendente', 'valor']
    data_sc = []
    for i in range(100):
        dias = random.randint(1, 45)
        grupo = '10 dias' if dias <= 10 else ('30 dias' if dias <= 30 else 'Acima de 30 dias')
        data_sc.append([random.choice(['I', 'A', 'U']), 4000+i, 40000+i, random.choice(convenios), '2026-03-01', f"2026-03-{random.randint(2, 15):02d}", random.choice(['Faturamento', 'Auditoria', 'Enfermagem']), random.choice(['ABERTA - COM ALTA', 'ABERTA - SEM ALTA']), grupo, round(random.uniform(500, 20000), 2)])
    generate_csv(os.path.join(base_path, "saldo-contas-pendentes", "mock_hospital_data.csv"), headers_sc, data_sc)

    # 5. Estoque
    headers_est = ['ds_estoque', 'ds_especie', 'cd_produto', 'ds_produto', 'qt_estoque', 'vl_custo_medio', 'valor_total']
    data_est = []
    for i in range(100):
        qt = random.randint(10, 1000)
        custo = round(random.uniform(5, 500), 2)
        data_est.append([random.choice(['Fármacia Central', 'Almoxarifado', 'Centro Cirúrgico']), random.choice(['Antibióticos', 'OPME', 'Material Médico']), 5000+i, f"Produto {i}", qt, custo, round(qt*custo, 2)])
    generate_csv(os.path.join(base_path, "valores-estoque", "mock_hospital_data.csv"), headers_est, data_est)

    # 6. Espera
    headers_esp = ['ds_tipo_tempo_processo', 'dh_processo', 'nm_local_estacao', 'ds_sequencia_processo', 'cd_atendimento', 'nm_paciente', 'atendente']
    data_esp = []
    for i in range(100):
        data_esp.append(['Recepção > Triagem', (datetime.now() - timedelta(minutes=random.randint(5, 120))).strftime('%Y-%m-%d %H:%M:%S'), f"Guichê {random.randint(1, 5)}", '2', 6000+i, random.choice(pacientes), f"Atendente {random.randint(1, 3)}"])
    generate_csv(os.path.join(base_path, "tempo-espera-atendimento", "mock_hospital_data.csv"), headers_esp, data_esp)

    # 7. Gerencial Computo
    headers_ger = ['cd_atendimento', 'tipo_atendimento', 'nm_paciente', 'nm_convenio', 'nm_setor', 'vl_total_bruto', 'vl_total_liquido', 'vl_opme', 'desc_cirurgias']
    data_ger = []
    for i in range(100):
        bruto = round(random.uniform(1000, 50000), 2)
        data_ger.append([7000+i, random.choice(['INTERNADO', 'AMBULATORIAL']), random.choice(pacientes), random.choice(convenios), random.choice(setores), bruto, round(bruto*0.9, 2), round(bruto*random.uniform(0.1, 0.4), 2), 'Cirurgia Apendicite' if random.random() > 0.5 else ''])
    generate_csv(os.path.join(base_path, "gerencial-computo-pacientes", "mock_hospital_data.csv"), headers_ger, data_ger)

    # 8. Resumo Executivo
    headers_res = ['mes', 'ticket_medio', 'margem_assistencial_pct', 'taxa_ocupacao_pct', 'dso_dias', 'custo_hotelaria', 'surgical_throughput_pct']
    data_res = []
    for i in range(1, 13):
        data_res.append([f"2025-{i:02d}", round(random.uniform(5000, 8000), 2), round(random.uniform(15, 30), 1), round(random.uniform(70, 95), 1), random.randint(45, 80), round(random.uniform(1000000, 2000000), 2), round(random.uniform(60, 85), 1)])
    generate_csv(os.path.join(base_path, "resumo-executivo-weknow", "mock_hospital_data.csv"), headers_res, data_res)

    print("All CSVs generated successfully!")

if __name__ == "__main__":
    main()
