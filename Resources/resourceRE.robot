*** Settings ***
Library    SeleniumLibrary
Library    DateTime
Library    C:/Automação/Portal_Cliente_PF/Library/externalkeywords.py
Library    C:/Automação/Portal_Cliente_PF/Library/folders.py
Resource    C:/Automação/Portal_Cliente_PF/Resources/resourceGeneral.robot

*** Variables ***

*** Keywords ***
Dado que eu realize login com um segurado do segmento RE
    [Documentation]    Palavra chave utilizada em todos os casos de teste deste cenario
    [Arguments]    ${CTID}
    create folder    RE     ${CTID}
    ${FolderPath}=  return folder path    RE    ${CTID}
    ${DivCardHeaderRE}=    Read Element Locator    paginas[0].homeLogado[0].meusProdutos[3].re[0].divCardHeader
    Wait Until Element Is Visible    ${DivCardHeaderRE}
    ${data}=    get current date    # Obtem a data e hora atual
    ${data}=    format data for screenshot    ${data}
    capture page screenshot    ${FolderPath}//printRobot_01_${data}.png
    [Return]    ${CTID}

Entao o site redireciona para a pagina de 2 via de boleto
    [Documentation]  Palavra chave utilizada em mais de um caso de teste
    [Arguments]    ${CTID}
    ${Span2ViaDeBoleto}=    Read Element Locator    paginas[0].paginaDoSegmento[0].re[1].2ViaDeBoleto[0].span2ViaDeBoleto
    ${FolderPath}=  return folder path    RE    ${CTID}
    ${data}=    get current date    # Obtem a data e hora atual
    ${data}=    format data for screenshot    ${data}
    Wait Until Element Is Enabled    ${Span2ViaDeBoleto}
    Page Should Contain Element    ${Span2ViaDeBoleto}
    capture page screenshot    ${FolderPath}//printRobot_04_${data}.png

E preencho os campos necessarios para gerar o informe
    [Documentation]  Palavra chave utilizada em mais de um caso de teste
    [Arguments]    ${CTID}
    ${TituloInformeDeQuitacoes}=    Read Element Locator    paginas[1].modais[14].modalInformeDeQuitacoes[0].tituloInformeDeQuitacoes
    ${TituloInformeDeQuitacao}=    Read Element Locator    paginas[1].modais[14].modalInformeDeQuitacoes[4].tituloInformeDeQuitacao
    ${SelectSegmento}=    Read Element Locator    paginas[1].modais[14].modalInformeDeQuitacoes[1].selectSegmento
    ${SelectProduto}=   Read Element Locator    paginas[1].modais[14].modalInformeDeQuitacoes[2].selectProduto
    ${SelectAnoBase}=   Read Element Locator    paginas[1].modais[14].modalInformeDeQuitacoes[3].selectAnoBase
    ${FolderPath}=  return folder path    RE    ${CTID}
    ${data}=    get current date    # Obtem a data e hora atual
    ${data}=    format data for screenshot    ${data}
    ${status}=  run keyword and return status    wait until element is visible    ${TituloInformeDeQuitacoes}
    run keyword if    '${status}'=='False'    wait until element is visible    ${TituloInformeDeQuitacao}
    run keyword and ignore error    select from list by label    ${SelectSegmento}    Ramos Elementares
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
    ${FolderPath}=    return folder path    RE   ${CTID}
    ${data}=    get current date    # Obtem a data e hora atual
    ${data}=    format data for screenshot    ${data}
    run keyword and ignore error       wait until element is visible     ${ModalAviso}
    page should not contain element    ${ModalErroInterno}
    capture page screenshot    ${FolderPath}//printRobot_04_${data}.png

