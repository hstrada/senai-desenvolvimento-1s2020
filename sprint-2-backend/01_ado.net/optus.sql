CREATE DATABASE Optus
GO

USE Optus
GO

CREATE TABLE EstilosMusicais
(
	EstiloMusicalId		INT IDENTITY PRIMARY KEY
	,Nome				VARCHAR(200) NOT NULL UNIQUE
)
GO

INSERT INTO EstilosMusicais VALUES ('Rock')
GO

SELECT * FROM EstilosMusicais
GO

SELECT EstiloMusicalId, Nome FROM EstilosMusicais
GO

UPDATE EstilosMusicais SET Nome = 'Rock Alternativo' WHERE EstiloMusicalId = 1
GO

DELETE FROM EstilosMusicais WHERE EstiloMusicalId = 1
GO

INSERT INTO EstilosMusicais VALUES ('Folk')
GO