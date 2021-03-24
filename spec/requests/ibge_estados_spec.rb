require 'faraday'

describe 'Ibge' do
  context 'show all UFs' do
    it 'get all list  UFs' do

    response = Faraday.get 'https://servicodados.ibge.gov.br/api/v1/localidades/distritos?orderBy=nome'

      expect(response).to be_success
    end
  end
end