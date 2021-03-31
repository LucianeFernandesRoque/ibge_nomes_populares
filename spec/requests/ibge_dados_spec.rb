require 'faraday'
require 'ibge_dados'
require 'json'
require 'spec_helper'

  describe 'IbgeDados' do
  context 'validação da Api'do

  it 'fazer uma requisição da ApiEstados e validar o status' do

    response = Faraday.get 'https://servicodados.ibge.gov.br/api/v1/localidades/estados?orderBy=nome'

    expect(response.status).to eq(200)
    expect(response.status).not_to eq(404)
  end
  end
  

  it 'fazer uma requisição da ApiMunicipios e validar o status' do
    response = Faraday.get 'https://servicodados.ibge.gov.br/api/v1/localidades/municipios?orderBy=nome'
      

  expect(response.status).to eq(200)
  expect(response.status).not_to eq(404)
  end


  it 'não pode retornar nulo' do

    response = Faraday.get 'https://servicodados.ibge.gov.br/api/v1/localidades/municipios?orderBy=nome'
  
  expect(response.body).not_to be_nil
  end

end

    
  