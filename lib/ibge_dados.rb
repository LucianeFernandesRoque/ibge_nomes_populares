require 'faraday'
require 'terminal-table'
require 'json'
class IbgeDados
attr_accessor :id, :sigla, :nome


  def initialize=(id, sigla, nome, id_estado)
    @id = id
    @sigla = sigla
    @nome = nome
    @id_estado = id_estado
   puts 

  end



  def self.estados_all
    response = Faraday.get('https://servicodados.ibge.gov.br/api/v1/localidades/estados?orderBy=nome') 
    json = JSON.parse(response.body, symbolize_names: true)
    json.map do |dados|
    dados = dados[:id],dados[:sigla],dados[:nome]
  end
  end

  def self.tables_estado
    rows = estados_all
    table = Terminal::Table.new :rows => rows
    table = Terminal::Table.new :title => "Estados", :headings => ['Id', 'Estado', 'UF'], :rows => estados_all 
  end
  end
  
  


  def self.municipios_all
    response = Faraday.get('https://servicodados.ibge.gov.br/api/v1/localidades/municipios?orderBy=nome')
    json = JSON.parse(response.body, symbolize_names: true)
    json.map do |cidades|
    cidades = cidades[:id],cidades[:nome],cidades[:microrregiao][:mesorregiao][:UF][:id]  
  end
  end
