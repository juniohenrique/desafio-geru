 #language: pt
 Funcionalidade: Disponibilizar endpoint para consulta e criação de empréstimo
   Como interface
   Gostaria de consultar e criar empréstimos via endpoint
   Para que possa fazer a interface para o usuário

   Contexto:

     Dado que o client todos os dados necessários para acesso do empréstimo:
       | username | "string" |
       | password | "string" |
     E possue um token válido para se comunicar com o serviço

   Cenário: Criar empréstimo
     Quando envio todos os dados com o para o serviço de criação de empréstimo
     Então o serviço retorna o empréstimo


   Cenário: Criar empréstimo acima do valor permitido
     Quando envio todos os dados para o serviço de criação de empréstimo acima do permitido
     Então o serviço retorna "Valor acima do permitido"


   Cenário: Consultar empréstimo
     Dado que o client tem um empréstimo criado
     E possue um token válido para se comunicar com o serviço
     Quando o client consultar o serviço de empréstimo informando o ID do empréstimo
     Então o serviço deve me retornar as informações do empréstimo criado