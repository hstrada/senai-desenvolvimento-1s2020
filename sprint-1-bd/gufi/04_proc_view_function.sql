USE Gufi
GO

-----------------------==-----------------------

-- VIEWS
-- nao ha parametro de entrada e nem de saida

CREATE VIEW vwEstabelecimentos AS 
SELECT E.EstabelecimentoId, E.Nome, C.CategoriaId, C.NomeCategoria
FROM Estabelecimentos AS E
INNER JOIN Categorias AS C
ON E.CategoriaId = C.CategoriaId
GO

SELECT * FROM vwEstabelecimentos
GO

CREATE VIEW vwUsuarios AS
SELECT U.UsuarioId, U.Nome, U.Email, TU.TipoUsuarioId, TU.Descricao
FROM Usuarios U
INNER JOIN TiposUsuarios TU
ON U.TipoUsuarioId = TU.TipoUsuarioId
GO

SELECT * FROM vwUsuarios
GO

-----------------------==-----------------------

-- as fun��es cada vez que forem executadas, eles "reexecutam"

-- Listar usu�rios sem a senha correspondente
SELECT U.UsuarioId, U.Nome, U.Email FROM Usuarios U
GO

-- apenas select, oferecem um retorno, necessariamente, e n�o utilizam dados que ir�o alterar os estados de qualquer item
CREATE FUNCTION ListarUsuarios
(
)
RETURNS TABLE
AS
RETURN SELECT U.UsuarioId, U.Nome, U.Email FROM Usuarios U
GO

-- select de listar usu�rios sem conhecer sua implementa��o
SELECT * FROM ListarUsuarios()
GO

-----------------------==-----------------------

-- PROCEDURES

--Criar um SP (Stored Procedure)
CREATE PROCEDURE spListarUsuarios -- Nome da procedure
AS
SELECT U.UsuarioId, U.Nome, U.Email FROM Usuarios U
GO

EXEC spListarUsuarios -- Executar Procedure
GO


--Com declara��o de vari�vel
CREATE PROCEDURE spBuscarUsuarioPorEmail
@Email VARCHAR(250)
AS
SELECT U.UsuarioId, U.Nome, U.Email FROM Usuarios U
WHERE U.Email = @Email -- Utilizando vari�vel como filtro para a consulta
GO 

EXEC spBuscarUsuarioPorEmail 'catarina@email.com'
GO

--Com Id
CREATE PROCEDURE spBuscarUsuarioPorId @IdRecebido INT
AS
SELECT U.UsuarioId, U.Nome, U.Email 
FROM Usuarios U 
WHERE U.UsuarioId = @IdRecebido
GO

EXEC spBuscarUsuarioPorId 2

--Deletar Procedure
DROP PROCEDURE spBuscarUsuarioPorId