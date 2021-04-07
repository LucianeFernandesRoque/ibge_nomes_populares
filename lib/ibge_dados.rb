require 'faraday'
require 'terminal-table'
require 'json'

class IbgeDados
  attr_accessor :id, :sigla, :nome

  def initialize=(id, sigla, nome, _id_estado, _municipio)
    @id = id
    @sigla = sigla
    @nome = nome
  end

  def self.estados_all
    response = Faraday.get('https://servicodados.ibge.gov.br/api/v1/localidades/estados?orderBy=nome')
    json = JSON.parse(response.body, symbolize_names: true)
    json.map do |dados|
    dados = dados[:id], dados[:sigla], dados[:nome]
    end
  end

  def self.municipios_all
    response = Faraday.get('https://servicodados.ibge.gov.br/api/v1/localidades/municipios?orderBy=nome')
    json = JSON.parse(response.body, symbolize_names: true)
    json.map do |cidades|
    cidades = cidades[:id], cidades[:nome], cidades[:microrregiao][:mesorregiao][:UF][:id]
    end
  end
        puts IbgeDados.municipios_all


  def self.tables_estado
    rows = []
    # table = Terminal::Table.new :rows => rows
    table = Terminal::Table.new title: 'Estados', headings: %w[Id Estado UF], rows: estados_all
  end

  def self.tables_municipios_all
    rows = []
    # table = Terminal::Table.new :rows => rows
    table = Terminal::Table.new title: 'Cidades', headings: %w[Id Cidade Digito_uf], rows: municipios_all
  end
end
