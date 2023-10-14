*** Settings ***
Library    SeleniumLibrary
Library    DateTime
Library    C:/Automação/Portal_Cliente_PF/Library/externalkeywords.py
Library    C:/Automação/Portal_Cliente_PF/Library/folders.py
Resource    C:/Automação/Portal_Cliente_PF/Resources/resourceGeneral.robot

*** Variables ***

*** Keywords ***
Dado que eu realize login com um segurado do segmento Previdencia
    [Documentation]    Palavra chave utilizada em todos os casos de teste deste cenario
    [Arguments]    ${CTID}
    create folder    Previdencia     ${CTID}
    ${FolderPath}=  return folder path    Previdencia    ${CTID}
    ${DivCardHeaderRE}=    Read Element Locator    paginas[0].homeLogado[0].meusProdutos[4].previdencia[0].divCardHeader
    Wait Until Element Is Visible    ${DivCardHeaderRE}
    ${data}=    get current date    # Obtem a data e hora atual
    ${data}=    format data for screenshot    ${data}
    capture page screenshot    ${FolderPath}//printRobot_01_${data}.png
    [Return]    ${CTID}

Entao o site redireciona para a pagina de 2 via de boleto
    [Documentation]  Palavra chave utilizada em mais de um caso de teste
    [Arguments]    ${CTID}
    ${Span2ViaDeBoleto}=    Read Element Locator    paginas[0].paginaDoSegmento[0].previdencia[1].2ViaDeBoleto[0].span2ViaDeBoleto
    ${FolderPath}=  return folder path    Previdencia    ${CTID}
    ${data}=    get current date    # Obtem a data e hora atual
    ${data}=    format data for screenshot    ${data}
    Wait Until Element Is Enabled    ${Span2ViaDeBoleto}
    Page Should Contain Element    ${Span2ViaDeBoleto}
    capture page screenshot    ${FolderPath}//printRobot_04_${data}.png

E clico no botao VER MAIS do produto Previdencia
    [Documentation]  Palavra chave utilizada em mais de um caso de teste
    [Arguments]    ${CTID}
    ${BotaoVerMais}=    Read Element Locator    paginas[0].homeLogado[0].meusProdutos[4].previdencia[1].botaoVerMais
    ${TituloPrevidencia}=    Read Element Locator    paginas[0].paginaDoSegmento[0].previdencia[0].tituloPrevidencia
    ${FolderPath}=  return folder path    Previdencia    ${CTID}
    ${data}=    get current date    # Obtem a data e hora atual
    ${data}=    format data for screenshot    ${data}
    click element    ${BotaoVerMais}
    wait until element is visible    ${TituloPrevidencia}
    capture page screenshot    ${FolderPath}//printRobot_02_${data}.png
    [Return]    ${CTID}

Quando clico na opcao Historico de Pagamentos no menu Financeiro
    [Documentation]  Palavra chave utilizada em mais de um caso de teste
    [Arguments]    ${CTID}
    ${DivMenuFinanceiro}=   Read Element Locator    paginas[0].paginaDoSegmento[0].menu[0].financeiro[0]
    ${LinkMenuItemHistoricoDePagamentos}=   Read Element Locator    paginas[0].paginaDoSegmento[0].menu[0].financeiro[1].linkHistoricoDePagamentos
    ${FolderPath}=  return folder path    Previdencia    ${CTID}
    ${data}=    get current date    # Obtem a data e hora atual
    ${data}=    format data for screenshot    ${data}
    click element    ${DivMenuFinanceiro}
    wait until element is visible    ${LinkMenuItemHistoricoDePagamentos}
    capture page screenshot    ${FolderPath}//printRobot_03_${data}.png
    click link    ${LinkMenuItemHistoricoDePagamentos}
    [Return]    ${CTID}

