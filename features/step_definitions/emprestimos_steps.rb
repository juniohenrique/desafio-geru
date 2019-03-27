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
  @negado = @responseFalho.postEmprestimo
  
end

Então("o serviço retorna {string}") do |mensagem|
  expect(@negado.parsed_response['mensagem']).to eq(mensagem)
end

Então("o serviço retorna o empréstimo") do
  expect(@responseSucesso.parsed_response['id']).to eq(123)
end

Dado("que o client tem um empréstimo criado") do
  steps %Q{Quando envio todos os dados com o para o serviço de criação de empréstimo
  }
  @id = (@responseSucesso.parsed_response['id'])
  puts @id
end

Quando("o client consultar o serviço de empréstimo informando o ID do empréstimo") do
  @result = @sucesso.getEmprestimo(@id)
  puts @result
end

Então("o serviço deve me retornar as informações do empréstimo criado:") do
  expect(@result.parsed_response[id-emprestimo]).to eq(id)
  expect(@result.parsed_response[status]).to eq(status)  
end

Quando("envio todos os dados com o para o serviço de criação de empréstimo") do
  @emprestimoSucesso = {
      "vl_emprestimo": "1000",
      "nr_parcelas": "10"
  }

  @sucesso = Emprestimos.new(@emprestimoSucesso)
  @responseSucesso = @sucesso.postEmprestimo
end