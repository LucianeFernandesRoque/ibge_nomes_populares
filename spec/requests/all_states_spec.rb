require  'all_states'

describe AllStates do
  context 'show all UFs' do
    it 'get all list  UFs' do
    url = 'https://servicodados.ibge.gov.br/api/v1/localidades/distritos?orderBy=nome'
      #AllStates.all() => [{id: 1, state: 'sao paulo'}]
    response = double('Faraday_response', body: "{}", status: 200)
    allow(Faraday).to receive(:get).with(url).and_return(response)

    result = AllStates.all
    
    expect(result.length).to eq 35
      
    end
  end
end