Entao o site abre uma nova aba redirecionando para a pagina do Simulador de Previdencia
    [Documentation]  Palavra chave utilizada em mais de um caso de teste
    [Arguments]    ${CTID}
    switch window    title:Simulador de Previdência | Seguros Unimed
    ${SpanIniciarSimulacao}=    Read Element Locator    paginas[3].simuladorPrevidencia[0].spanIniciarSimulacao
    ${FolderPath}=  return folder path    Previdencia    ${CTID}
    ${data}=    get current date    # Obtem a data e hora atual
    ${data}=    format data for screenshot    ${data}
    wait until element is visible    ${SpanIniciarSimulacao}
    page should contain element    ${SpanIniciarSimulacao}
    capture page screenshot    ${FolderPath}//printRobot_03_${data}.png

# ----------------- Inicio do teste: Validar acesso a 2 Via de boleto via menu acesso rapido ----
E clico na opcao 2 via de boleto no menu de acesso rapido
    [Arguments]    ${CTID}
    ${Div2ViaDeBoleto}=     Read Element Locator    paginas[0].homeLogado[0].menuAcessoRapido[0].2ViaDeBoleto
    ${FolderPath}=  return folder path    Previdencia    ${CTID}
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
    ${FolderPath}=  return folder path    Previdencia    ${CTID}
    ${data}=    get current date    # Obtem a data e hora atual
    ${data}=    format data for screenshot    ${data}
    Wait Until Element Is Visible    ${SelectSegmento}
    Select From List By Label    ${SelectSegmento}    Previdência
    Wait Until Element Is Enabled    ${SelectProduto}
    Select From List By Index    ${SelectProduto}    1
    capture page screenshot    ${FolderPath}//printRobot_03_${data}.png
    Click Button    ${BotaoConfirmar}
    [Return]    ${CTID}
 # ----------------- Fim do teste: Validar acesso a 2 Via de boleto via menu acesso rapido ----

 # ----------------- Inicio do teste: Validar acesso ao Informe de Rendimentos via menu acesso rapido ----
E clico na opcao Informe de Rendimentos no menu de acesso rapido
    [Arguments]    ${CTID}
    ${DivInformeDeRendimentos}=     Read Element Locator    paginas[0].homeLogado[0].menuAcessoRapido[1].informeDeRendimentos
    ${FolderPath}=  return folder path    Previdencia    ${CTID}
    ${data}=    get current date    # Obtem a data e hora atual
    ${data}=    format data for screenshot    ${data}
    capture page screenshot    ${FolderPath}//printRobot_02_${data}.png
    Click Element    ${DivInformeDeRendimentos}
    [Return]    ${CTID}

E no modal de informe de rendimentos seleciono o segmento Saude, um produto e confirmo
    [Arguments]    ${CTID}
    ${SelectSegmento}=  Read Element Locator    paginas[1].modais[4].modalInformeDeRendimentos[0].selectSegmento
    ${SelectProduto}=   Read Element Locator    paginas[1].modais[4].modalInformeDeRendimentos[1].selectProduto
    ${BotaoGerarInforme}=   Read Element Locator    paginas[1].modais[4].modalInformeDeRendimentos[2].botaoGerarInforme
    ${FolderPath}=  return folder path    Previdencia    ${CTID}
    ${data}=    get current date    # Obtem a data e hora atual
    ${data}=    format data for screenshot    ${data}
    Wait Until Element Is Visible    ${SelectSegmento}
    run keyword and ignore error    Select From List By Label    ${SelectSegmento}    Previdência
    capture page screenshot    ${FolderPath}//printRobot_03_${data}.png
    Click Button    ${BotaoGerarInforme}
    [Return]    ${CTID}

Entao o site exibe o modal de aviso
    [Arguments]    ${CTID}
    ${ModalAviso}=  Read Element Locator    paginas[1].modais[0].modalAviso
    Wait Until Element Is Visible    ${ModalAviso}
    ${FolderPath}=  return folder path    Previdencia    ${CTID}
    ${data}=    get current date    # Obtem a data e hora atual
    ${data}=    format data for screenshot    ${data}
    capture page screenshot    ${FolderPath}//printRobot_04_${data}.png
 # ----------------- Fim do teste: Validar acesso ao Informe de Rendimentos via menu acesso rapido ----

