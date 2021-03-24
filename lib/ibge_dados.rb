class IbgeDados:Class
  attr_accessor  :id, :sigla , :nome

  #variaveis da classe
  def initialize(id, sigla, nome )
    @id = id
    @sigla = sigla
    @nome = nome 
  end


  def self.all
    response = Faraday.get('https://servicodados.ibge.gov.br/api/v1/localidades/distritos?orderBy=nome')
    
     result = json.map do |item|
     item = new(item[:id], item[:sigla], item[:nome])
  end
end
end