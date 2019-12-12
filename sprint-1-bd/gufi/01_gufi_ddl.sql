--USE master
--GO
--DROP DATABASE Gufi
--GO

CREATE DATABASE Gufi
GO

USE Gufi
GO

CREATE TABLE TiposUsuarios 
(
	TipoUsuarioId		INT PRIMARY KEY IDENTITY
	,Descricao			VARCHAR(30) UNIQUE NOT NULL
)
GO

CREATE TABLE Usuarios 
(
	UsuarioId		INT PRIMARY KEY IDENTITY
	,Nome			VARCHAR(200) NOT NULL
	,Email			VARCHAR(255) NOT NULL UNIQUE
	,Senha			VARCHAR(255) NOT NULL
	,TipoUsuarioId	INT NOT NULL FOREIGN KEY REFERENCES TiposUsuarios (TipoUsuarioId)
)
GO

CREATE TABLE Categorias 
(
	CategoriaId		INT PRIMARY KEY IDENTITY
	,NomeCategoria	VARCHAR(200) NOT NULL UNIQUE
)
GO

CREATE TABLE Estabelecimentos 
(
	EstabelecimentoId	INT PRIMARY KEY IDENTITY
	,Nome				VARCHAR(200)
	,Ativo				BIT DEFAULT(1) NOT NULL
	,AcessoCadeirante	BIT DEFAULT(1) NOT NULL
	,AssentosGrandes	BIT DEFAULT(1) NOT NULL
	,Endereco			TEXT
	,CategoriaId		INT NOT NULL FOREIGN KEY REFERENCES Categorias (CategoriaId)
)
GO

CREATE TABLE Favoritos 
(
	UsuarioId			INT NOT NULL FOREIGN KEY REFERENCES Usuarios (UsuarioId)
	,EstabelecimentoId	INT NOT NULL FOREIGN KEY REFERENCES Estabelecimentos (EstabelecimentoId)
)
GO