# ------------ Inicio do teste: Validar acesso ao Clube de vantagens via menu acesso rapido ----
E clico na opcao Clube de Vantagens no menu de acesso rapido
    [Arguments]    ${CTID}
    ${DivClubeDeVantagens}=     Read Element Locator    paginas[0].homeLogado[0].menuAcessoRapido[3].clubeDeVantagens
    ${FolderPath}=  return folder path    Previdencia    ${CTID}
    ${data}=    get current date    # Obtem a data e hora atual
    ${data}=    format data for screenshot    ${data}
    capture page screenshot    ${FolderPath}//printRobot_02_${data}.png
    click element    ${DivClubeDeVantagens}
    [Return]    ${CTID}

Quando clico no botao Acessar Clube de Vantagens no modal Clube de Vantagens
    [Arguments]    ${CTID}
    ${BotaoAcessarClubeDeVantagens}=    Read Element Locator    paginas[1].modais[5].modalClubeDeVantagens[0].botaoAcessarClubeDeVantagens
    ${FolderPath}=  return folder path    Previdencia    ${CTID}
    ${data}=    get current date    # Obtem a data e hora atual
    ${data}=    format data for screenshot    ${data}
    wait until element is enabled   ${BotaoAcessarClubeDeVantagens}
    capture page screenshot    ${FolderPath}//printRobot_03_${data}.png
    click button    ${BotaoAcessarClubeDeVantagens}
    [Return]    ${CTID}

Entao o site abre uma nova aba redirecionando para a pagina do Clube de Vantagens
    [Arguments]    ${CTID}
    switch window    title:Clube de Vantagens Seguros Unimed
    ${FolderPath}=  return folder path    Previdencia    ${CTID}
    ${data}=    get current date    # Obtem a data e hora atual
    ${data}=    format data for screenshot    ${data}
    location should be    https://clubedevantagens.segurosunimed.com.br/
    capture page screenshot    ${FolderPath}//printRobot_04_${data}.png
 # ------------ Fim do teste: Validar acesso ao Clube de vantagens via menu acesso rapido ----

 # ----------------- Inicio do teste: Validar acesso aos Ouvidoria via menu acesso rapido ----
E clico na opcao Ouvidoria no menu de acesso rapido
    [Arguments]    ${CTID}
    ${DivOuvidoria}=    Read Element Locator    paginas[0].homeLogado[0].menuAcessoRapido[5].ouvidoria
    ${FolderPath}=  return folder path    Previdencia    ${CTID}
    ${data}=    get current date    # Obtem a data e hora atual
    ${data}=    format data for screenshot    ${data}
    capture page screenshot    ${FolderPath}//printRobot_02_${data}.png
    click element    ${DivOuvidoria}
    [Return]    ${CTID}

Entao o site abre uma nova aba redirecionando para a pagina de Ouvidoria
    [Arguments]    ${CTID}
    switch window    title:Ouvidoria | Seguros Unimed - Cuidar para Transformar
    ${TituloOuvidoria}=     Read Element Locator    paginas[2].ouvidoria[0].tituloOuvidoria
    ${FolderPath}=  return folder path    Previdencia    ${CTID}
    ${data}=    get current date    # Obtem a data e hora atual
    ${data}=    format data for screenshot    ${data}
    wait until element is visible    ${TituloOuvidoria}
    page should contain element    ${TituloOuvidoria}
    capture page screenshot    ${FolderPath}//printRobot_03_${data}.png
 # ----------------- Fim do teste: Validar acesso aos Ouvidoria via menu acesso rapido ----

 # ------- Inicio do teste: Validar acesso aos Simulador de Previdencia via menu acesso rapido ----
E clico na opcao Simulador de Previdencia no menu de acesso rapido
    [Arguments]    ${CTID}
    ${DivSimuladorDePrevidencia}=   Read Element Locator    paginas[0].homeLogado[0].menuAcessoRapido[6].simuladorDePrevidencia
    ${FolderPath}=  return folder path    Previdencia    ${CTID}
    ${data}=    get current date    # Obtem a data e hora atual
    ${data}=    format data for screenshot    ${data}
    capture page screenshot    ${FolderPath}//printRobot_02_${data}.png
    click element    ${DivSimuladorDePrevidencia}
    [Return]    ${CTID}
 # ------- Fim do teste: Validar acesso aos Simulador de Previdencia via menu acesso rapido ----

 # ---------------- Inicio do Teste: Validar acesso aos dados do produto via botao VER MAIS do produto PREV ---
