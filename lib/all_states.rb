context 'Faraday'
class AllStates
  attr_accessor :id, :nome

  def initialize(id:, nome:)
    @id = id
    @nome = nome

  end

  def self.all()
    response = Faraday.get('https://servicodados.ibge.gov.br/api/v1/localidades/estados/{UF}/municipios')

    json = JSON.parse( response.body, symbolize_names: true )
    result = json.map do |item|
      item = new(item[:id], item[])
    end
    result
  end
end