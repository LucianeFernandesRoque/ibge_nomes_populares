require 'faraday'
require_relative 'ibge_dados'
require 'json'

response = Faraday.get('https://servicodados.ibge.gov.br/api/v1/localidades/estados?orderBy=nome')
q = 'id'
 

puts response.body