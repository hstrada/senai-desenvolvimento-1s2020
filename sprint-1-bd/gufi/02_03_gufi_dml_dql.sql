--USE master
--GO

USE Gufi
GO


-- Tipos de Usuários
INSERT INTO TiposUsuarios 
VALUES 
('Administrador')
GO

INSERT INTO TiposUsuarios
VALUES 
('Comum')
GO

SELECT TipoUsuarioId, Descricao
FROM TiposUsuarios
GO

-- Categorias

INSERT INTO Categorias
VALUES 
('Bar')
,('Cafeteria')
,('Balada')
,('Padaria')
,('Restaurante')
GO

SELECT CategoriaId, NomeCategoria
FROM Categorias
GO

SELECT CategoriaId, NomeCategoria
FROM Categorias
ORDER BY CategoriaId
GO

SELECT * FROM Categorias
GO

-- Usuarios
INSERT INTO Usuarios
(Nome, Email, Senha, TipoUsuarioId)
VALUES 
('Administrador', 'admin@email.com', 123456, 1)
,('Catarina', 'catarina@email.com', 123456, 1)
,('Comum', 'comum@email.com', 123456, 1)
GO

SELECT * FROM Usuarios
GO

-- Estabelecimentos
INSERT INTO Estabelecimentos
(Nome, Ativo, AcessoCadeirante, AssentosGrandes, Endereco, CategoriaId)
VALUES 
('Padaria A', 1, 1, 1, 'Alameda Barão de Limeira, 539 - Santa Cecília',4)
GO

SELECT * FROM Estabelecimentos
GO

INSERT INTO Estabelecimentos
(Nome, Endereco, CategoriaId)
VALUES 
('Bar A', 'Alameda Barão de Limeira, 539 - Santa Cecília',3)
GO

SELECT * FROM Estabelecimentos
GO

-- Favoritos
INSERT INTO Favoritos
(UsuarioId, EstabelecimentoId)
VALUES
(3, 1)
GO

SELECT * FROM Favoritos
GO

-- FILTROS
SELECT *
FROM Estabelecimentos
WHERE CategoriaId = 3
GO

SELECT * FROM Estabelecimentos
WHERE EstabelecimentoId = 1
GO

SELECT * FROM Estabelecimentos
WHERE Nome = 'Padaria A'
GO

SELECT * FROM Estabelecimentos
WHERE Nome LIKE '%A'
GO

SELECT * FROM Estabelecimentos
WHERE Nome LIKE 'B%'
GO

SELECT * FROM Estabelecimentos
WHERE Nome LIKE '%d%'
GO

-- FUNCOES
SELECT COUNT(*) FROM Estabelecimentos
GO

SELECT UPPER(Nome) AS NomeGigante
FROM Estabelecimentos
GO

SELECT REVERSE(Nome) AS NomeGigante
FROM Estabelecimentos
GO

SELECT REPLACE(Nome, 'a', 'b') AS NomeGigante
FROM Estabelecimentos
GO

-- ALIAS
SELECT E.*
FROM Estabelecimentos AS E
GO

SELECT E.*
FROM Estabelecimentos E
GO

-- JUNCOES
SELECT E.*
FROM Estabelecimentos AS E
GO

SELECT E.*, C.*
FROM Estabelecimentos AS E
INNER JOIN Categorias AS C
ON E.CategoriaId = C.CategoriaId
GO

SELECT U.*, TU.*
FROM Usuarios U
INNER JOIN TiposUsuarios TU
ON U.TipoUsuarioId = TU.TipoUsuarioId
GO