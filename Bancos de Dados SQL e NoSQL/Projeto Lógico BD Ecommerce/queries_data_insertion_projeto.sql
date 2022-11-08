use ecommerce_refinado;

insert into Clientes(Fname,Minit, Lname, CPF_CNPJ, Address)
		values('Maria', 'M', 'Silva', 12345678911, 'rua silva de prata 29, Carangola - Cidade das Flores'),
			  ('Jorge', 'E', 'Lancelotti', 12345888214, 'rua machado de assis 1875, Marabá - Cidade das Águas'),
              ('Roberto', 'C', 'Pereira', 78965412311, 'rua dandara 29, Indaponhangava - Liripólis'),
              ('Leticia', 'S', 'Montes', 23125621456, 'rua francisca gonzaga 1899, Carambolas - Madureira'),
              ('Kevin', 'V', 'Lima', 79985153213213, 'rua antonio conselheiro 1896, Laranjeiras - Cidade do Ferro'),
              ('Lorenço', 'S', 'Médici', 87893545321, 'rua ezio firenzi 779, Palmares - Nova Florença'),
              ('João', 'L', 'Silva', 45632112357, 'rua silva de prata 29, Carangola - Cidade das Flores');
              
insert into produtos(Pname, categoria, avaliação, tamanho, preçoUnitário) values
					('Fone de ouvido Beats', 'Eletrônicos', '4', default, 1959.90),             
                    ('Box Trilogia O Senhor dos Anéis','Livros','5',default, 89.90),         
                    ('Fone de ouvido Sennheiser', 'Eletrônicos', '4.8', default, 1459),     
                    ('Sofá retrátil', 'Móveis', '3.8', '3x0.57x0.80', 1099),          
                    ('Cama King Size', 'Móveis', '4.1', '2.03x1.93x0.4', 3279.20),             
                    ('Headset Logitech', 'Eletrônicos', '4.5', default, 269.99);

-- idPagamento, tipoPagamento, limiteDisponivel, dataValidade
-- tipoPagamento enum('Boleto', 'Cartão', 'Dois cartões', 'PIX')
insert into pagamentos(tipoPagamento, limiteDisponivel, dataValidade) values
					('Boleto',null,null),
                    ('PIX', null,null),  
                    ('Cartão', 2500, 21/06/2024),
                    ('Dois cartões', 4500, 21/08/2024),
                    ('Cartão', 1000, 13/06/2025),
                    ('Cartão', 3100, 17/02/2023),
                    ('Cartão', 4100, 21/10/2024),
                    ('Cartão', 8250, 08/10/2025);

-- idPCliente, idPPagamento                    
-- Maria id = 1 , boleto = 1
-- Jorge id = 2 , pix = 2
-- Roberto id = 3,  
-- Letícia id = 4
-- Kevin id = 5
-- Lorenço id = 6
-- João id = 7
insert into pagamentoCliente(idPCliente, idPPagamento) values
					(1,2),
                    (1,7),
                    (2,4),
                    (2,1),
                    (3,1),
                    (3,3),
                    (4,2),
                    (4,8),
                    (5,1),
                    (5,2),
                    (6,2),
                    (6,5),
                    (6,6);               
--  idPedido, idPedidoCliente, statusPedido, descricaoPedido, valorFrete, valorTotal, idPagamento    
insert into pedidos (idPedidoCliente, statusPedido, descricaoPedido, valorFrete, valorProdutos, idPagamento) values
					(1,'Confirmado','compra pelo aplicativo',0,539.98,7),
                    (6,default,'compra pelo aplicativo',120,2647.9,5),
                    (3,'Confirmado','compra pelo aplicativo',12,89.9,2),
                    (4,'Confirmado','compra pelo website',180,3279.2,8),
                    (2,default,'compra pelo website',180,3279.20,4),
                    (5,'Confirmado','compra pelo aplicativo',0,269.99,1),
                    (6,default,'compra pelo website',180,3279.20,6);      