E clico no botao VER MAIS do produto RE
    [Documentation]    Palavra chave utilizada mais de um caso de teste
    [Arguments]    ${CTID}
    ${BotaoVerMais}=    Read Element Locator    paginas[0].homeLogado[0].meusProdutos[3].re[1].botaoVerMais
    ${DivApolice}=   Read Element Locator    paginas[0].homeLogado[0].meusProdutos[3].re[4].divApolice
    ${DivNomeDoPlano}=    Read Element Locator    paginas[0].homeLogado[0].meusProdutos[3].re[2].nomeDoPlano
    ${TituloVida}=    Read Element Locator    paginas[0].paginaDoSegmento[0].re[0].tituloRe
    wait until element is visible    ${DivApolice}
    ${Apolice}=  get text    ${DivApolice}
    ${NumeroDoCartao}=    return card number    ${Apolice}
    ${NomeDoPlano}=    get text    ${DivNomeDoPlano}
    click element    ${BotaoVerMais}
    ${Lista}=    create list    ${CTID}    ${NumeroDoCartao}    ${NomeDoPlano}
    ${FolderPath}=  return folder path    RE    ${CTID}
    wait until element is visible    ${TituloVida}
    ${data}=    get current date    # Obtem a data e hora atual
    ${data}=    format data for screenshot    ${data}
    capture page screenshot    ${FolderPath}//printRobot_02_${data}.png
    [Return]    ${Lista}

Entao o site redireciona para a pagina de detalhes do plano
    [Documentation]  Palavra chave utilizada em mais de um caso de teste
    [Arguments]    ${CTID}  ${PlanoRE}
    ${DivCertificado}=    Read Element Locator    paginas[0].paginaDoSegmento[0].re[2].detalhesDoPlano[0].divCertificado
    ${FolderPath}=  return folder path    RE    ${CTID}
    ${data}=    get current date    # Obtem a data e hora atual
    ${data}=    format data for screenshot    ${data}
    wait until element is enabled    ${DivCertificado}
    run keyword and ignore error    wait until element is visible    //span[text()='${PlanoRE}']
    ${status}=    run keyword and return status    page should contain element    //span[text()='${PlanoRE}']
    run keyword if    '${status}'=='False'   page should contain element    //span[text()=' ${PlanoRE} ']
    run keyword if    '${status}'=='True'   page should contain element    //span[text()='${PlanoRE}']
    capture page screenshot    ${FolderPath}//printRobot_03_${data}.png

Quando clico na opcao Historico de Pagamentos no menu Financeiro
    [Documentation]  Palavra chave utilizada em mais de um caso de teste
    [Arguments]    ${CTID}
    ${DivMenuFinanceiro}=   Read Element Locator    paginas[0].paginaDoSegmento[0].menu[0].financeiro[0]
    ${LinkMenuItemHistoricoDePagamentos}=   Read Element Locator    paginas[0].paginaDoSegmento[0].menu[0].financeiro[1].linkHistoricoDePagamentos
    ${FolderPath}=  return folder path    RE    ${CTID}
    ${data}=    get current date    # Obtem a data e hora atual
    ${data}=    format data for screenshot    ${data}
    click element    ${DivMenuFinanceiro}
    wait until element is visible    ${LinkMenuItemHistoricoDePagamentos}
    capture page screenshot    ${FolderPath}//printRobot_03_${data}.png
    click link    ${LinkMenuItemHistoricoDePagamentos}
    [Return]    ${CTID}

E clico no link do plano na coluna Produto
    [Documentation]  Palavra chave utilizada em mais de um caso de teste
    [Arguments]    ${CTID}
    ${LinkProduto}=     Read Element Locator    paginas[0].paginaDoSegmento[0].re[4].minhasApolices[1].linkProduto
    ${ColunaNumeroApolice}=    Read Element Locator    paginas[0].paginaDoSegmento[0].re[4].minhasApolices[2].numeroApolice
    wait until element is visible    ${LinkProduto}
    ${PlanoRE}=     get text    ${LinkProduto}
    ${NumeroApolice}=   get text    ${ColunaNumeroApolice}
    ${FolderPath}=  return folder path    RE    ${CTID}
    ${data}=    get current date    # Obtem a data e hora atual
    ${data}=    format data for screenshot    ${data}
    ${Lista}=    create list    ${CTID}  ${PlanoRE}    ${NumeroApolice}
    capture page screenshot    ${FolderPath}//printRobot_03_${data}.png
    click link    ${LinkProduto}
    [Return]    ${Lista}