Entao o site redireciona para a pagina do segmento previdencia
    [Arguments]    ${CTID}
    ${TituloPrevidencia}=    Read Element Locator    paginas[0].paginaDoSegmento[0].previdencia[0].tituloPrevidencia
    ${FolderPath}=  return folder path    Previdencia    ${CTID}
    ${data}=    get current date    # Obtem a data e hora atual
    ${data}=    format data for screenshot    ${data}
    page should contain element    ${TituloPrevidencia}
    capture page screenshot    ${FolderPath}//printRobot_03_${data}.png
 # ---------------- Fim do Teste: Validar acesso aos dados do produto via botao VER MAIS do produto PREV ---

 # ---------------- Inicio do Teste: Validar acesso ao hyperlink Ver Propostas do usuario localizado abaixo do botao VER MAIS do produto PREV ---
E clico no link Ver propostas localizado abaixo dos saldos de propostas
    [Arguments]    ${CTID}
    ${TextoVerPropostas}=   Read Element Locator    paginas[0].homeLogado[0].meusProdutos[4].previdencia[2].textoVerPropostas
    ${TituloPrevidencia}=    Read Element Locator    paginas[0].paginaDoSegmento[0].previdencia[0].tituloPrevidencia
    ${FolderPath}=  return folder path    Previdencia    ${CTID}
    ${data}=    get current date    # Obtem a data e hora atual
    ${data}=    format data for screenshot    ${data}
    wait until element is enabled    ${TextoVerPropostas}
    scroll element into view    ${TextoVerPropostas}
    capture page screenshot    ${FolderPath}//printRobot_02_${data}.png
    click element    ${TextoVerPropostas}
    wait until element is visible    ${TituloPrevidencia}
    [Return]    ${CTID}

Entao o site redireciona para a pagina do segmento previdencia exibindo as propostas
    [Arguments]    ${CTID}
    ${SubtituloPropostas}=    Read Element Locator    paginas[0].paginaDoSegmento[0].previdencia[2].subtituloPropostas
    ${FolderPath}=  return folder path    Previdencia    ${CTID}
    ${data}=    get current date    # Obtem a data e hora atual
    ${data}=    format data for screenshot    ${data}
    wait until element is visible    ${SubtituloPropostas}
    scroll element into view    ${SubtituloPropostas}
    capture page screenshot    ${FolderPath}//printRobot_03_${data}.png
    page should contain element    ${SubtituloPropostas}
 # ---------------- Fim do Teste: Validar acesso ao hyperlink Ver Propostas do usuario localizado abaixo do botao VER MAIS do produto PREV ---

 # --- Inicio do Teste: Validar acesso ao Historico de Pagamentos via Menu Financeiro ---
Entao o site redireciona para a pagina de Historico de Pagamentos
    [Arguments]    ${CTID}
    ${TituloHistoricoDePagamentos}=     Read Element Locator    paginas[0].paginaDoSegmento[0].previdencia[3].historicoDePagamentos[0].tituloHistoricoDePagamentos
    ${SelectProduto}=   Read Element Locator    paginas[0].paginaDoSegmento[0].previdencia[3].historicoDePagamentos[1].selectProduto
    wait until element is visible    ${SelectProduto}
    ${FolderPath}=  return folder path    Previdencia    ${CTID}
    ${data}=    get current date    # Obtem a data e hora atual
    ${data}=    format data for screenshot    ${data}
    page should contain element    ${TituloHistoricoDePagamentos}
    capture page screenshot    ${FolderPath}//printRobot_04_${data}.png
 # --- Fim do Teste: Validar acesso ao Historico de Pagamentos via Menu Financeiro ---

 # --- Inicio do Teste: Validar a busca de historico de pagamentos ---
