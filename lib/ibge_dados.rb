require 'rest-client'
require 'json'

url = 'https://servicodados.ibge.gov.br/api/v1/localidades/distritos?orderBy=nome'

resp = RestClient.get "#{url}"

puts resp.code

puts resp.body