# ----------------- Inicio do teste: Validar acesso a 2 Via de boleto via menu acesso rapido ----
E clico na opcao 2 via de boleto no menu de acesso rapido
    [Arguments]    ${CTID}
    ${Div2ViaDeBoleto}=     Read Element Locator    paginas[0].homeLogado[0].menuAcessoRapido[0].2ViaDeBoleto
    ${FolderPath}=  return folder path    RE    ${CTID}
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
    ${FolderPath}=  return folder path    RE    ${CTID}
    ${data}=    get current date    # Obtem a data e hora atual
    ${data}=    format data for screenshot    ${data}
    Wait Until Element Is Visible    ${SelectSegmento}
    Select From List By Label    ${SelectSegmento}    Ramos Elementares
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
    ${FolderPath}=  return folder path    RE    ${CTID}
    ${data}=    get current date    # Obtem a data e hora atual
    ${data}=    format data for screenshot    ${data}
    scroll element into view    ${DivInformeDeQuitacoes}
    capture page screenshot    ${FolderPath}//printRobot_02_${data}.png
    click element    ${DivInformeDeQuitacoes}
    [Return]    ${CTID}
 # ----------------- Fim do teste: Validar acesso ao Informe de Quitacoes via menu acesso rapido ----

 # ------------ Inicio do teste: Validar acesso ao Clube de vantagens via menu acesso rapido ----
E clico na opcao Clube de Vantagens no menu de acesso rapido
    [Arguments]    ${CTID}
    ${DivClubeDeVantagens}=     Read Element Locator    paginas[0].homeLogado[0].menuAcessoRapido[3].clubeDeVantagens
    ${FolderPath}=  return folder path    RE    ${CTID}
    ${data}=    get current date    # Obtem a data e hora atual
    ${data}=    format data for screenshot    ${data}
    capture page screenshot    ${FolderPath}//printRobot_02_${data}.png
    click element    ${DivClubeDeVantagens}
    [Return]    ${CTID}

Quando clico no botao Acessar Clube de Vantagens no modal Clube de Vantagens
    [Arguments]    ${CTID}
    ${BotaoAcessarClubeDeVantagens}=    Read Element Locator    paginas[1].modais[5].modalClubeDeVantagens[0].botaoAcessarClubeDeVantagens
    ${FolderPath}=  return folder path    RE    ${CTID}
    ${data}=    get current date    # Obtem a data e hora atual
    ${data}=    format data for screenshot    ${data}
    wait until element is enabled   ${BotaoAcessarClubeDeVantagens}
    capture page screenshot    ${FolderPath}//printRobot_03_${data}.png
    click button    ${BotaoAcessarClubeDeVantagens}
    [Return]    ${CTID}

Entao o site abre uma nova aba redirecionando para a pagina do Clube de Vantagens
    [Arguments]    ${CTID}
    switch window    title:Clube de Vantagens Seguros Unimed
    ${FolderPath}=  return folder path    RE    ${CTID}
    ${data}=    get current date    # Obtem a data e hora atual
    ${data}=    format data for screenshot    ${data}
    location should be    https://clubedevantagens.segurosunimed.com.br/
    capture page screenshot    ${FolderPath}//printRobot_04_${data}.png
# ------------ Fim do teste: Validar acesso ao Clube de vantagens via menu acesso rapido ----

 # ----------------- Inicio do teste: Validar acesso aos Ouvidoria via menu acesso rapido ----
E clico na opcao Ouvidoria no menu de acesso rapido
    [Arguments]    ${CTID}
    ${DivOuvidoria}=    Read Element Locator    paginas[0].homeLogado[0].menuAcessoRapido[5].ouvidoria
    ${FolderPath}=  return folder path    RE    ${CTID}
    ${data}=    get current date    # Obtem a data e hora atual
    ${data}=    format data for screenshot    ${data}
    capture page screenshot    ${FolderPath}//printRobot_02_${data}.png
    click element    ${DivOuvidoria}
    [Return]    ${CTID}

