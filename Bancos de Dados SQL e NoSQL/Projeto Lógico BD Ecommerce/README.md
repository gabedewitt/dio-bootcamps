# Desafio de Projeto - Projeto Lógico de Banco de Dados – E-COMMERCE
![MySQL](https://img.shields.io/badge/mysql-%2300f.svg?style=for-the-badge&logo=mysql&logoColor=white)
Descrição do Desafio

No cenário da criação de um banco de dados para um ecommerce, foi elaborado um projeto conceitual para a criação de um modelo ER que armazene as informações de clientes, pedidos, fornecedores externos, estoques internos, vendedores terceiros, entrega e produtos. 
Seguindo as orientações das aulas me atentei aos relacionamentos e chaves primárias e estrangeiras presentes nas tabelas criadas, de modo a replicar os relacionamentos definidos no modelo relacional extendido.

Assim como demonstrado durante as aulas realizei a criação do Script SQL para criação do esquema do banco de dados que corresponde ao arquivo criacao tabelas.sql. 
Posteriormente, realizei a persistência de dados para realização de testes. 
Especifiquei também queries mais complexas dos que apresentadas durante a explicação do desafio, que estão presentes no arquivo queries_data_insertion_projeto.sql. 

Objetivo:

O mapeamento para o cenário foi refinado para os pontos:

    Cliente PJ e PF – Uma conta pode ser PJ ou PF, mas não pode ter as duas informações,
                      foi utilizado um varchar de tamanho 14 para armazenar as informações, 
                      de modo que o tratamento de dados se dá fora do BD;

    Pagamento – Pode ter cadastrado mais de uma forma de pagamento, foi utilizada uma relação N para M 
                para relacionar clientes com pagamentos, visto que é possível ocorrer o uso da mesma forma por outro cliente 
                e de 1 para 1 de forma não vinculante com a tabela pedido, assim cada pedido;

    Entrega – Possui status e código de rastreio e é associada a pedido numa relação de 1 para 1;

Algumas perguntas para nortear as queries SQL após a persistência dos dados foram:

    Quantos pedidos foram feitos por cada cliente?
    Algum vendedor também é fornecedor?
    Relação de produtos fornecedores e estoques;
    Relação de nomes dos fornecedores e nomes dos produtos;
    Quais itens cada produto registrou?
    Quais produtos possuem mais de 200 itens em estoque?
    Qual forma de pagamento e valor total de cada pedido?

O modelo relacional está disponível no arquivo png (Projeto Lógico E-commerce.png) dentro do repositório

![Modelo ER](Projeto&#32;Lógico&#32;E-commerce.png)
