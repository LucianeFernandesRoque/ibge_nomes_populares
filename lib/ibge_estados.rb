require 'faraday'

response = Faraday.get('https://servicodados.ibge.gov.br/api/v1/localidades/estados?orderBy=nome')
dados = []
dados = response.body
 
p dados