Entao o site abre uma nova aba redirecionando para a pagina de Ouvidoria
    [Arguments]    ${CTID}
    switch window    title:Ouvidoria | Seguros Unimed - Cuidar para Transformar
    ${TituloOuvidoria}=     Read Element Locator    paginas[2].ouvidoria[0].tituloOuvidoria
    ${FolderPath}=  return folder path    RE    ${CTID}
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
    ${FolderPath}=  return folder path    RE    ${CTID}
    ${data}=    get current date    # Obtem a data e hora atual
    ${data}=    format data for screenshot    ${data}
    capture page screenshot    ${FolderPath}//printRobot_02_${data}.png
    click element    ${DivSimuladorDePrevidencia}
    [Return]    ${CTID}

Entao o site abre uma nova aba redirecionando para a pagina do Simulador de Previdencia
    [Arguments]    ${CTID}
    switch window    title:Simulador de Previdência | Seguros Unimed
    ${SpanIniciarSimulacao}=    Read Element Locator    paginas[3].simuladorPrevidencia[0].spanIniciarSimulacao
    ${FolderPath}=  return folder path    RE    ${CTID}
    ${data}=    get current date    # Obtem a data e hora atual
    ${data}=    format data for screenshot    ${data}
    wait until element is visible    ${SpanIniciarSimulacao}
    page should contain element    ${SpanIniciarSimulacao}
    capture page screenshot    ${FolderPath}//printRobot_03_${data}.png
 # ------- Fim do teste: Validar acesso aos Simulador de Previdencia via menu acesso rapido ----

 # ----------------- Inicio do teste: Validar acesso aos dados do produto via botao VER MAIS do produto RE ----
Entao o site redireciona para a pagina do segmento RE
    [Arguments]    ${CTID}
    ${TituloOdonto}=    Read Element Locator    paginas[0].paginaDoSegmento[0].re[0].tituloRe
    ${FolderPath}=  return folder path    RE    ${CTID}
    ${data}=    get current date    # Obtem a data e hora atual
    ${data}=    format data for screenshot    ${data}
    page should contain element    ${TituloOdonto}
    capture page screenshot    ${FolderPath}//printRobot_03_${data}.png
 # ----------------- Fim do teste: Validar acesso aos dados do produto via botao VER MAIS do produto RE ----

# --- Inicio do teste: Validar acesso a apolice do usuario localizado abaixo do botao VER MAIS do produto RE ---
E clico no plano localizado abaixo do botao VER MAIS
    [Arguments]    ${CTID}
    ${DivPlanoEApolice}=     Read Element Locator    paginas[0].homeLogado[0].meusProdutos[3].re[3].divPlanoEApolice
    ${DivNomePlano}=    Read Element Locator    paginas[0].homeLogado[0].meusProdutos[3].re[2].nomeDoPlano
    ${FolderPath}=  return folder path    RE    ${CTID}
    ${data}=    get current date    # Obtem a data e hora atual
    ${data}=    format data for screenshot    ${data}
    wait until element is visible    ${DivPlanoEApolice}
    ${PlanoOdonto}  get text    ${DivNomePlano}
    ${Lista}=   create list    ${CTID}  ${PlanoOdonto}
    capture page screenshot    ${FolderPath}//printRobot_02_${data}.png
    click element    ${DivPlanoEApolice}
    [Return]    ${Lista}
 # --- Fim do teste: Validar acesso a apolice do usuario localizado abaixo do botao VER MAIS do produto RE ---

 # --- Inicio do teste: Validar acesso Historico de Pagamentos via Menu Financeiro ---
Entao o site redireciona para a pagina de Historico de Pagamentos
    [Arguments]    ${CTID}
    ${TituloHistoricoDePagamentos}=     Read Element Locator    paginas[0].paginaDoSegmento[0].re[3].historicoDePagamentos[0].tituloHistoricoDePagamentos
    ${SelectProduto}=   Read Element Locator    paginas[0].paginaDoSegmento[0].re[3].historicoDePagamentos[1].selectProduto
    wait until element is visible    ${SelectProduto}
    ${FolderPath}=  return folder path    RE    ${CTID}
    ${data}=    get current date    # Obtem a data e hora atual
    ${data}=    format data for screenshot    ${data}
    page should contain element    ${TituloHistoricoDePagamentos}
    capture page screenshot    ${FolderPath}//printRobot_04_${data}.png
 # --- Fim do teste: Validar acesso Historico de Pagamentos via Menu Financeiro ---

 # --- Inicio do teste: Validar a busca de historico de pagamentos ---
