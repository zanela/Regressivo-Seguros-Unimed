*** Settings ***
Library    SeleniumLibrary
Library    C:/Automação/Portal_Cliente_PF/Library/testdata.py
Library    C:/Automação/Portal_Cliente_PF/Library/webdrivers.py
Library    C:/Automação/Portal_Cliente_PF/Library/locators.py
Library    C:/Automação/Portal_Cliente_PF/Library/testdata.py

*** Variables ***
${Homolocacao}  https://homologacao-www.segurosunimed.com.br/
${Pre-producao}    https://preproducao-www.segurosunimed.com.br/
${Producao}     https://www.segurosunimed.com.br/


*** Keywords ***
Realizar login e maximizar a janela
    [Arguments]    ${Segmento}
    ${LinkClientePF}=   Read Element Locator    paginas[0].homeNaoLogado[0].linkClientePessoaFisica
    ${campoCPF}=    Read Element Locator    paginas[0].loginCliente[0].campoDeTextoSeuCPF
    ${campoSenha}=  Read Element Locator    paginas[0].loginCliente[1].campoDeTextoSuaSenha
    ${botaoEntrar}=     Read Element Locator    paginas[0].loginCliente[2].botaoEntrar
    ${CPFeSenha}    get username and password    ${Segmento}
    ${URL}=    get url
    set selenium timeout    45
    ${WebBrowser}   get web driver  Chrome  # No momento apenas a opção Chrome está disponível
    Create Webdriver    Chrome    executable_path=${WebBrowser}
    Go To    ${URL}
    Maximize Browser Window
    Wait Until Element Is Visible    ${LinkClientePF}
    Click Link    ${LinkClientePF}
    Input Text    ${campoCPF}    ${CPFeSenha[0]}
    Input Text    ${campoSenha}    ${CPFeSenha[1]}
    Click Button    ${botaoEntrar}

Read Element Locator
    [Arguments]    ${JsonPath}
    ${result}=  read locators from json    ${JsonPath}
    [Return]    ${result}