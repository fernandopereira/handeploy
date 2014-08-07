class Providers::DigitalOceanV2
  include HTTParty
  base_uri 'https://api.digitalocean.com/v2'

  def initialize
    @api_token = 'f27ef5cdeb1679a72b52720ef5d45640c3ef98a33f74ff3cc5d7d01aee9c6eb1'
    @header = {'Authorization' => "Bearer #{@api_token}"}
  end

  def listar_maquinas
    response = self.class.get('/droplets', headers: @header)
    tratar_response(response)
  end

  def listar_regioes
    response = self.class.get('/regions', headers: @header)
    tratar_response(response)
  end

  def listar_dominios
    response = self.class.get('/domains', headers: @header)
    tratar_response(response)
  end

  def listar_imagens
    response = self.class.get('/images', headers: @header)
    tratar_response(response)
  end

private
  
  def tratar_response(response)
    if response.code == 200
      response.parsed_response
    else
      raise ArgumentError, response.parsed_response['error']
    end
  end
end