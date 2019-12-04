USE Gufi
GO

-- selecionar todas as colunas
SELECT CategoriaId, Nome FROM Categorias
GO

-- selecionar somente o nome
SELECT Nome FROM Categorias
GO

-- selecionar todas as colunas sem conhecer o nome
SELECT * FROM Categorias
GO

-- contagem de registros
SELECT COUNT(*) AS QtdCategorias FROM Categorias
GO

-- Selecione os usuarios
SELECT * FROM Usuarios
GO

-- Selecione os tipos de usuarios
SELECT * FROM TiposUsuarios
GO

-- Selecione os produtos
SELECT * FROM Produtos
GO

-- Selecionando os produtos e suas respectivas categorias
SELECT P.*, C.*
FROM Produtos P
INNER JOIN Categorias C
ON P.CategoriaId = C.CategoriaId
GO

-- Selecionar todos os usuários e os tipos de usuários
SELECT U.*, TU.*
FROM Usuarios U
INNER JOIN TiposUsuarios TU
ON U.TipoUsuarioId = TU.TipoUsuarioId
GO