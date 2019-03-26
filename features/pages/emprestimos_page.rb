class Emprestimos
  include HTTParty
  base_uri "https://emprestimo-api.getsandbox.com/api/v1"

  def initialize(body)
    @options = {:body => body}
    @options2 ={}
  end

  def postUser
    @user = self.class.post("/token", @options)
    @token = @user.parsed_response['Token']
  end

  def postEmprestimo
    @emprestimo = self.class.post("/emprestimos", headers: {"Authorization" => "Bearer " + @token.to_s}, body: @options)
  end

  def getEmprestimo (id)
    self.class.get("/emprestimos/#{id}", @options2)
  end

end