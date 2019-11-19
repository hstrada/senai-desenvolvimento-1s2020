USE Gufos;

----------------------------- FUNCOES USUARIO -----------------------------

-- as fun��es cada vez que forem executadas, eles "reexecutam"

-- Listar usu�rios sem a senha correspondente
SELECT IdUsuario, Nome, Email, Permissao FROM Usuarios;

-- apenas select, oferecem um retorno, necessariamente, e n�o utilizam dados que ir�o alterar os estados de qualquer item
CREATE FUNCTION ListarUsuarios
(
)
RETURNS TABLE
AS
RETURN SELECT IdUsuario, Nome, Email, Permissao FROM Usuarios

-- select de listar usu�rios sem conhecer sua implementa��o
SELECT * FROM ListarUsuarios();


----------------------------- FUNCOES NATIVAS -----------------------------

SELECT COUNT(*) FROM Categorias;
SELECT COUNT(*) AS QtdCategorias FROM Categorias;

SELECT LEN(NOME) AS QtdCaracteres, Nome
FROM Categorias  
WHERE IdCategoria = 1;

------------------------------------------------------- SUBSTITUI O VALOR DA CADEIA DE CARACTERES ESPECIFICADO POR OUTRO VALOR
SELECT REPLACE('O SENAI � Roxo','Roxo','Vermelho');

------------------------------------------------------REMOVE OS CARACTERES DE ESPA�O OU OUTROS CARACTERES ESPECIFICADOS DO INICIO OU FINAL
SELECT TRIM('    Livro Vol. 1    ') AS Resultado;


----------------------------- STORED PROCEDURES -----------------------------

--Criar um SP (Stored Procedure)
CREATE PROCEDURE SelecionarUsuarios -- Nome da procedure
AS
SELECT IdUsuario, Nome, Email, Permissao FROM Usuarios;

EXEC SelecionarUsuarios; -- Executar Procedure


--Com declara��o de vari�vel
CREATE PROCEDURE BuscarUsuarioPorEmail
@Email VARCHAR(250)
AS
SELECT IdUsuario, Nome, Email, Permissao FROM Usuarios WHERE Email = @Email; -- Utilizando vari�vel como filtro para a consulta

EXEC BuscarUsuarioPorEmail 'admin@admin.com'


--Com Id
CREATE PROCEDURE BuscarPorId @IdRecebido INT
AS
SELECT IdUsuario, Nome, Email, Permissao FROM Usuarios WHERE IdUsuario = @IdRecebido;

EXEC BuscarPorId 2


--Deletar Procedure
DROP PROCEDURE BuscarPorId

----------------------------- VIEWS -----------------------------

-- nao ha parametro de entrada e nem de saida

CREATE VIEW vwEventos AS 
SELECT IdEvento, Titulo FROM Eventos

SELECT * FROM vwEventos WHERE IdEvento = 1 