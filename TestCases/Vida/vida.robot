*** Settings ***
Library    SeleniumLibrary
Resource    C:/Automação/Portal_Cliente_PF/Resources/resourceGeneral.robot
Resource    C:/Automação/Portal_Cliente_PF/Resources/resourceVida.robot
Test Setup    Realizar login e maximizar a janela   Vida
Test Teardown    Close Browser

*** Test Cases ***
Validar acesso a 2 Via de boleto via menu acesso rapido
    [Tags]    CT74  RegressivoFull  RegressivoVida
    ${CTID}=    Dado que eu realize login com um segurado do segmento Vida    CT-74
    ${CTID}=    E clico na opcao 2 via de boleto no menu de acesso rapido   ${CTID}
    ${CTID}=    E seleciono o segmento Vida, um produto e confirmo    ${CTID}
    Entao o site redireciona para a pagina de 2 via de boleto   ${CTID}

Validar acesso ao Informe de Quitacoes via menu acesso rapido
    [Tags]    CT75  RegressivoFull  RegressivoVida
    ${CTID}=    Dado que eu realize login com um segurado do segmento Vida    CT-75
    ${CTID}=    E clico na opcao Informe de Quitacoes no menu acesso rapido    ${CTID}
    ${CTID}=    E preencho os campos necessarios para gerar o informe   ${CTID}
    Entao o site processa a solicitacao do informe de quitacoes    ${CTID}


Validar acesso ao botao Manuais de Assistencia na tela de detalhes do plano
    [Tags]    CT97   RegressivoFull  RegressivoVida
    ${CTID}=     Dado que eu realize login com um segurado do segmento Vida  CT97
    ${list}=     E clico no botao VER MAIS do produto Vida       ${CTID}
    ${list}=     E clico no link do plano na coluna Produto      ${list[0]}
    ${CTID}=     E clico no botao Manuais de Assistencia         ${CTID} 
    Entao e aberto a tela de Manuais de Assitencia   ${CTID}


   