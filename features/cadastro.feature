#language:pt

Funcionalidade: Cadastro
    Sendo um usuario que precisa controlar minhas atividades
    Posso me cadastrar com meus dados pessoais
    Para que possa ter um controle e gerenciamento dessas atividades

    Cenario: Cadastro simples

        Dado que eu acessei a pagina de cadastro
        E possuo os seguintes dados:
            | Nome  | Anselmo        |
            | Email | anselmo@opa.eu |
            | Senha | 123456         |
        Quando faco o cadastro
        Entao sou redirecionado para o painel de tarefas
    
    @doing
    Esquema do Cenario: Tentativa de cadastro

        Dado que eu acessei a pagina de cadastro
        E possuo os seguintes dados:
            | Nome  | <nome>  |
            | Email | <email> |
            | Senha | <senha> |
        Quando faco o cadastro
        Entao devo ver uma mensagem de alerta "<alerta>"

        Exemplos:
            | nome    | email          | senha  | alerta                                      |
            | Anselmo | anselmo@opa.eu |        | Informe uma senha.                          |
            | Anselmo | anselmo@opa.eu | 1      | Sua senha deve ter pelo menos 6 caracteres. |
            | Anselmo | anselmo@opa.eu | 12345  | Sua senha deve ter pelo menos 6 caracteres. |
            | Anselmo |                | 123456 | Email é obrigatório.                        |