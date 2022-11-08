# Desafio de Projeto - Projeto Lógico de Banco de Dados – Oficina Mecânica
![MySQL](https://img.shields.io/badge/mysql-%2300f.svg?style=for-the-badge&logo=mysql&logoColor=white)

## Descrição do Desafio

No cenário da criação de um banco de dados para uma oficina mecânica ecommerce, foi elaborado um projeto conceitual para a criação de um modelo ER que armazene as informações de clientes, mecânicos, veículos, equipes responsáveis, custos de serviço, peças e das ordens de serviço. 
Seguindo as orientações das aulas me atentei aos relacionamentos e chaves primárias e estrangeiras presentes nas tabelas criadas, de modo a replicar os relacionamentos definidos no modelo relacional extendido.

Assim como demonstrado durante as aulas realizei a criação do Script SQL para criação do esquema do banco de dados que corresponde ao arquivo criacao_tabelas_oficina.sql. 
Posteriormente, realizei a persistência de dados para realização de testes. 
Especifiquei também queries mais complexas dos que apresentadas durante a explicação do desafio, que estão presentes no arquivo queries_data_insertion_projeto_oficina.sql. 

## Objetivo:

O mapeamento para o cenário foi refinado para os pontos:

    Pessoas Físicas – Pode ser tanto cliente quanto mecânico, serve como
    superclasse dessas tabelas  
                      de modo que o tratamento de dados se dá fora do BD;

    Equipe Responsável – Pode ter cadastrado mais de uma forma de pagamento, foi utilizada uma relação N para M 
                para relacionar clientes com pagamentos, visto que é possível ocorrer o uso da mesma forma por outro cliente 
                e de 1 para 1 de forma não vinculante com a tabela pedido, assim cada pedido;

    

Algumas perguntas para nortear as queries SQL após a persistência dos dados foram:

    Quantos mecânicos compõem cada equipe?
    Existe alguma OS atrasada?
    Quais ordem de serviço são mais demoradas?
    Algum mecânico já usou os serviços da oficina?
    Qual carro passou mais vezes na oficina?
    Quais peças mais usadas nas OS's?

O modelo relacional está disponível no arquivo png (Projeto Lógico Oficina.png) dentro do repositório
e exibido logo abaixo:

![Modelo ER](Projeto&#32;Lógico&#32;Oficina.png)
