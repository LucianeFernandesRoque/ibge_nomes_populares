require 'faraday'

describe 'Ibge' do
  context 'show all UFs' do
    it 'get all list  UFs' do

    response = Faraday.get 'https://servicodados.ibge.gov.br/api/v1/localidades/estados?orderBy=nome'

      expect(response.status).to eq(200)
      
    end
  end
end