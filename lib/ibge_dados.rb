require 'faraday'
require 'sqlite3'
require 'json'
class IbgeDados
    attr_accessor  :id, :sigla , :nome


  def self.estados_all
    response = Faraday.get('https://servicodados.ibge.gov.br/api/v1/localidades/estados?orderBy=nome') 
    json = JSON.parse(response.body, symbolize_names: true)
    json.map do |dados|
    dados = dados[:id],dados[:sigla],dados[:nome]
  end 
  end
     p estados_all.length

  def self.municipios_all
    response = Faraday.get('https://servicodados.ibge.gov.br/api/v1/localidades/municipios?orderBy=nome')
    json = JSON.parse(response.body, symbolize_names: true)
    json.map do |cidades|
    cidades = cidades[:id],cidades[:nome],cidades[:microrregiao][:mesorregiao][:UF][:id]  
  end
  end
 end