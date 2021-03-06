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
      Quando envio todos os dados para o serviço de criação de empréstimo
      Então o serviço retorna o empréstimo:
      | id            | 123         |
      | nome          | Junio       |
      | cpf           | 01234567890 |
      | vl_emprestimo | 1000        |
      | nr_parcelas   | 10          |
      | vl_parcelas   | 100         |


      Cenário: Criar empréstimo acima do valor permitido
      Quando envio todos os dados para o serviço de criação de empréstimo acima do permitido
      Então o serviço retorna "Valor negado"


      Cenário: Consultar empréstimo
      Dado que o client tem um empréstimo criado
      Quando o client consultar o serviço de empréstimo informando o ID do empréstimo
      Então o serviço deve me retornar as informações do empréstimo buscado:
      | id_emprestimo | 123      |
      | status        | Aprovado |

