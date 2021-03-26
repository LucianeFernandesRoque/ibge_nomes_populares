require 'faraday'
class IbgeDados
  attr_accessor  :id, :sigla , :nome

  def initialize
    @id = id
    @sigla = sigla
    @nome = nome

  end

  def ibg_estado
      {
      id: @id,
      sigla: @sigla,
      nome: @nome
      
      }

  end



  
  def estados(ibg_estado)
    p response = Faraday.get('https://servicodados.ibge.gov.br/api/v1/localidades/estados?orderBy=nome')
    response = json.map do |item|
    ibg_estado << response.new(item[:id], item[:sigla], item[:nome])

  p 

  end


  end
 

end


