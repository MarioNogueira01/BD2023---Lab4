SELECT
    m.nome AS "Nome da Mae",
    p.nome AS "Nome do Filho(a)"
FROM
    MaeDe md
JOIN
    Pessoas m ON md.mae = m.id
JOIN
    Pessoas p ON md.filho = p.id
ORDER BY
    m.nome ASC,
    p.nome ASC;
