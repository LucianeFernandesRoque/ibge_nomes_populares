require 'terminal-table'
require_relative 'ibge_dados'
require 'faraday'
require 'sqlite3'
require 'json'

class RankingNomes
  attr_accessor  :regiao, :sexo, :nome, :frequencia, :ranking

  def initialize(localidade,sexo,nome,frequencia,ranking)
    @localidade = localidade
    @sexo = sexo
    @nome = nome
    @frequencia = frequencia
    @ranking = ranking
    @id = id
  end
  
  def self.nomes_all
    response = Faraday.get('https://servicodados.ibge.gov.br/api/v2/censos/nomes/ranking?localidade=')
    print 'Digite o id da localidade?'
    id = gets.chomp
    response = Faraday.get("https://servicodados.ibge.gov.br/api/v2/censos/nomes/ranking?localidade=#{id}") 
    json = JSON.parse(response.body, symbolize_names: true)
    json.map do |nomes|
    nomes = nomes[:localidade],nomes[:res]
    end
  end

  def self.tables_nomes_all
    rows = []
    table = Terminal::Table.new :title => "Ranking por UF", :headings => ['Nome', 'Frequencia', 'Ranking'], :rows => nomes_all
  end


end