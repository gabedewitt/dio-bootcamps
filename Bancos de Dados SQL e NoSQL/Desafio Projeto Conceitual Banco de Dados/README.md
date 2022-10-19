# Desafio de Projeto - Projeto Conceitual de Banco de Dados – E-COMMERCE

![MySQL](https://img.shields.io/badge/mysql-%2300f.svg?style=for-the-badge&logo=mysql&logoColor=white)

Descrição do Desafio: 

Visando aplicar o conhecimento de modelagem de banco de dados, foi apresentada a narrativa de um e-commerce em que produtos são vendidos em uma plataforma online, que possui vendedores terceiros, de modo que cada produto possui um fornecedor apenas e um ou mais produtos farão parte de um pedido. 
O cliente do cenário pode realizar cadastro com CPF ou CNPJ, seu endereço determinará o frete e um mesmo cliente pode fazer mais de um pedido, o qual tem um período de carência para devolução de produto.
Dessa maneira, pedidos são criados por cliente e possuem informação de compra, endereço e status da entrega, são compostos de um ou mais produtos e podem ser cancelados.

O modelo apresentado deverá ser refinado acrescentando os seguintes pontos:

* Cliente PJ e PF – Uma conta pode ser PJ ou PF, mas não pode ter as duas informações;
* Pagamento – Pode ter cadastrado mais de uma forma de pagamento;
* Entrega – Possui status e código de rastreio;

A solução dos pontos para refinamento foi:
* Considerar "Cliente" como uma generalização e adicionar a informação de CPF e CNPJ em subclasses para pessoas físicas e jurídicas;
* Relacionar a informação de pagamento com cliente de modo 1:N, assim 1 cliente pode cadastrar N formas de pagamento;
* Relacionar as informações relativas à entrega aos pedidos de modo 1:1, já que o pedido 

![Projeto Conceitual](E-commerce&#32;refinado.png)