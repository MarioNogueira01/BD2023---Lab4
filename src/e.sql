--para meio irmaos
SELECT nome1,nome2
FROM(
    SELECT
        nome1.nome as nome1, nome2.nome as nome2

    FROM
        PaiDe x
    JOIN
        Paide p ON x.pai = p.pai
    JOIN
        Pessoas nome1 on p.filho = nome1.id
    JOIN 
        Pessoas nome2 on x.filho = nome2.id

    UNION
    
    SELECT
        nome1.nome as nome1, nome2.nome as nome2
    FROM
        MaeDe x 
    JOIN
        MaeDe p ON x.mae = p.mae
    JOIN
        Pessoas nome1 on p.filho = nome1.id
    JOIN 
        Pessoas nome2 on x.filho = nome2.id

    EXCEPT(
        SELECT * FROM IrmaoDe
    )
)
WHERE nome1 != nome2 AND nome1 < nome2