E seleciono um produto e clico no botao Atualizar busca
    [Arguments]    ${CTID}
    ${SelectProduto}=   Read Element Locator    paginas[0].paginaDoSegmento[0].previdencia[3].historicoDePagamentos[1].selectProduto
    ${BotaoAtualizarBusca}=     Read Element Locator    paginas[0].paginaDoSegmento[0].previdencia[3].historicoDePagamentos[2].botaoAtualizarBusca
    ${FolderPath}=  return folder path    Previdencia    ${CTID}
    ${data}=    get current date    # Obtem a data e hora atual
    ${data}=    format data for screenshot    ${data}
    wait until element is visible    ${SelectProduto}
    select from list by index    ${SelectProduto}  1
    capture page screenshot    ${FolderPath}//printRobot_04_${data}.png
    click button    ${BotaoAtualizarBusca}
    [Return]    ${CTID}

Entao o site processa a busca de historico de pagamentos
    [Arguments]    ${CTID}
    ${DivTextoPadraoAntesDaBusca}=  Read Element Locator    paginas[0].paginaDoSegmento[0].previdencia[3].historicoDePagamentos[3].divTextoPadraoAntesDaBusca
    ${FolderPath}=  return folder path    Previdencia    ${CTID}
    ${data}=    get current date    # Obtem a data e hora atual
    ${data}=    format data for screenshot    ${data}
    wait until element is not visible    ${DivTextoPadraoAntesDaBusca}
    page should not contain element    ${DivTextoPadraoAntesDaBusca}
    capture page screenshot    ${FolderPath}//printRobot_05_${data}.png
 # --- Fim do Teste: Validar a busca de historico de pagamentos ---

 # --- Inicio do Teste: Validar acesso a 2 via de boleto via Menu Financeiro ---
Quando clico na opcao 2 via de boleto no menu Financeiro
    [Arguments]    ${CTID}
    ${DivMenuFinanceiro}=   Read Element Locator    paginas[0].paginaDoSegmento[0].menu[0].financeiro[0]
    ${BotaoItemMenu2ViaDeBoleto}=   Read Element Locator    paginas[0].paginaDoSegmento[0].menu[0].financeiro[2].botao2ViaDeBoleto
    ${FolderPath}=  return folder path    Previdencia    ${CTID}
    ${data}=    get current date    # Obtem a data e hora atual
    ${data}=    format data for screenshot    ${data}
    click element    ${DivMenuFinanceiro}
    wait until element is visible    ${BotaoItemMenu2ViaDeBoleto}
    capture page screenshot    ${FolderPath}//printRobot_03_${data}.png
    click button    ${BotaoItemMenu2ViaDeBoleto}
    [Return]    ${CTID}

E seleciono o produto e clico no botao Confirmar
    [Arguments]    ${CTID}
    ${BotaoConfirmar}=  Read Element Locator    paginas[1].modais[3].modalSelecionarProduto[2].botaoConfirmar
    ${TextoCampoObrigatorio}=   Read Element Locator    paginas[1].modais[3].modalSelecionarProduto[4].textoCampoObrigatorio
    ${FolderPath}=  return folder path    Previdencia    ${CTID}
    ${data}=    get current date    # Obtem a data e hora atual
    ${data}=    format data for screenshot    ${data}
    wait until element is visible    ${BotaoConfirmar}
    capture page screenshot    ${FolderPath}//printRobot_04_${data}.png
    click button    ${BotaoConfirmar}
    ${campoObrigatorio}=  run keyword and return status    wait until element is enabled    ${TextoCampoObrigatorio}
    ${button}=   run keyword and return status    element should be enabled   ${BotaoConfirmar}
    run keyword if      '${campoObrigatorio}'=='True'    press keys    None  '\ue004'    #Pressiona a tecla TAB no modal
    sleep    1
    run keyword if      '${campoObrigatorio}'=='True'    press keys    None  '\ue015'
    run keyword if    '${button}'=='True'   click button    ${BotaoConfirmar}
    sleep    2
    [Return]    ${CTID}
 # --- Fim do Teste: Validar acesso a 2 via de boleto via Menu Financeiro ---

 # --- Inicio do teste: Validar acesso ao Informe de Rendimentos via Menu Financeiro ---
