require 'faraday'
require 'sqlite3'
require 'json'

class IbgeDados

  def initialize=(id, sigla, nome)
    @id = id
    @sigla = sigla
    @nome = nome
   puts "id:'#{id}', sigla:'#{sigla}', nome:'#{nome}'"

  end



  def self.estados_all
    estados = []
    response = Faraday.get('https://servicodados.ibge.gov.br/api/v1/localidades/estados?orderBy=nome') 
    json = JSON.parse(response.body, symbolize_names: true)
    json.map do |dados|
    dados = dados[:id],dados[:sigla],dados[:nome]    
  end 
  end    

  def self.municipios_all
    response = Faraday.get('https://servicodados.ibge.gov.br/api/v1/localidades/municipios?orderBy=nome')
    json = JSON.parse(response.body, symbolize_names: true)
    json.map do |cidades|
    cidades = cidades[:id],cidades[:nome],cidades[:microrregiao][:mesorregiao][:UF][:id]  
  end
  end
  p IbgeDados.municipios_all
end