CREATE DATABASE RoteiroLivros;

USE RoteiroLivros;

CREATE TABLE Generos
(
    IdGenero    INT PRIMARY KEY IDENTITY
    ,Descricao  VARCHAR(200) NOT NULL UNIQUE
);

CREATE TABLE Autores 
(
    IdAutor             INT PRIMARY KEY IDENTITY
    ,Nome               VARCHAR(200)
    ,Email              VARCHAR(255) UNIQUE
    ,Ativo              BIT DEFAULT(1) -- BIT/CHAR
    ,DataNascimento     DATE
);

CREATE TABLE Livros
(
    IdLivro             INT PRIMARY KEY IDENTITY
    ,Descricao          VARCHAR(255) NOT NULL UNIQUE
    ,IdAutor            INT FOREIGN KEY REFERENCES Autores (IdAutor)
    ,IdGenero           INT FOREIGN KEY REFERENCES Generos (IdGenero)
);

--CREATE TABLE LivrosGeneros
--(
--    IdLivro         INT NOT NULL
--    ,IdGenero       INT NOT NULL
--    ,FOREIGN KEY (IdLivro) REFERENCES Livros (IdLivro)
--    ,FOREIGN KEY (IdGenero) REFERENCES Generos (IdGenero)
--);