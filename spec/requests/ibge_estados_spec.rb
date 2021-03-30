require 'faraday'
require 'ibge_dados'
require 'json'


describe 'Ibge' do
  context 'status ok' do
    it 'when making the http request' do

    response = Faraday.get 'https://servicodados.ibge.gov.br/api/v1/localidades/estados?orderBy=nome'

    expect(response.status).to eq(200)
    expect(response.status).not_to eq(404)
  end
  end
  context 'return states 27' do
    it 'when making the http request body.legth' do

    response = Faraday.get 'https://servicodados.ibge.gov.br/api/v1/localidades/estados?orderBy=nome'

    expect(response.body.estados_all.length).to eq(27)
    end
    end
  end