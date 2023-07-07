*** Settings ***
Resource    ../resources/main.robot
Test Setup       Dado que eu acesse o Organo
Test Teardown    Fechar o navegador

*** Test Cases ***
Verificar se quando um campo obrigatorio nao esta preenchido corretamentamente 
    Dado que eu clique no botao criar card
    Entao sistema deve apresentar mensagem de campo obrigatorio

