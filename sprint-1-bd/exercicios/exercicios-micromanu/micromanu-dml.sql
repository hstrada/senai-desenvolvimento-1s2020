use MicroManu;

insert into Clientes(nome) values ('Helena'),('Erik'),('Cesar');
select * from Clientes;

insert into Itens(Descricao) values ('Computador'),('Notebook'),('Celular'),('Video game'),('Televisão');
select * from Itens;

insert into TipoConsertos(Descricao) values ('Manutenção'),('Limpeza');
select * from TipoConsertos;


insert into [dbo].[Colaboradores]
           ([Nome]
           ,[CPF]
           ,[Salario])
     values
           ('Jucelino'
           ,'12345678900'
           ,1000.00);

insert into [dbo].[Colaboradores]
           ([Nome]
           ,[CPF]
           ,[Salario])
     values
           ('Cassyana'
           ,'12345678901'
           ,2000.99);
select * from Colaboradores;

INSERT INTO [dbo].[Pedidos]
           ([NumeroEquipamento]
           ,[Entrada]
           ,[IdCliente]
           ,[IdItem]
           ,[IdTipo])
     VALUES
           ('123','20-07-2019 10:34:09 am',1,1 ,1);

select * from Pedidos;

INSERT INTO [dbo].[PedidosColaboradores]
           ([IdPedido]
           ,[IdColaborador])
     VALUES
           (2,1),(2,2);
select * from PedidosColaboradores;


update Colaboradores set Salario = 2000.00 where IdColaborador = 2
select * from Colaboradores;