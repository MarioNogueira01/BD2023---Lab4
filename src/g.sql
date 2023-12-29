SELECT pessoa
FROM (
    SELECT pai.nome AS pessoa, COUNT(DISTINCT AvouDe.nome2) AS total_netos
    FROM AvouDe
    JOIN Pessoas pai ON AvouDe.nome1 = pai.nome
    GROUP BY pai.nome

    UNION ALL

    SELECT mae.nome AS pessoa, COUNT(DISTINCT AvohDe.nome2) AS total_netos
    FROM AvohDe
    JOIN Pessoas mae ON AvohDe.nome1 = mae.nome
    GROUP BY mae.nome
) AS avos_netos
ORDER BY total_netos DESC;
