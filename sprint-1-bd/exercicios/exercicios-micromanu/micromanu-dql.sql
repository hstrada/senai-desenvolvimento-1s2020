use MicroManu

select Clientes.Nome, Pedidos.NumeroEquipamento 
	from Clientes 
	join Pedidos
	on Clientes.IdCliente = Pedidos.IdCliente;

select Pedidos.IdPedido, Pedidos.NumeroEquipamento, PedidosColaboradores.IdColaborador
	from Pedidos 
	join PedidosColaboradores
	on Pedidos.IdPedido = PedidosColaboradores.IdPedido;