Quando clico na opcao Informe de Rendimentos no menu Financeiro
    [Arguments]    ${CTID}
    ${DivMenuFinanceiro}=   Read Element Locator    paginas[0].paginaDoSegmento[0].menu[0].financeiro[0]
    ${BotaoItemMenuInformeDeRendimentos}=   Read Element Locator    paginas[0].paginaDoSegmento[0].menu[0].financeiro[3].botaoInformeDeRendimentos
    ${FolderPath}=  return folder path    Previdencia    ${CTID}
    ${data}=    get current date    # Obtem a data e hora atual
    ${data}=    format data for screenshot    ${data}
    click element    ${DivMenuFinanceiro}
    wait until element is visible    ${BotaoItemMenuInformeDeRendimentos}
    capture page screenshot    ${FolderPath}//printRobot_03_${data}.png
    click button    ${BotaoItemMenuInformeDeRendimentos}
    [Return]    ${CTID}

E confirmo a geracao do informe no modal Informe de Rendimentos
    [Arguments]    ${CTID}
    ${SelectSegmento}=  Read Element Locator    paginas[1].modais[4].modalInformeDeRendimentos[0].selectSegmento
    ${SelectAnoBase}=   Read Element Locator    paginas[1].modais[4].modalInformeDeRendimentos[3].selectAnoBase
    ${FolderPath}=  return folder path    Previdencia    ${CTID}
    ${data}=    get current date    # Obtem a data e hora atual
    ${data}=    format data for screenshot    ${data}
    wait until element is visible    ${SelectAnoBase}
    capture page screenshot    ${FolderPath}//printRobot_04_${data}.png
    press keys    None  '\ue004'  #Pressiona a tecla TAB no modal
    sleep    1
    press keys    None  '\ue004'  #Pressiona a tecla TAB no modal
    sleep    1
    press keys    None  '\ue004'  #Pressiona a tecla TAB no modal
    sleep   1
    press keys    None  '\ue004'  #Pressiona a tecla TAB no modal
    sleep    1
    press keys    None  '\ue007'  #Pressiona a tecla ENTER no botão Gerar Informe
    sleep    1
    #Os códigos a seguir serão executados caso o campo de seleção de produto não tiver sido preenchido automaticamente
    ${segmentField}=    run keyword and return status    element should be enabled    ${SelectSegmento}
    run keyword if    '${segmentField}'=='True'     select from list by label    ${SelectSegmento}      Odonto
    ${yearField}=   run keyword and return status    element should be enabled  ${SelectAnoBase}
    run keyword if    '${yearField}'=='True'    press keys    None  '\ue004'  #Pressiona a tecla TAB no modal
    run keyword if    '${yearField}'=='True'    sleep    1
    run keyword if    '${yearField}'=='True'    press keys    None  '\ue004'  #Pressiona a tecla TAB no modal
    run keyword if    '${yearField}'=='True'    sleep    1
    run keyword if    '${yearField}'=='True'    press keys    None  '\ue004'  #Pressiona a tecla TAB no modal
    run keyword if    '${yearField}'=='True'    sleep    1
    run keyword if    '${yearField}'=='True'    press keys    None  '\ue007'  #Pressiona a tecla ENTER no botão Gerar Informe
    [Return]    ${CTID}

Entao o site processa a solicitacao do informe de rendimentos
    [Arguments]    ${CTID}
    ${SelectAnoBase}=   Read Element Locator    paginas[1].modais[4].modalInformeDeRendimentos[3].selectAnoBase
    ${TituloModalAviso}=    Read Element Locator    paginas[1].modais[0].modalAviso
    ${DivErroInterno}=  Read Element Locator    paginas[1].modais[1].modalErroInterno
    ${FolderPath}=  return folder path    Previdencia    ${CTID}
    ${data}=    get current date    # Obtem a data e hora atual
    ${data}=    format data for screenshot    ${data}
    wait until element is not visible    ${SelectAnoBase}
    run keyword and ignore error    wait until element is visible    ${TituloModalAviso}
    page should not contain element    ${DivErroInterno}
    capture page screenshot    ${FolderPath}//printRobot_05_${data}.png
 # --- Fim do teste: Validar acesso ao Informe de Rendimentos via Menu Financeiro ---

 # --- Inicio do teste: Validar acesso ao Simulador via Menu Financeiro ---
