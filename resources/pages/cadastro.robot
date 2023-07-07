*** Settings ***
Resource      ../main.robot
*** Variables ***
${Campo_Nome}          id=form-nome 
${Campo_Cargo}         id=form-cargo
${Campo_Imagem}        id=form-imagem 
${Campo_Time}          class=lista-suspensa
@{Selecionar_Times}
...                    //option[contains(.,'Programação')]
...                    //option[contains(.,'Front-End')]
...                    //option[contains(.,'Data Science')]
...                    //option[contains(.,'Devops')]
...                    //option[contains(.,'UX e Design')]
...                    //option[contains(.,'Mobile')]
...                    //option[contains(.,'Inovação e Gestão')]
${Botao_Criar_Card}    id=form-botao

*** Keywords ***
Dado que preencha os campos do form
    ${Nome}    FakerLibrary.First Name Female
    ${Cargo}    FakerLibrary.Job
    ${Imagem}    FakerLibrary.Image Url
    Input Text       ${Campo_Nome}     ${Nome}
    Input Text       ${Campo_Cargo}    ${Cargo} 
    Input Text       ${Campo_Imagem}   ${Imagem} 
    Click Element    ${Campo_Time}   
    Click Element    ${Selecionar_Times}[0] 
Quando cliar no botao criar Card
    Click Element    ${Botao_Criar_Card}
    Sleep    2s
Entao identificar o card no time esperado
    Element Should Be Visible  class=colaborador

Entao identificar 3 cards no time esperado
    FOR    ${i}    IN RANGE    1    3
        Dado que preencha os campos do form
        Quando cliar no botao criar Card
    END
        Sleep    5s

Entao Criar e identificar 1 cards em cada time
    FOR    ${indice}    ${time}    IN ENUMERATE    @{Selecionar_Times}
        Dado que preencha os campos do form
        Click Element    ${time}
        Quando cliar no botao criar Card
        
    END
        Sleep    5s

Dado que eu clique no botao criar card
    Click Element    ${Botao_Criar_Card}
Entao sistema deve apresentar mensagem de campo obrigatorio
    Element Should Be Visible    id:form-nome-erro
    Element Should Be Visible    id:form-cargo-erro
    Element Should Be Visible    id:form-times-erro
