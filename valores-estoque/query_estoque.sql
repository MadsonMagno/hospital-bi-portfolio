-- Objective: Financial Valuation of Medical Inventory
-- Logic: Current Stock count * Average Cost at time of query

SELECT
    estoque.ds_estoque,
    especie.ds_especie,
    produto.cd_produto,
    produto.ds_produto,
    sum(nvl(est_pro.qt_estoque_atual, 0)) as qt_estoque,
    round(verif_vl_custo_medio(produto.cd_produto, sysdate), 2) as vl_custo_medio,
    round(sum(nvl(est_pro.qt_estoque_atual, 0)) * verif_vl_custo_medio(produto.cd_produto, sysdate), 2) as valor_total
FROM dbamv.estoque
JOIN dbamv.est_pro ON estoque.cd_estoque = est_pro.cd_estoque
JOIN dbamv.produto ON est_pro.cd_produto = produto.cd_produto
JOIN dbamv.especie ON produto.cd_especie = especie.cd_especie
WHERE estoque.cd_multi_empresa = 1
  AND nvl(est_pro.qt_estoque_atual, 0) > 0
GROUP BY
    estoque.ds_estoque,
    especie.ds_especie,
    produto.cd_produto,
    produto.ds_produto;
