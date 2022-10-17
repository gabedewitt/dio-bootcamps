# Desafio de Projeto de Análise de Dados com Python e Pandas

![Jupyter Notebook](https://img.shields.io/badge/jupyter-F37626.svg?style=for-the-badge&logo=jupyter&logoColor=white)
![Python](https://img.shields.io/badge/python-3670A0?style=for-the-badge&logo=python&logoColor=ffdd54)
![Kaggle](https://img.shields.io/badge/Kaggle-035a7d?style=for-the-badge&logo=kaggle&logoColor=white)
![Pandas](https://img.shields.io/badge/pandas-%23150458.svg?style=for-the-badge&logo=pandas&logoColor=white)

Repositório contendo o desafio de projeto para exercitar as habilidades desenvolvidas com o estudo da bilioteca Pandas do Python.

O dataset está disponível no [kaggle](https://www.kaggle.com/datasets/martj42/international-football-results-from-1872-to-2017) e consiste no resultado de 43170 partidas internacionais do futebol masculino, desde a primeira partida oficial em 1872 até 2022. As partidas variam desde eventos como a Copa do Mundo FIFA até a Copa do Mundo FIFI e amistosos entre seleções. Além disso a base de dados não inclui partidas dos jogos olímpicos ou partidas onde qualquer uma das seleções jogou com time reserva, ou seleção sub 23 ou contra clube de futebol.

O arquivo results.csv inclui as seguintes colunas:

* date - data da partida
* home_team - nome do time da casa
* away_team - nome do time visitante
* home_score - número de gols marcados pelo time da casa, incluindo acréscimos, sem incluir disputas de pênaltis
* away_score - número de gols marcados pelo time visitante, incluindo acréscimos, sem incluir disputas de pênaltis
* tournament - o nome do torneio
* city - o nome da cidade onde a partida foi disputada
* country -  o nome do país onde a partida foi disputada
* neutral - booleano indicando se a partida foi realizada em campo neutro

O arquivo shootouts.csv inclui as seguintes colunas:

* date - data da partida
* home_team - nome do time da casa
* away_team - nome do time visitante
* winner - o vencedor da disputa de pênaltis
