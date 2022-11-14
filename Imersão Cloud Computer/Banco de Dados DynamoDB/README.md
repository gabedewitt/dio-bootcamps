# Criação de banco de dados no DynamoDB
Repositório com comandos para  Amazon DynamoDB

![AWS](https://img.shields.io/badge/AWS-%23FF9900.svg?style=for-the-badge&logo=amazon-aws&logoColor=white)

### Descrição do projeto

Tomando como base as     

### Serviço utilizado
  - Amazon DynamoDB
  - Amazon CLI para execução em linha de comando

### Comandos para execução do experimento:


- Criar uma tabela

```
aws dynamodb create-table \
    --table-name Musicas \
    --attribute-definitions \
        AttributeName=Artista,AttributeType=S \
        AttributeName=TituloMusica,AttributeType=S \
    --key-schema \
        AttributeName=Artista,KeyType=HASH \
        AttributeName=TituloMusica,KeyType=RANGE \
    --provisioned-throughput \
        ReadCapacityUnits=10,WriteCapacityUnits=5
```

- Inserir um item

```
aws dynamodb put-item \
    --table-name Musicas \
    --item file://itemmusic.json \
```

- Inserir múltiplos itens

```
aws dynamodb batch-write-item \
    --request-items file://batchmusic.json
```

- Criar um index global secundário baeado no título do álbum

```
aws dynamodb update-table \
    --table-name Musicas \
    --attribute-definitions AttributeName=TituloAlbum,AttributeType=S \
    --global-secondary-index-updates \
        "[{\"Create\":{\"IndexName\": \"TituloAlbum-index\",\"KeySchema\":[{\"AttributeName\":\"TituloAlbum\",\"KeyType\":\"HASH\"}], \
        \"ProvisionedThroughput\": {\"ReadCapacityUnits\": 10, \"WriteCapacityUnits\": 5      },\"Projection\":{\"ProjectionType\":\"ALL\"}}}]"
```

- Criar um index global secundário baseado no nome do Artista e no título do álbum

```
aws dynamodb update-table \
    --table-name Musicas \
    --attribute-definitions\
        AttributeName=Artista,AttributeType=S \
        AttributeName=TituloAlbum,AttributeType=S \
    --global-secondary-index-updates \
        "[{\"Create\":{\"IndexName\": \"ArtistaTituloAlbum-index\",\"KeySchema\":[{\"AttributeName\":\"Artista\",\"KeyType\":\"HASH\"}, {\"AttributeName\":\"TituloAlbum\",\"KeyType\":\"RANGE\"}], \
        \"ProvisionedThroughput\": {\"ReadCapacityUnits\": 10, \"WriteCapacityUnits\": 5      },\"Projection\":{\"ProjectionType\":\"ALL\"}}}]"
```

- Criar um index global secundário baseado no título da música e no ano

```
aws dynamodb update-table \
    --table-name Musicas \
    --attribute-definitions\
        AttributeName=TituloMusica,AttributeType=S \
        AttributeName=AnoMusica,AttributeType=S \
    --global-secondary-index-updates \
        "[{\"Create\":{\"IndexName\": \"TituloMusicaAno-index\",\"KeySchema\":[{\"AttributeName\":\"TituloMusica\",\"KeyType\":\"HASH\"}, {\"AttributeName\":\"AnoMusica\",\"KeyType\":\"RANGE\"}], \
        \"ProvisionedThroughput\": {\"ReadCapacityUnits\": 10, \"WriteCapacityUnits\": 5      },\"Projection\":{\"ProjectionType\":\"ALL\"}}}]"
```

- Pesquisar item por Artistaa

```
aws dynamodb query \
    --table-name Musicas \
    --key-condition-expression "Artista = :Artista" \
    --expression-attribute-values  '{":Artista":{"S":"Foo Fighters"}}'
```

``` 
aws dynamodb query \
    --table-name Musicas \
    --key-condition-expression "Artista = :Artista" \
    --expression-attribute-values  '{":Artista":{"S":"Guns N' Roses"}}'
```

``` 
aws dynamodb query \
    --table-name Musicas \
    --key-condition-expression "Artista = :Artista" \
    --expression-attribute-values  '{":Artista":{"S":"Queen"}}'
```

``` 
aws dynamodb query \
    --table-name Musicas \
    --key-condition-expression "Artista = :Artista" \
    --expression-attribute-values  '{":Artista":{"S":"Michael Jackson"}}'     
```

- Pesquisar item por Artistaa e título da música

```
aws dynamodb query \
    --table-name Musicas \
    --key-condition-expression "Artista = :Artista and TituloMusica = :title" \
    --expression-attribute-values file://keyconditions.json
```

- Pesquisa pelo index secundário baseado no título do álbum

```
aws dynamodb query \
    --table-name Musicas \
    --index-name TituloAlbum-index \
    --key-condition-expression "TituloAlbum = :name" \
    --expression-attribute-values  '{":name":{"S":"Appetite For Destruction"}}'
```

```
aws dynamodb query \
    --table-name Musicas \
    --index-name TituloAlbum-index \
    --key-condition-expression "TituloAlbum = :name" \
    --expression-attribute-values  '{":name":{"S":"Jazz"}}'
```

```
aws dynamodb query \
    --table-name Musicas \
    --index-name TituloAlbum-index \
    --key-condition-expression "TituloAlbum = :name" \
    --expression-attribute-values  '{":name":{"S":"Elephant"}}'
```

- Pesquisa pelo index secundário baseado no nome do artista e no título do álbum

```
aws dynamodb query \
    --table-name Musicas \
    --index-name ArtistaTituloAlbum-index \
    --key-condition-expression "Artista = :v_Artista and TituloAlbum = :v_title" \
    --expression-attribute-values  '{":v_Artista":{"S":"Guns N' Roses"},":v_title":{"S":"Appetite For Destruction"} }'
```

```
aws dynamodb query \
    --table-name Musicas \
    --index-name ArtistaTituloAlbum-index \
    --key-condition-expression "Artista = :v_Artista and TituloAlbum = :v_title" \
    --expression-attribute-values  '{":v_Artista":{"S":"Foo Fighters"},":v_title":{"S":"Echoes, Silence, Patience & Grace"} }'
```

```
aws dynamodb query \
    --table-name Musicas \
    --index-name ArtistaTituloAlbum-index \
    --key-condition-expression "Artista = :v_Artista and TituloAlbum = :v_title" \
    --expression-attribute-values  '{":v_Artista":{"S":"Michael Jackson"},":v_title":{"S":"Thriller"} }'
```

- Pesquisa pelo index secundário baseado no título da música e no ano

```
aws dynamodb query \
    --table-name Musicas \
    --index-name TituloMusicaAno-index \
    --key-condition-expression "TituloMusica = :v_song and AnoMusica = :v_year" \
    --expression-attribute-values  '{":v_song":{"S":"Everlong"},":v_year":{"S":"1997"} }'
```

```
aws dynamodb query \
    --table-name Musicas \
    --index-name TituloMusicaAno-index \
    --key-condition-expression "TituloMusica = :v_song and AnoMusica = :v_year" \
    --expression-attribute-values  '{":v_song":{"S":"Seven Nation Army"},":v_year":{"S":"2003"} }'
```

```
aws dynamodb query \
    --table-name Musicas \
    --index-name TituloMusicaAno-index \
    --key-condition-expression "TituloMusica = :v_song and AnoMusica = :v_year" \
    --expression-attribute-values  '{":v_song":{"S":"Don't Stop Me Now"},":v_year":{"S":"1978"} }'
```