-- statusEntrega ENUM('Saiu para entrega', 'Entregue', 'Em processamento')
insert into entregas(idPedido, codRastreio,  statusEntrega) values
					(1,'AN451728331CN','Entregue'),
                    (3,'BC412338121CP','Saiu para entrega'),
                    (4,null, default),
                    (6,'AM456378912VP','Saiu para entrega');

-- idPOproduto, idPOpedido, poQuantidade, poStatus                    
insert into produtoPedido (idPOproduto, idPOpedido, poQuantidade, poStatus) values
					(6,1,2,default),
                    (2,2,1,default),
                    (3,2,1,default),
                    (4,2,1,default),
                    (2,3,1,default),
                    (5,4,1,default),
                    (5,5,1,default),
                    (6,6,1,default);
                    
insert into estoqueProduto(localEstoque, quantidade) values
					('Rio de Janeiro', 1500),
                    ('São Paulo', 200),
                    ('Campinas', 850),
                    ('Belo Horizonte', 140),
                    ('Niterói', 220);
                    
insert into produtoLocal(idLProduto,idLEstoque,localizacao) values
					(2,2,'SP'),
                    (3,5,'RJ'),
                    (1,3,'SP'),
                    (6,4,'MG');    

-- idFornecedor, razaoSocial, CNPJ, contato              
insert into fornecedores(razaoSocial, CNPJ, contato) values
					('Móveis Almeida',15932647859123,21956478511),
                    ('Camas Acajueiras',12322154741583,05144123586),
                    ('Mamango Tecnologias',55557784575214,02177124556);
                    
insert into produtoFornecedor(idPfFornecedor, idPfProduto, quantity) values
						(1,4,100),
                        (2,5,125),
                        (3,3,46);
                        
-- idVendedor, razaoSocial, nomeFantasia, CPF_CNPJ, localizacao, contato                        
insert into vendedores(razaoSocial, nomeFantasia, CPF_CNPJ, localizacao, contato) values
						('Tech Giants',null,12312345678451,'Santos',01355857974),
                        ('Lanciette Jogos LTDA','Lan Games',00012345678912,'São Paulo',01178912344),
                        ('Mamango Tecnologias',null,55557784575214,'Rio de Janeiro',02177124556),
                        ('Camas Acajueiras',null,12322154741583,'Porto Alegre',05144123586);
                    
insert into produtoVendedor(idPVendedor, idPVproduto, prodQuantity) values
					(1,1,25),
                    (2,3,75),
                    (3,6,50);

insert into produtos(Pname, categoria, avaliação, tamanho, preçoUnitário) values
                    ('Amendoim Japonês Mendorato 1,010kg', 'Alimentos', '5.0', default, 20.69),
                    ('Chinelo Top Max, Havaianas', 'Vestimenta', '4.3', default, 26.99),
					('LEGO® Architecture - Londres', 'Brinquedos', '4.7', default, 299.99);

insert into estoqueProduto(localEstoque, quantidade) values
                    ('Ribeirão Preto', 1300),
                    ('Rio de Janeiro', 2000),
                    ('Campinas', 120);

insert into produtoLocal(idLProduto,idLEstoque,localizacao) values
					(7,6,'SP'),
                    (8,7,'RJ'),
                    (9,8,'SP');

insert into pagamentos(tipoPagamento, limiteDisponivel, dataValidade) values
					('Cartão', 7500, 08/08/2026);

insert into pagamentoCliente(idPCliente, idPPagamento) values
					(7,2),
                    (7,9);

insert into pedidos (idPedidoCliente, statusPedido, descricaoPedido, valorFrete, valorProdutos, idPagamento) values
					(4,'Confirmado','compra pelo website',21,299.99,8),
                    (7,default,'compra pelo aplicativo',85,1665.9,9),
                    (1,default,'compra pelo aplicativo',12,80.97,7);
                    