Quando clico na opcao Simulador no menu Financeiro
    [Arguments]    ${CTID}
    ${DivMenuFinanceiro}=   Read Element Locator    paginas[0].paginaDoSegmento[0].menu[0].financeiro[0]
    ${LinkMenuItemSimulador}=   Read Element Locator    paginas[0].paginaDoSegmento[0].menu[0].financeiro[6].linkSimulador
    ${DivErroInterno}=  Read Element Locator    paginas[1].modais[1].modalErroInterno
    ${FolderPath}=  return folder path    Previdencia    ${CTID}
    ${data}=    get current date    # Obtem a data e hora atual
    ${data}=    format data for screenshot    ${data}
    click element    ${DivMenuFinanceiro}
    wait until element is visible    ${LinkMenuItemSimulador}
    capture page screenshot    ${FolderPath}//printRobot_03_${data}.png
    click link    ${LinkMenuItemSimulador}
    [Return]    ${CTID}
 # --- Fim do teste: Validar acesso ao Simulador via Menu Financeiro ---

 # --- Inicio do teste: Validar acesso a Perguntas Frequentes via Menu de Informacoes ---
Quando clico na opcao Perguntas Frequentes no menu Informacoes
    [Arguments]    ${CTID}
    ${DivMenuInformacoes}=  Read Element Locator    paginas[0].paginaDoSegmento[0].menu[0].informacoes[0]
    ${LinkPerguntasFrequentes}=    Read Element Locator    paginas[0].paginaDoSegmento[0].menu[0].informacoes[4].linkPerguntasFrequentes
    ${FolderPath}=  return folder path    Previdencia    ${CTID}
    ${data}=    get current date    # Obtem a data e hora atual
    ${data}=    format data for screenshot    ${data}
    click element    ${DivMenuInformacoes}
    wait until element is visible    ${LinkPerguntasFrequentes}
    capture page screenshot    ${FolderPath}//printRobot_03_${data}.png
    click link    ${LinkPerguntasFrequentes}
    [Return]    ${CTID}

Entao o site abre uma nova aba redirecionando para a pagina da faq de Previdencia
    [Arguments]    ${CTID}
    ${TituloPerguntasMaisProcuradasEmPrevidencia}=    Read Element Locator    paginas[11].faqPrevidencia[0].tituloPerguntasMaisProcuradasEmPrevidencia
    ${FolderPath}=  return folder path    Previdencia    ${CTID}
    ${data}=    get current date    # Obtem a data e hora atual
    ${data}=    format data for screenshot    ${data}
    switch window    title:FAQ | Seguros Unimed
    wait until element is visible    ${TituloPerguntasMaisProcuradasEmPrevidencia}
    capture page screenshot    ${FolderPath}//printRobot_04_${data}.png
    page should contain element    ${TituloPerguntasMaisProcuradasEmPrevidencia}
 # --- Fim do teste: Validar acesso a Perguntas Frequentes via Menu de Informacoes ---

 #-----Inicio de teste: Validar Exibição do Saldo Total do produto localizado em Composição da Reserva ----


Entao o site redireciona para a pagina da previdencia com o saldo total da composicao da reserva
    [Arguments]      ${CTID} 
    ${FolderPath}=  return folder path    Previdencia    ${CTID}
    ${data}=    get current date    # Obtem a data e hora atual
    ${data}=    format data for screenshot    ${data}
    wait until element is visible       //div[text()='Saldo total']
    Scroll Element Into View          //div[text()='Saldo total']
    capture page screenshot            ${FolderPath}//printRobot_03_${data}.png 
    page should contain element        //div[text()='Saldo total'] 

