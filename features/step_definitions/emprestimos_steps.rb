Dado('que o client todos os dados necessários para acesso do empréstimo:') do |table|
  @dados = table.rows_hash
  @login = {
    'username': @dados[:username],
    'password': @dados[:password]
  }
  @user = Emprestimos.new(@login)
end

Dado('possue um token válido para se comunicar com o serviço') do
  @user.post_user
end

Quando('envio todos os dados para o serviço de criação de empréstimo acima do permitido') do
  @emprestimo_falha = {
    'vl_emprestimo': '2000',
    'nr_parcelas': '10'
  }

  @response_falho = Emprestimos.new(@emprestimo_falha)
  @negado = @response_falho.post_emprestimo
end

Então('o serviço retorna {string}') do |mensagem|
  expect(@negado.parsed_response['mensagem']).to eq(mensagem)
end

Então("o serviço retorna o empréstimo:") do |table|
  @esperado = table.rows_hash
  puts @response_sucesso
  exp_id = @response_sucesso.parsed_response['id'].to_s
  expect(exp_id).to eq(@esperado[:id])
  expect(@response_sucesso.parsed_response['nome']).to eq(@esperado[:nome])
  expect(@response_sucesso.parsed_response['cpf']).to eq(@esperado[:cpf])
  expect(@response_sucesso.parsed_response['vl_emprestimo']).to eq(@esperado[:vl_emprestimo])
  expect(@response_sucesso.parsed_response['nr_parcelas']).to eq(@esperado[:nr_parcelas])
  expect(@response_sucesso.parsed_response['vl_parcelas']).to eq(@esperado[:vl_parcelas])
  puts @response_sucesso
end

Dado('que o client tem um empréstimo criado') do
  steps %{
    Quando envio todos os dados para o serviço de criação de empréstimo
  }
  @id = @response_sucesso.parsed_response['id']
end

Quando('o client consultar o serviço de empréstimo informando o ID do empréstimo') do
  @result = @sucesso.get_emprestimo(@id)
end

Então('o serviço deve me retornar as informações do empréstimo buscado:') do |table|
  @retorno_get = table.rows_hash
  exp_id_emprestimo = @result.parsed_response['idEmprestimo'].to_s
  exp_status = @result.parsed_response['status']
  expect(exp_id_emprestimo).to eq(@retorno_get[:id_emprestimo])
  expect(exp_status).to eq(@retorno_get[:status])
end

Quando('envio todos os dados para o serviço de criação de empréstimo') do
  @emprestimo_sucesso = {
    'vl_emprestimo': '1000',
    'nr_parcelas': '10'
  }
  @sucesso = Emprestimos.new(@emprestimo_sucesso)
  @response_sucesso = @sucesso.post_emprestimo
end
