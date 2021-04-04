# Ibge nomes populares
  Este projeto tem como objetivo realizar uma versão old school do app que IBGE lançou uma aplicação Web
  (https://www.ibge.gov.br/censo2010/apps/nomes), que traz um ranking interativo dos nomes
  mais populares que pode ser organizado em décadas e/ou estados do país. Além disso
  você pode buscar pelo seu nome e entender quão frequente é esse nome em um estado ou
  uma cidade do país.



## Funcionalidades
# Desafio 1
A primeira etapa do desafio consta na criação de uma aplicação Ruby para uso no terminal.
Ao ser executada essa aplicação deve oferecer ao seu usuário as seguintes opções de
consulta:
1. Ranking dos nomes mais comuns em uma determinada Unidade Federativa (UF)
a. Listar todas UFs e obter a sigla da UF que o usuário deseja consultar
b. Exibir o resultado em 3 tabelas:
i.Uma para o ranking geral
ii.Outras duas tabelas separando os resultados para cada sexo
2. Ranking dos nomes mais comuns em uma determinada cidade
a. Obter o nome de uma cidade no terminal
b. Exibir o resultado em 3 tabelas:
i.
Uma para o ranking geral
ii.
Outras duas tabelas separando os resultados para cada sexo
3. Frequência do uso de um nome ao longo dos anos
a. Solicitar um ou mais nomes (separados sempre por vírgula)b. Exibir uma tabela única, onde cada linha representa uma década e cada
coluna representa um dos nomes informados na etapa anterior


## Getting Started

Essas instruções fornecerão uma cópia do projeto instalado e funcionando em sua máquina local para fins de desenvolvimento e teste.

### Pré-requisitos
Máquina com sistema operacional Linux ( ou Windows Subsystem for Linux e similares) com chave SSH configurada, e Ruby 2.7.2.

### Instalação
*  Em seu terminal, digite:
  `$ git@github.com:LucianeFernandesRoque/      ibge_nomes_populares.git`
*  Após clonar, execute:
  `$ bundle install`
*  Execute:
  `$ bin/setup`

## Executando testes
*  Para executar os testes de funcionalidades, execute no terminal: 
  `$ rspec`
*  Para testes de boas práticas e convenções de código, execute no terminal: 
  `$ rubocop`

*  Para testes de REQUEST (API), execute no terminal: 
  `$ rspec ./spec/requests/ibge_dados_spec.rb`
  `$ rspec ./spec/requests/ranking_nomes_spec.rb`
## Dados da api em contrução

### Author
*  Luciane Fernandes Roque