E seleciono um produto e clico no botao Atualizar busca
    [Arguments]    ${CTID}
    ${SelectProduto}=   Read Element Locator    paginas[0].paginaDoSegmento[0].re[3].historicoDePagamentos[1].selectProduto
    ${BotaoAtualizarBusca}=     Read Element Locator    paginas[0].paginaDoSegmento[0].re[3].historicoDePagamentos[2].botaoAtualizarBusca
    ${FolderPath}=  return folder path    RE    ${CTID}
    ${data}=    get current date    # Obtem a data e hora atual
    ${data}=    format data for screenshot    ${data}
    wait until element is visible    ${SelectProduto}
    select from list by index    ${SelectProduto}  1
    capture page screenshot    ${FolderPath}//printRobot_04_${data}.png
    click button    ${BotaoAtualizarBusca}
    [Return]    ${CTID}

Entao o site processa a busca de historico de pagamentos
    [Arguments]    ${CTID}
    ${DivTextoPadraoAntesDaBusca}=  Read Element Locator    paginas[0].paginaDoSegmento[0].re[3].historicoDePagamentos[3].divTextoPadraoAntesDaBusca
    ${FolderPath}=  return folder path    RE    ${CTID}
    ${data}=    get current date    # Obtem a data e hora atual
    ${data}=    format data for screenshot    ${data}
    wait until element is not visible    ${DivTextoPadraoAntesDaBusca}
    page should not contain element    ${DivTextoPadraoAntesDaBusca}
    capture page screenshot    ${FolderPath}//printRobot_05_${data}.png
 # --- Fim do teste: Validar a busca de historico de pagamentos ---

# --- Inicio do teste: Validar acesso 2 via de boleto via Menu Financeiro ---
Quando clico na opcao 2 via de boleto no menu Financeiro
    [Arguments]    ${CTID}
    ${DivMenuFinanceiro}=   Read Element Locator    paginas[0].paginaDoSegmento[0].menu[0].financeiro[0]
    ${BotaoItemMenu2ViaDeBoleto}=   Read Element Locator    paginas[0].paginaDoSegmento[0].menu[0].financeiro[2].botao2ViaDeBoleto
    ${FolderPath}=  return folder path    RE    ${CTID}
    ${data}=    get current date    # Obtem a data e hora atual
    ${data}=    format data for screenshot    ${data}
    click element    ${DivMenuFinanceiro}
    wait until element is visible    ${BotaoItemMenu2ViaDeBoleto}
    capture page screenshot    ${FolderPath}//printRobot_03_${data}.png
    click button    ${BotaoItemMenu2ViaDeBoleto}
    [Return]    ${CTID}

E seleciono o produto e clico no botao Confirmar
    [Arguments]    ${CTID}
    ${SelectProduto}=   Read Element Locator    paginas[1].modais[3].modalSelecionarProduto[1].selectProduto
    ${BotaoConfirmar}=  Read Element Locator    paginas[1].modais[3].modalSelecionarProduto[2].botaoConfirmar
    ${SelectProdutoExcecao}=    Read Element Locator    paginas[1].modais[3].modalSelecionarProduto[3].selectProdutoExcecao
    ${FolderPath}=  return folder path    RE    ${CTID}
    ${data}=    get current date    # Obtem a data e hora atual
    ${data}=    format data for screenshot    ${data}
    wait until element is visible    ${BotaoConfirmar}
    wait until element is enabled    ${SelectProduto}
    capture page screenshot    ${FolderPath}//printRobot_04_${data}.png
    click button    ${BotaoConfirmar}
    ${selectField}=  run keyword and return status    element should be enabled    ${SelectProdutoExcecao}
    ${button}=   run keyword and return status    element should be enabled   ${BotaoConfirmar}
    run keyword if      '${selectField}'=='True'    select from list by index    ${SelectProdutoExcecao}  1
    run keyword if    '${button}'=='True'   click button    ${BotaoConfirmar}
    sleep    2
    [Return]    ${CTID}
 # --- Fim do teste: Validar acesso 2 via de boleto via Menu Financeiro ---

 # --- Inicio do teste: Validar acesso ao Informe de Quitacoes via Menu Financeiro ---
