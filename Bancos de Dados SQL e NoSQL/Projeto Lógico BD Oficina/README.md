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
    superclasse dessas tabelas, reunindo informações comuns a clientes e
    mecânicos como nome, endereço, cpf e contato;

    Equipe Responsável – Pode ter cadastrado mais de uma forma de pagamento,
    foi utilizada uma relação N para M para relacionar equipes com mecânicos,
    visto que é possível que um mecânico integre mais de uma equipe ao mesmo
    tempo;

    Veículo - cada veículo tem seu id presente na ordem de Serviço, visto que
    um mesmo veículo pode demandar reparos diversos pelas equipes da oficina;

    Ordem de serviço - consulta as tabelas de custo de serviço para definir o
    valor da OS, contém status, id da equipe, do veículo e data de início dos
    trabalhos e a previsão de conclusão da OS.                         

    

Algumas perguntas para nortear as queries SQL após a persistência dos dados foram:

    Quantos mecânicos compõem cada equipe?
    Existe alguma OS atrasada?
    Quais Ordens de Serviço levaram mais de 5 dias?
    Algum mecânico já usou os serviços da oficina?
    Quais Ordens de serviço custaram mais de 1000 reais?

O modelo relacional está disponível no arquivo png (Projeto Lógico Oficina.png) dentro do repositório
e exibido logo abaixo:

![Modelo ER](Projeto&#32;Lógico&#32;Oficina.png)
