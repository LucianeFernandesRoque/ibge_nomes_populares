require 'faraday'
require 'sqlite3'
require 'json'
class IbgeDados
    attr_accessor  :id, :municipio , :uf, :nome,:sigla

  def initialize(municipio,nome,sigla)
    @id = id
    @municipio = municipio
    @UF = uf
    @nome = nome
    @sigla = sigla
  

  end

  def self.localidades_all
    response = Faraday.get('https://servicodados.ibge.gov.br/api/v1/localidades/distritos') 
    json = JSON.parse(response.body, symbolize_names: true)
    json.map do |dados|
    puts dados[:id],dados[:nome],dados[:municipio][:microrregiao][:mesorregiao][:UF][:sigla]
    
  end 
     
  end
    self.localidades_all
#{:id=>421985305, :nome=>"Zortéa", :municipio=>{:id=>4219853, :nome=>"Zortéa", :microrregiao=>{:id=>42009, :nome=>"Curitibanos", :mesorregiao=>{:id=>4203, :nome=>"Serrana", :UF=>{:id=>42, :sigla=>"SC", :nome=>"Santa Catarina", :regiao=>{:id=>4, :sigla=>"S", :nome=>"Sul"}}}}, :"regiao-imediata"=>{:id=>420008, :nome=>"Joaçaba - Herval d'Oeste", :"regiao-intermediaria"=>{:id=>4204, :nome=>"Chapecó", :UF=>{:id=>42, :sigla=>"SC", :nome=>"Santa Catarina", :regiao=>{:id=>4, :sigla=>"S", :nome=>"Sul"}}}}}}


end
#:UF=>{:id=>42, :sigla=>"SC", :nome=>"Santa Catarina", 