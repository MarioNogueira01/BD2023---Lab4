DROP TRIGGER IF EXISTS validaPaiDe_trigger ON PaiDe CASCADE;
DROP TRIGGER IF EXISTS validaMaeDe_trigger ON MaeDe CASCADE;
DROP FUNCTION IF EXISTS validateGenerPai() CASCADE;
DROP FUNCTION IF EXISTS validateGenerMae() CASCADE;
DROP TABLE IF EXISTS Pessoas CASCADE;
DROP TABLE IF EXISTS MaeDe CASCADE;
DROP TABLE IF EXISTS PaiDe CASCADE;

CREATE TABLE Pessoas(
    id INTEGER PRIMARY KEY,
    nome VARCHAR(60),
    sexo CHAR(1) CHECK (sexo IN ('m', 'f')),
    dataNasc DATE
    );

CREATE TABLE MaeDe (
    mae INT,
    filho INT,
    PRIMARY KEY (filho)
);

CREATE TABLE PaiDe (
    pai INT,
    filho INT,
    PRIMARY KEY (filho)
);


-- Função que valida se o pai inserido na tabela PaiDe é do sexo masculino
CREATE OR REPLACE FUNCTION validateGenerPai() RETURNS TRIGGER AS $$
BEGIN 
    IF (SELECT sexo FROM pessoas WHERE id = NEW.pai) <> 'm' THEN
        RAISE EXCEPTION 'O pai tem de ser do Sexo masculino';
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Função que valida se o pai inserido na tabela PaiDe é do sexo masculino
CREATE OR REPLACE FUNCTION validateGenerMae() RETURNS TRIGGER AS $$
BEGIN 
    IF (SELECT sexo FROM pessoas WHERE id = NEW.mae) <> 'f' THEN
        RAISE EXCEPTION 'A mae tem de ser do Sexo feminino';
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Parte de Criação das Triggers
CREATE TRIGGER validaPaiDe_trigger BEFORE INSERT ON PaiDe
FOR EACH ROW 
EXECUTE FUNCTION validateGenerPai();

-- Parte de Criação das Triggers
CREATE TRIGGER validaMaeDe_trigger BEFORE INSERT ON MaeDe
FOR EACH ROW 
EXECUTE FUNCTION validateGenerMae();