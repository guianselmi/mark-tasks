#language:pt

Funcionalidade: Login
    Sendo um usuário
    Posso logar no sistema com meus dados de acesso previamente cadastrados
    Para que somente eu possa ver as minhas tarefas
    
    @login
    Cenario: Login do usuário

        Quando faco login com "anselmo@opa.eu" e "123456"
        Entao sou autenticado com sucesso
        E vejo as minhas tarefas
    
    Esquema do Cenario: Tentativa de Login

        Quando faco login com "<email>" e "<senha>"
        Entao devo ver a mensagem "<mensagem>"

        Exemplos:
            | email              | senha       | mensagem                |
            | anselmo@opa.eu     | senhaerrada | Senha inválida.         |
            | chulapa@hu3mail.eu | 123456      | Usuário não cadastrado. |
            | anselmo@opa.eu     |             | Senha ausente.          |
            |                    | 123456      | Email ausente.          |