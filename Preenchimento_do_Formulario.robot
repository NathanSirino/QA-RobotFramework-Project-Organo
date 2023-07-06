*** Settings ***
Library          SeleniumLibrary
Resource         Setup_teardown.robot
Test Setup       Dado que eu acesse o Organo
Test Teardown    Fechar o navegador

*** Variables ***
${Campo_Nome}          id=form-nome 
${Campo_Cargo}         id=form-cargo
${Campo_Imagem}        id=form-imagem 
${Campo_Time}          class=lista-suspensa
${Programacao}         //option[contains(.,'Programação')]
${Front-end}           //option[contains(.,'Front-End')]
${Dados}               //option[contains(.,'Data Science')]
${DevOps}              //option[contains(.,'Devops')]
${UX}                  //option[contains(.,'UX e Design')]
${Mobile}              //option[contains(.,'Mobile')]
${Inovacao}            //option[contains(.,'Inovação e Gestão')]
${Botao_Criar_Card}    id=form-botao

*** Test Cases ***
Criar um Card de funcionario

    Dado que preencha os campos do form
    Quando cliar no botao criar Card
    Entao identificar o card no time esperado
    
*** Keywords ***
Dado que preencha os campos do form
    Input Text       ${Campo_Nome}   Maria
    Input Text       ${Campo_Cargo}   Desenvolvedora 
    Input Text       ${Campo_Imagem}  https://picsum.photos/200/300
    Click Element    ${Campo_Time}   
    Click Element    ${Mobile} 
Quando cliar no botao criar Card
    Click Element    ${Botao_Criar_Card}
    Sleep    2s
Entao identificar o card no time esperado
    Element Should Be Visible  class=colaborador