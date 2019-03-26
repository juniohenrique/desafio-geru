## Desafio:
O desafio de **Empréstimo** é sobre testes automatizados para api. **Imagine** que você tem uma API com os dados informados abaixo, crie alguns cenários usando Gherkin e crie testes automatizados para essa API usando o BDD criado. 
### Envio do desafio:
Ao finalizar, crie um repositório público no github ou bitbucket e envie o link do repositório para o recrutador (ele irá redirecionar para quem for necessário).
Bom trabalho ;)  
  
## Considerações:
### BDD Para usar na automação
    Funcionalidade: Disponibilizar endpoint para consulta e criação de empréstimo
	    Como interface
	    Gostaria de consultar e criar empréstimos via endpoint
	    Para que possa fazer a interface para o usuário
    Cenário: Criar empréstimo
        Dado que o client possue todos os dados necessários para criação do empréstimo
		    E possue um token válido para se comunicar com o serviço
	    Quando envio todos os dados para o serviço de criação de empréstimo
		Então o serviço deve criar o empréstimo com sucesso
    
    Cenário: Consultar empréstimo
	    Dado que o client tem um empréstimo criado
		    E possue um token válido para se comunicar com o serviço
	   Quando o client consultar o serviço de empréstimo informando o ID do empréstimo
	   Então o serviço deve me retornar as informações do empréstimo criado
###  API descrita abaixo será utilizada no desafio:
 1. Utilizaremos nesse desafio uma API RESTful
 2. A Api de empréstimos não existe. www.urlficticia.com.br/ use os dados da API como guia para sua automação
```
#informações: Gerar token
	Endpoint= www.urlficticia.com.br/api/v1/token
	
	Headers= 
		Content-Type: application/json
	Body =
		username: String
		password: String
	Response =
		Token: b2c6f757eb9d49f4b2dace3aab9b1566

#informações: Criar empréstimo
	Endpoint= www.urlficticia.com.br/api/v1/emprestimos
	
	Headers
		Content-Type: application/json
		Authorization: Bearer <token>
	Body =
		id: Number
		nome: String
		cpf: String
		vl_emprestimo: String
		nr_parcelas: String
		vl_parcelas: String

#informações: Consultar empréstimo
	Endpoint= www.urlficticia.com.br/api/v1/emprestimos/<id>
	Headers=
		Content-Type: application/json
		Authorization: Bearer <token>
	Response
		id-emprestimo: String
		status: String
		
```
 ### Fique a vontade na escolha da tecnologia. 
 ### Fique a vontade para modificar o BDD e criar vários cenários!
 ### Qualquer dúvida estamos a disposição!
