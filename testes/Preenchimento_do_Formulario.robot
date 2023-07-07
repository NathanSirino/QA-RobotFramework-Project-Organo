*** Settings ***
Resource    ../resources/main.robot
Test Setup       Dado que eu acesse o Organo
Test Teardown    Fechar o navegador

*** Test Cases ***
Criar um Card de funcionario

    Dado que preencha os campos do form
    Quando cliar no botao criar Card
    Entao identificar o card no time esperado

Criar mais de um card usando "For"
    Dado que preencha os campos do form
    Quando cliar no botao criar Card
    Entao identificar 3 cards no time esperado

Criar Cards para cada time
    Dado que preencha os campos do form
    Entao Criar e identificar 1 cards em cada time

