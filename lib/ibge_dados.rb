require 'faraday'
require 'terminal-table'
require 'json'
require_relative 'ranking_nomes'

class IbgeDados
  attr_accessor :id, :sigla, :nome

  def initialize=(id, sigla, nome)
    @id = id
    @sigla = sigla
    @nome = nome
  end

  def self.estados_all
    response = Faraday.get('https://servicodados.ibge.gov.br/api/v1/localidades/estados?orderBy=nome')
    json = JSON.parse(response.body, symbolize_names: true)
    json.map do |dados|
      @dados = dados[:id], dados[:sigla], dados[:nome]
    end
  end

  def self.tables_estado
    @rows = []
    @table = Terminal::Table.new rows: @rows
    @table = Terminal::Table.new title: 'Estados', headings: %w[Id Estado UF], rows: estados_all
  end


end
