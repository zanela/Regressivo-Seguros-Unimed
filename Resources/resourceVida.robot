*** Settings ***
Library    SeleniumLibrary
Library    DateTime
Library    C:/Automação/Portal_Cliente_PF/Library/externalkeywords.py
Library    C:/Automação/Portal_Cliente_PF/Library/folders.py
Resource    C:/Automação/Portal_Cliente_PF/Resources/resourceGeneral.robot

*** Variables ***

*** Keywords ***
Dado que eu realize login com um segurado do segmento Vida
    [Documentation]    Palavra chave utilizada em todos os casos de teste deste cenario
    [Arguments]    ${CTID}
    create folder    Vida     ${CTID}
    ${FolderPath}=  return folder path    Vida    ${CTID}
    ${DivCardHeaderVida}=    Read Element Locator    paginas[0].homeLogado[0].meusProdutos[2].vida[0].divCardHeader
    Wait Until Element Is Visible    ${DivCardHeaderVida}
    ${data}=    get current date    # Obtem a data e hora atual
    ${data}=    format data for screenshot    ${data}
    capture page screenshot    ${FolderPath}//printRobot_01_${data}.png
    [Return]    ${CTID}

Entao o site redireciona para a pagina de 2 via de boleto
    [Documentation]  Palavra chave utilizada em mais de um caso de teste
    [Arguments]    ${CTID}
    ${Span2ViaDeBoleto}=    Read Element Locator    paginas[0].paginaDoSegmento[0].vida[0].2ViaDeBoleto[0].span2ViaDeBoleto
    ${FolderPath}=  return folder path    Vida    ${CTID}
    ${data}=    get current date    # Obtem a data e hora atual
    ${data}=    format data for screenshot    ${data}
    Wait Until Element Is Enabled    ${Span2ViaDeBoleto}
    Page Should Contain Element    ${Span2ViaDeBoleto}
    capture page screenshot    ${FolderPath}//printRobot_04_${data}.png

E preencho os campos necessarios para gerar o informe
    [Documentation]  Palavra chave utilizada em mais de um caso de teste
    [Arguments]    ${CTID}
    ${TituloInformeDeQuitacoes}=   Read Element Locator    paginas[1].modais[14].modalInformeDeQuitacoes[0].tituloInformeDeQuitacoes
    ${TituloInformeDeQuitacao}=    Read Element Locator    paginas[1].modais[14].modalInformeDeQuitacoes[4].tituloInformeDeQuitacao
    ${SelectSegmento}=    Read Element Locator    paginas[1].modais[14].modalInformeDeQuitacoes[1].selectSegmento
    ${SelectProduto}=   Read Element Locator    paginas[1].modais[14].modalInformeDeQuitacoes[2].selectProduto
    ${SelectAnoBase}=   Read Element Locator    paginas[1].modais[14].modalInformeDeQuitacoes[3].selectAnoBase
    ${FolderPath}=  return folder path    Vida    ${CTID}
    ${data}=    get current date    # Obtem a data e hora atual
    ${data}=    format data for screenshot    ${data}
    ${status}=  run keyword and return status    wait until element is visible    ${TituloInformeDeQuitacoes}
    run keyword if    '${status}'=='False'    wait until element is visible    ${TituloInformeDeQuitacao}
    run keyword and ignore error    select from list by label    ${SelectSegmento}    Vida
    wait until element is visible    ${SelectProduto}
    run keyword and ignore error    select from list by index    ${SelectProduto}   1
    capture page screenshot    ${FolderPath}//printRobot_03_${data}.png
    click element    ${SelectAnoBase}       
    sleep    1
    press keys    None  '\ue004'    #Pressiona a tecla TAB no modal
    sleep    1
    press keys    None  '\ue004'    #Pressiona a tecla TAB no modal
    sleep    1
    press keys    None  '\ue004'    #Pressiona a tecla TAB no modal
    sleep    1
    press keys    None  '\ue007'  #Pressiona a tecla ENTER
    sleep    5
    [Return]    ${CTID}

Entao o site processa a solicitacao do informe de quitacoes
    [Documentation]  Palavra chave utilizada em mais de um caso de teste
    [Arguments]    ${CTID}
    ${ModalAviso}=    Read Element Locator    paginas[1].modais[0].modalAviso
    ${ModalErroInterno}=    Read Element Locator    paginas[1].modais[1].modalErroInterno
    ${FolderPath}=    return folder path    Vida   ${CTID}
    ${data}=    get current date    # Obtem a data e hora atual
    ${data}=    format data for screenshot    ${data}
    run keyword and ignore error       wait until element is visible     ${ModalAviso}
    page should not contain element    ${ModalErroInterno}
    capture page screenshot    ${FolderPath}//printRobot_04_${data}.png

E clico no botao VER MAIS do produto Vida
    [Documentation]    Palavra chave utilizada mais de um caso de teste
    [Arguments]    ${CTID}
    ${BotaoVerMais}=    Read Element Locator    paginas[0].homeLogado[0].meusProdutos[2].vida[1].botaoVerMais
    ${DivApolice}=   Read Element Locator    paginas[0].homeLogado[0].meusProdutos[2].vida[4].divApolice
    ${DivNomeDoPlano}=    Read Element Locator    paginas[0].homeLogado[0].meusProdutos[2].vida[2].nomeDoPlano
    ${TituloVida}=    Read Element Locator    paginas[0].paginaDoSegmento[0].vida[1].tituloVida
    wait until element is visible    ${DivApolice}
    ${Apolice}=  get text    ${DivApolice}
    ${NumeroDoCartao}=    return card number    ${Apolice}
    ${NomeDoPlano}=    get text    ${DivNomeDoPlano}
    click element    ${BotaoVerMais}
    ${Lista}=    create list    ${CTID}    ${NumeroDoCartao}    ${NomeDoPlano}
    ${FolderPath}=  return folder path    Vida    ${CTID}
    wait until element is visible    ${TituloVida}
    ${data}=    get current date    # Obtem a data e hora atual
    ${data}=    format data for screenshot    ${data}
    capture page screenshot    ${FolderPath}//printRobot_02_${data}.png
    [Return]    ${Lista}

