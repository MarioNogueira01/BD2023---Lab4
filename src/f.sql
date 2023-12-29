SELECT P.nome
FROM Pessoas P
JOIN (
    SELECT pai, COUNT(filho) as num_filhos
    FROM PaiDe
    GROUP BY pai
    HAVING COUNT(filho) > 3
) PF ON P.id = PF.pai

UNION

SELECT P.nome
FROM Pessoas P
JOIN (
    SELECT mae, COUNT(filho) as num_filhos
    FROM MaeDe
    GROUP BY mae
    HAVING COUNT(filho) > 3
) MF ON P.id = MF.mae;
