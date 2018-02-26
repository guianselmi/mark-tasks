#language:pt

Funcionalidade: Login
    Para que somente eu possa ver as minhas tarefas
    Sendo um usuário
    Posso logar no sistema com meus dados de acesso previamente cadastrados
    
    @login @logout
    Cenario: Login do usuário

        Quando faco login com "anselmo@opa.eu" e "123456"
        Entao sou autenticado com sucesso
        E vejo o meu painel de atividades
    
    @login_exp
    Esquema do Cenario: Tentativa de Login

        Quando faco login com "<email>" e "<senha>"
        Entao devo ver a mensagem "<alerta>"

        Exemplos:
            | email              | senha       | alerta                     |
            | anselmo@opa.eu     | abc123      | Senha inválida.            |
            | chulapa@hu3mail.eu | 123456      | Usuário não cadastrado.    |
            | anselmo@opa.eu     |             | Senha ausente.             |
            |                    | 123456      | Email incorreto ou ausente.|