E clico no link do plano na coluna Produto
    [Documentation]  Palavra chave utilizada em mais de um caso de teste
    [Arguments]    ${CTID}
    ${subTituloMinhasApolices}=     Read Element Locator    paginas[0].paginaDoSegmento[0].vida[2].minhasApolices[0]
    ${LinkProduto}=    Read Element Locator    paginas[0].paginaDoSegmento[0].vida[2].minhasApolices[1].linkProduto
    wait until element is enabled    ${LinkProduto}
    ${PlanoVida}=     get text    ${LinkProduto}
    ${FolderPath}=  return folder path    Vida    ${CTID}
    ${data}=    get current date    # Obtem a data e hora atual
    ${data}=    format data for screenshot    ${data}
    ${Lista}=    create list    ${CTID}  ${PlanoVida}
    capture page screenshot    ${FolderPath}//printRobot_03_${data}.png
    click element    ${subTituloMinhasApolices}
    press keys    None  '\ue004'
    sleep    1
    press keys    None  '\ue007'
    [Return]    ${Lista}




# ----------------- Inicio do teste: Validar acesso a 2 Via de boleto via menu acesso rapido ----
E clico na opcao 2 via de boleto no menu de acesso rapido
    [Arguments]    ${CTID}
    ${Div2ViaDeBoleto}=     Read Element Locator    paginas[0].homeLogado[0].menuAcessoRapido[0].2ViaDeBoleto
    ${FolderPath}=  return folder path    Vida    ${CTID}
    ${data}=    get current date    # Obtem a data e hora atual
    ${data}=    format data for screenshot    ${data}
    capture page screenshot    ${FolderPath}//printRobot_02_${data}.png
    Click Element    ${Div2ViaDeBoleto}
    [Return]    ${CTID}

E seleciono o segmento Vida, um produto e confirmo
    [Arguments]    ${CTID}
    ${SelectSegmento}=  Read Element Locator    paginas[1].modais[3].modalSelecionarProduto[0].selectSegmento
    ${SelectProduto}=   Read Element Locator    paginas[1].modais[3].modalSelecionarProduto[1].selectProduto
    ${BotaoConfirmar}=  Read Element Locator    paginas[1].modais[3].modalSelecionarProduto[2].botaoConfirmar
    ${FolderPath}=  return folder path    Vida    ${CTID}
    ${data}=    get current date    # Obtem a data e hora atual
    ${data}=    format data for screenshot    ${data}
    Wait Until Element Is Visible    ${SelectSegmento}
    Select From List By Label    ${SelectSegmento}    Vida
    Wait Until Element Is Enabled    ${SelectProduto}
    Select From List By Index    ${SelectProduto}    1
    capture page screenshot    ${FolderPath}//printRobot_03_${data}.png
    Click Button    ${BotaoConfirmar}
    [Return]    ${CTID}
 # ----------------- Fim do teste: Validar acesso a 2 Via de boleto via menu acesso rapido ----

 # ----------------- Inicio do teste: Validar acesso ao Informe de Quitacoes via menu acesso rapido ----
E clico na opcao Informe de Quitacoes no menu acesso rapido
    [Arguments]    ${CTID}
    ${DivInformeDeQuitacoes}=   Read Element Locator    paginas[0].homeLogado[0].menuAcessoRapido[9].informeDeQuitacoes
    ${FolderPath}=  return folder path    Vida    ${CTID}
    ${data}=    get current date    # Obtem a data e hora atual
    ${data}=    format data for screenshot    ${data}
    scroll element into view    ${DivInformeDeQuitacoes}
    capture page screenshot    ${FolderPath}//printRobot_02_${data}.png
    click element    ${DivInformeDeQuitacoes}
    [Return]    ${CTID}
 # ----------------- Fim do teste: Validar acesso ao Informe de Quitacoes via menu acesso rapido ----

 #---------Inicio do teste: Validar acesso ao botão Manuais de Assistencia na tela de detalhes do plano -----
    
E clico no botao Manuais de Assistencia
    [Arguments]   ${CTID}     
    Wait Until Element is Visible        //div[text()=' Manuais de Assistência ']
    ${FolderPath}=  return folder path    Vida    ${CTID}
    ${data}=    get current date    # Obtem a data e hora atual
    ${data}=    format data for screenshot    ${data}
    capture page screenshot    ${FolderPath}//printRobot_04_${data}.png
    Click element                       //div[text()=' Manuais de Assistência ']   
    [Return]    ${CTID}


Entao e aberto a tela de Manuais de Assitencia
    [Arguments]    ${CTID}
    Sleep   1      
    Switch Window    title:Manuais de Assistência Vida | Seguros Unimed  
    ${FolderPath}=  return folder path    Vida    ${CTID}
    ${data}=    get current date    # Obtem a data e hora atual
    ${data}=    format data for screenshot    ${data}
    Wait Until Element is Visible       //h1[text()='Manuais de Assistência Vida' ]
    Capture Page Screenshot   ${FolderPath}//printRobot_05_${data}.png  
    
    Location should Be    https://www.segurosunimed.com.br/manuais-de-assistencia-vida    


  #---------Fim do teste: Validar acesso ao botão Manuais de Assistencia na tela de detalhes do plano -----