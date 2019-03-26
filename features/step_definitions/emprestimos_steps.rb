Dado("que o client todos os dados necessários para acesso do empréstimo:") do |table|
  @login = {
      "username": "string",
      "password": "string"
  }

  @user = Emprestimos.new(@login)
end

Dado("possue um token válido para se comunicar com o serviço") do
  @user.postUser
end

Quando("envio todos os dados para o serviço de criação de empréstimo acima do permitido") do

  @emprestimoFalha = {
      "vl_emprestimo": "2000",
      "nr_parcelas": "10"
  }

  @responseFalho = Emprestimos.new(@emprestimoFalha)
  @teste = @responseFalho.postEmprestimo
  puts @teste
end

Então("o serviço retorna {string}") do |string|
  pending # Write code here that turns the phrase above into concrete actions
end

Então("o serviço retorna o empréstimo") do |string|

end

Dado("que o client tem um empréstimo criado") do
  pending # Write code here that turns the phrase above into concrete actions
end

Quando("o client consultar o serviço de empréstimo informando o ID do empréstimo") do
  pending # Write code here that turns the phrase above into concrete actions
end

Então("o serviço deve me retornar as informações do empréstimo criado") do
  pending # Write code here that turns the phrase above into concrete actions
end

Quando("envio todos os dados com o para o serviço de criação de empréstimo") do
  @emprestimoSucesso = {
      "vl_emprestimo": "1000",
      "nr_parcelas": "10"
  }

  @sucesso = Emprestimos.new(@emprestimoSucesso)
  @responseSucesso = @sucesso.postEmprestimo
  puts @responseSucesso
end