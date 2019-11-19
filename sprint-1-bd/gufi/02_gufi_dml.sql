USE Gufi
GO

INSERT INTO Categorias VALUES ('Categoria A')
GO

INSERT INTO Categorias (Nome) VALUES ('Categoria B')
GO

INSERT INTO Categorias VALUES ('Categoria C'), ('Categoria D')
GO

-- Inserir tipos de usuarios Administrador e Aluno
INSERT INTO TiposUsuarios VALUES ('Administrador'), ('Aluno')
GO

INSERT INTO Usuarios (Email, Senha, Nome, TipoUsuarioId) VALUES ('admin@admin.com', '123456', 'Administrador', 1)
GO

INSERT INTO Usuarios (Email, Senha, Nome, TipoUsuarioId) VALUES ('aluno@email.com', '123456', 'Aluno A', 2)
GO

INSERT INTO Usuarios (Email, Senha, Nome, TipoUsuarioId) VALUES ('catarina@email.com', '123456', 'Catarina', 1)
GO