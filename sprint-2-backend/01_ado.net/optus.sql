CREATE DATABASE Optus20
GO

USE Optus20
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

UPDATE EstilosMusicais SET Nome = 'Rock Alternativo' WHERE EstiloMusicalId = 1
GO

DELETE FROM EstilosMusicais WHERE EstiloMusicalId = 1
GO