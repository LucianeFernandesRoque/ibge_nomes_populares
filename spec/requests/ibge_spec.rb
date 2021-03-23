describe 'Ibge' do
  context 'show all UFs' do
    it 'get all list  UFs' do

     Faraday.get 'https://servicodados.ibge.gov.br/api/v1/localidades/distritos?orderBy=nome'
    end
  end
end