#-----Fim do teste: Validar Exibição do Saldo Total do produto localizado em Composição da Reserva ----

#-----Inicio de teste: Validar Exibição do Saldo individual do produto localizado em Composição da Reserva ----

Entao o site redireciona para a pagina da previdencia com o saldo individual da composicao da reserva
    [Arguments]      ${CTID} 
    ${FolderPath}=  return folder path    Previdencia    ${CTID}
    ${data}=    get current date    # Obtem a data e hora atual
    ${data}=    format data for screenshot    ${data}
    wait until element is visible       //div[text()='Individual']
    Scroll Element Into View           //div[text()='Individual']
    capture page screenshot            ${FolderPath}//printRobot_03_${data}.png 
    page should contain element        //div[text()='Individual'] 

#-----Fim do teste: Validar Exibição do Saldo individual do produto localizado em Composição da Reserva ----

#-----Inicio de teste: Validar Exibição do Saldo individual do produto localizado em Composição da Reserva ----

Entao o site redireciona para a pagina da previdencia com o saldo empresarial da composicao da reserva
    [Arguments]      ${CTID} 
    ${FolderPath}=  return folder path    Previdencia    ${CTID}
    ${data}=    get current date    # Obtem a data e hora atual
    ${data}=    format data for screenshot    ${data}
    wait until element is visible        //div[text()='empresarial']
    Scroll Element Into View             //div[text()='empresarial']
    capture page screenshot              ${FolderPath}//printRobot_03_${data}.png 
    page should contain element          //div[text()='empresarial'] 


#-----Fim do teste: Validar Exibição do Saldo individual do produto localizado em Composição da Reserva ----



#-----inicio de teste: Validar a funcionalidade do botão Ocultar Dados (Olho) do produto PREV localizado em Composição da Reserva
Quando clico no botão ocultar dados    
    [Arguments]      ${CTID} 
    ${FolderPath}=  return folder path    Previdencia    ${CTID}
    ${data}=    get current date    # Obtem a data e hora atual
    ${data}=    format data for screenshot    ${data}
    wait until element is visible   //i[@class='hide-button fal my-auto d-flex justify-content-center align-items-center fa-eye-slash']
    scrool into view                //i[@class='hide-button fal my-auto d-flex justify-content-center align-items-center fa-eye-slash']    
    capture page screenshot         ${FolderPath}//printRobot_03_${data}.png 
    click element                   //i[@class='hide-button fal my-auto d-flex justify-content-center align-items-center fa-eye-slash']        
    [Return]            ${CTID}

Entao o site oculta os valores da composicao da reserva
    [Arguments]      ${CTID} 
    ${FolderPath}=  return folder path    Previdencia    ${CTID}
    ${data}=    get current date    # Obtem a data e hora atual
    ${data}=    format data for screenshot    ${data}
    wait until element is visible     //i[@class='hide-button fal my-auto d-flex justify-content-center align-items-center fa-eye']
    capture page screenshot           ${FolderPath}//printRobot_04_${data}.png 
    page should contain element     //i[@class='hide-button fal my-auto d-flex justify-content-center align-items-center fa-eye']
    
#-----fim de teste: Validar a funcionalidade do botão Ocultar Dados (Olho) do produto PREV localizado em Composição da Reserva



#------inicio de teste: Validar Exibição do Grid Rentabilidade de Fundos

Entao o site redireciona para a pagina da previdencia com o grid de rentabilidade de fundos
    [Arguments]      ${CTID} 
    ${FolderPath}=  return folder path    Previdencia    ${CTID}
    ${data}=    get current date    # Obtem a data e hora atual
    ${data}=    format data for screenshot    ${data}
    wait until element is visible       //canvas[@class='chartjs-render-monitor']
    Scroll Element Into View            //canvas[@class='chartjs-render-monitor'] 
    capture page screenshot             ${FolderPath}//printRobot_03_${data}.png    
    page should contain element         //canvas[@class='chartjs-render-monitor']

#------fim de teste: Validar Exibição do Grid Rentabilidade de Fundos