use ecommerce_refinado;

insert into Clientes(Fname,Minit, Lname, CPF_CNPJ, Address)
		values('Maria', 'M', 'Silva', 12345678911, 'rua silva de prata 29, Carangola - Cidade das Flores'),
			  ('Jorge', 'E', 'Lancelotti', 12345888214, 'rua machado de assis 1875, Marabá - Cidade das Águas'),
              ('Roberto', 'C', 'Pereira', 78965412311, 'rua dandara 29, Indaponhangava - Liripólis'),
              ('Leticia', 'S', 'Montes', 23125621456, 'rua francisca gonzaga 1899, Carambolas - Madureira'),
              ('Kevin', 'V', 'Lima', 79985153213213, 'rua antonio conselheiro 1896, Laranjeiras - Cidade do Ferro'),
              ('Lorenço', 'S', 'Médici', 87893545321, 'rua ezio firenzi 779, Palmares - Nova Florença'),
              ('João', 'L', 'Silva', 45632112357, 'rua silva de prata 29, Carangola - Cidade das Flores');
              
insert into produtos (Pname, categoria, avaliação, tamanho, preçoUnitário) values
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
                    (5,'Confirmado','compra pelo aplicativo',0,269.99,1);      

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
					('Móveis Almeida',15932647859123,21556478511),
                    ('Camas Acajueiras',12322154741583,51044123586);
                    
insert into produtoFornecedor(idPfFornecedor, idPfProduto, quantity) values
						(1,4,100),
                        (2,5,125);
                        
-- idVendedor, razaoSocial, nomeFantasia, CPF_CNPJ, localizacao, contato                        
insert into vendedores(razaoSocial, nomeFantasia, CPF_CNPJ, localizacao, contato) values
						('Tech Giants',null,12312345678451,'Santos',01355857974),
                        ('Lanciette Jogos LTDA','Lan Games',00012345678912,'São Paulo',01178912344),
                        ('Mamango Tecnologias',null,55557784575214,'Rio de Janeiro',02177124556);
                    
insert into produtoVendedor(idPVendedor, idPVproduto, prodQuantity) values
					(1,1,25),
                    (2,3,75),
                    (3,6,50);

                    
select * from clientes c, pedidos p, entregas e where c.idCliente = idPedidoCliente and p.idPedido = e.idPedido;                    