insert into produtoPedido (idPOproduto, idPOpedido, poQuantidade, poStatus) values
					(9,7,1,default),
                    (7,8,10,default),
                    (3,8,1,default),
                    (8,9,3,default);
                    
                    
use ecommerce_refinado; 
-- Contando quantos clientes     
select count(*) as Nro_clientes from clientes;

-- Contando quantos clientes     
select count(*) as Nro_pedidos from pedidos;

-- Observando os clientes com pedidos já processados             
select * from clientes c, pedidos p, entregas e where c.idCliente = idPedidoCliente and p.idPedido = e.idPedido;     

select * from clientes c, pedidos p where c.idCliente = idPedidoCliente;

-- Pedidos associados a clientes
select concat(Fname,' ',Minit,'. ',Lname) as Cliente, idPedido as Nro_pedido, statusPedido as Status_pedido
	from clientes c, pedidos p where c.idCliente = idPedidoCliente order by Nro_pedido;

-- Quantos pedidos por cada cliente
select concat(Fname,' ',Minit,'. ',Lname) as Cliente, count(*) as N_pedidos
	from clientes c, pedidos p where c.idCliente = idPedidoCliente group by Cliente order by N_pedidos desc;

-- Relação fornecedor, produtos e estoques
select f.razaoSocial as Nome_fornecedor, p.Pname as Nome_produto, pF.quantity as estoque
	from fornecedores f, produtoFornecedor pF, produtos p 
    where f.idFornecedor = pf.idPfFornecedor and  p.idProduto = pF.idPfProduto
    order by estoque desc;

-- Relação produtos com estoque interno, localização
select p.Pname as Nome_produto, p.categoria as Categoria,
	concat(eP.localEstoque,'-',pL.localizacao) as Localização, eP.quantidade as Quantidade_estoque
	from produtoLocal pL left join produtos p on pL.idLProduto = p.idProduto 
	join estoqueProduto eP on pL.idLEstoque = eP.idEstoqueProduto
    order by Quantidade_estoque;
    
-- Query para verificar se algum fornecedor também é vendedor
select f.razaoSocial as Razão_social, f.contato as Telefone_contato, v.localizacao as Cidade
	from fornecedores f, vendedores v where f.CNPJ = v.CPF_CNPJ;
    
-- Observando formas de pagamento para cada pedido e somando valor dos produtos e frete 
select idPedido as N_pedido, concat(c.Fname,' ',c.Minit,'. ',c.Lname) as Cliente, pag.tipoPagamento,
	p.valorProdutos as Total_produtos, p.valorFrete as Frete,
    ROUND(p.valorProdutos + p.valorFrete, 2) as Valor_total
	from clientes c, pedidos p, pagamentos pag where c.idCliente = idPedidoCliente 
	and p.idPagamento = pag.idPagamento order by Frete desc;    
    
-- Verificando quais produtos possuem mais de 200 items em estoque
select  p.Pname as Nome_produto, p.categoria as Categoria,
	concat(eP.localEstoque,'-',pL.localizacao) as Localização, eP.quantidade as Quantidade_estoque
    from produtos p left join produtoLocal pL on pL.idLProduto = p.idProduto 
	join estoqueProduto eP on pL.idLEstoque = eP.idEstoqueProduto
    having Quantidade_estoque > 200
    order by Quantidade_estoque desc;    

-- Recuperando os itens	de cada pedido		
select pP.idPOpedido as id_Pedido, concat(c.Fname,' ',c.Minit,'. ',c.Lname) as Cliente, 
		GROUP_CONCAT(' ',prod.Pname) as itens_pedido
			from produtoPedido pP, produtos prod, pedidos p, clientes c
				where pP.idPOproduto = prod.idProduto and p.idPedido = pP.idPOpedido 
				and p.idPedidoCliente = c.idCliente
				group by pP.idPOproduto
                order by id_Pedido;      