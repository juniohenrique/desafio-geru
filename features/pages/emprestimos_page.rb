# Classe para PageObject do endpoint de Emprestimos
class Emprestimos
  include HTTParty
  base_uri 'https://www.urlficticia.com.br/api/v1'

  def initialize(body)
    @options = { body: body }
    @options2 = {}
  end

  def post_user
    @user = self.class.post('/token', @options)
    @token = @user.parsed_response['Token']
  end

  def post_emprestimo
    @emprestimo = self.class.post('/emprestimos', headers: { 'Content-Type' => 'application/jon', 'Authorization' => 'Bearer ' + @token.to_s }, body: @options)
  end

  def get_emprestimo(id)
    self.class.get("/emprestimos/#{id}", headers: { 'Content-Type' => 'application/jon', 'Authorization' => 'Bearer ' + @token.to_s }, body: @options2)
  end
end
