*** Settings ***
Library          SeleniumLibrary
Resource         Setup_teardown.robot
Test Setup       Dado que eu acesse o Organo
Test Teardown    Fechar o navegador

*** Variables ***
${Botao_Criar_Card}    id=form-botao

*** Test Cases ***
Verificar se quando um campo obrigatorio nao esta preenchido corretamentamente 
    Dado que eu clique no botao criar card
    Entao sistema deve apresentar mensagem de campo obrigatorio

*** Keywords ***
Dado que eu clique no botao criar card
    Click Element    ${Botao_Criar_Card}
Entao sistema deve apresentar mensagem de campo obrigatorio
    Element Should Be Visible    id:form-nome-erro
    Element Should Be Visible    id:form-cargo-erro
    Element Should Be Visible    id:form-times-erro