Quando clico na opcao Informe de Quitacoes no menu Financeiro
    [Arguments]    ${CTID}
    ${DivMenuFinanceiro}=   Read Element Locator    paginas[0].paginaDoSegmento[0].menu[0].financeiro[0]
    ${BotaoInformeDeQuitacoes}=    Read Element Locator    paginas[0].paginaDoSegmento[0].menu[0].financeiro[5].botaoInformeDeQuitacoes
    ${FolderPath}=  return folder path    RE    ${CTID}
    ${data}=    get current date    # Obtem a data e hora atual
    ${data}=    format data for screenshot    ${data}
    click element    ${DivMenuFinanceiro}
    wait until element is visible    ${BotaoInformeDeQuitacoes}
    capture page screenshot    ${FolderPath}//printRobot_03_${data}.png
    click button    ${BotaoInformeDeQuitacoes}
    [Return]    ${CTID}
 # --- Fim do teste: Validar acesso ao Informe de Quitacoes via Menu Financeiro ---

 # --- Inicio do teste: Validar acesso a Perguntas Frequentes via Menu de Informacoes ---
Quando clico na opcao Perguntas Frequentes no menu Informacoes
    [Arguments]    ${CTID}
    ${DivMenuInformacoes}=  Read Element Locator    paginas[0].paginaDoSegmento[0].menu[0].informacoes[0]
    ${LinkPerguntasFrequentes}=    Read Element Locator    paginas[0].paginaDoSegmento[0].menu[0].informacoes[4].linkPerguntasFrequentes
    ${FolderPath}=  return folder path    RE    ${CTID}
    ${data}=    get current date    # Obtem a data e hora atual
    ${data}=    format data for screenshot    ${data}
    click element    ${DivMenuInformacoes}
    wait until element is visible    ${LinkPerguntasFrequentes}
    capture page screenshot    ${FolderPath}//printRobot_03_${data}.png
    click link    ${LinkPerguntasFrequentes}
    [Return]    ${CTID}

Entao o site abre uma nova aba redirecionando para a pagina da faq do RE
    [Arguments]    ${CTID}
    ${TituloPerguntasMaisProcuradasEmRamosElementares}=    Read Element Locator    paginas[10].faqRe[0].tituloPerguntasMaisProcuradasEmRamosElementares
    ${FolderPath}=  return folder path    RE    ${CTID}
    ${data}=    get current date    # Obtem a data e hora atual
    ${data}=    format data for screenshot    ${data}
    switch window    title:FAQ | Seguros Unimed
    wait until element is visible    ${TituloPerguntasMaisProcuradasEmRamosElementares}
    capture page screenshot    ${FolderPath}//printRobot_04_${data}.png
    page should contain element    ${TituloPerguntasMaisProcuradasEmRamosElementares}
 # --- Fim do teste: Validar acesso a Perguntas Frequentes via Menu de Informacoes ---

# --- Inicio do teste: Validar acesso aos MEUS PLANOS via hyperlink localizada na coluna produto ---
    # Caso de teste formado por palavras chaves que são reaproveitadas em outros casos de teste
# --- Fim do teste: Validar acesso aos MEUS PLANOS via hyperlink localizada na coluna produto ---

# --- Inicio do teste: Validar a exibicao dos dados da Apolice ---
Entao o site exibe os dados da apolice
    [Arguments]    ${CTID}  ${NumeroApolice}
    ${DivCertificado}=    Read Element Locator    paginas[0].paginaDoSegmento[0].re[2].detalhesDoPlano[0].divCertificado
    ${FolderPath}=  return folder path    RE    ${CTID}
    ${data}=    get current date    # Obtem a data e hora atual
    ${data}=    format data for screenshot    ${data}
    wait until element is enabled    ${DivCertificado}
    wait until element is visible    //div[text()='${NumeroApolice}']
    capture page screenshot    ${FolderPath}//printRobot_04_${data}.png
    page should contain element    //div[text()='${NumeroApolice}']
# --- Fim do teste: Validar a exibicao dos dados da Apolice ---