require 'faraday'
require 'terminal-table'
require 'json'
class IbgeDados
attr_accessor :id, :sigla, :nome


  def initialize=(id, sigla, nome)
    @id = id
    @sigla = sigla
    @nome = nome
   puts "id:'#{id}', sigla:'#{sigla}', nome:'#{nome}'"

  end



  def self.estados_all
    response = Faraday.get('https://servicodados.ibge.gov.br/api/v1/localidades/estados?orderBy=nome') 
    json = JSON.parse(response.body, symbolize_names: true)
    json.map do |dados|
    dados = dados[:id],dados[:sigla],dados[:nome]
  end
  end    
    
  def self.tables
    rows = []
    rows = [estados_all[0],estados_all[1],estados_all[2],estados_all[3]]
    table = Terminal::Table.new :rows => rows
    table = Terminal::Table.new :title => "Estados", :headings => ['Id', 'Estado', 'UF'], :rows => rows  

  end

  def self.municipios_all
    response = Faraday.get('https://servicodados.ibge.gov.br/api/v1/localidades/municipios?orderBy=nome')
    json = JSON.parse(response.body, symbolize_names: true)
    json.map do |cidades|
    cidades = cidades[:id],cidades[:nome],cidades[:microrregiao][:mesorregiao][:UF][:id]  
  end
  end
end