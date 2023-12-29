DROP VIEW IF EXISTS AvouDe;
DROP VIEW IF EXISTS AvohDe;
CREATE VIEW AvouDe AS

-- Consulta 1
SELECT
    avo_p.nome AS nome1,
    neto.nome AS nome2
    
FROM
    Pessoas neto
JOIN
    MaeDe p ON neto.id = p.filho
JOIN
    Pessoas maes ON p.mae = maes.id
JOIN
    PaiDe avo_mae ON maes.id = avo_mae.filho
JOIN
    Pessoas avo_p ON avo_mae.pai = avo_p.id

UNION

-- Consulta 2
SELECT
    avo_p.nome AS nome1,
    neto.nome AS nome2
    
FROM
    Pessoas neto
JOIN
    PaiDe p ON neto.id = p.filho
JOIN
    Pessoas pai ON p.pai = pai.id
JOIN
    PaiDe avo_pai ON pai.id = avo_pai.filho
JOIN
    Pessoas avo_p ON avo_pai.pai = avo_p.id;


-- Vista AvohDe
CREATE VIEW AvohDe AS

-- Consulta 1
SELECT
    avo_p.nome AS nome1,
    neto.nome AS nome2
FROM
    Pessoas neto
JOIN
    PaiDe p ON neto.id = p.filho
JOIN
    Pessoas mae ON p.pai = mae.id
JOIN
    MaeDe avo_mae ON mae.id = avo_mae.filho
JOIN
    Pessoas avo_p ON avo_mae.mae = avo_p.id

UNION

-- Consulta 2
SELECT
    avo_p.nome AS nome1,
    neto.nome AS nome2
    
FROM
    Pessoas neto
JOIN
    MaeDe p ON neto.id = p.filho
JOIN
    Pessoas mae ON p.mae = mae.id
JOIN
    MaeDe avo_mae ON mae.id = avo_mae.filho
JOIN
    Pessoas avo_p ON avo_mae.mae = avo_p.id
