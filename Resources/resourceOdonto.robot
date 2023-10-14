*** Settings ***
Library    SeleniumLibrary
Library    DateTime
Library    C:/Automação/Portal_Cliente_PF/Library/externalkeywords.py
Library    C:/Automação/Portal_Cliente_PF/Library/folders.py
Resource    C:/Automação/Portal_Cliente_PF/Resources/resourceGeneral.robot

*** Variables ***
${dataPassada}

*** Keywords ***
Dado que eu realize login com um segurado do segmento Odonto
    [Documentation]    Palavra chave utilizada em todos os casos de teste deste cenario
    [Arguments]    ${CTID}
    create folder    Odonto     ${CTID}
    ${FolderPath}=  return folder path    Odonto    ${CTID}
    ${DivCardHeaderOdonto}=     Read Element Locator    paginas[0].homeLogado[0].meusProdutos[0].odonto[0].divCardHeader
    Wait Until Element Is Visible    ${DivCardHeaderOdonto}
    ${data}=    get current date    # Obtem a data e hora atual
    ${data}=    format data for screenshot    ${data}
    capture page screenshot    ${FolderPath}//printRobot_01_${data}.png
    [Return]    ${CTID}

E clico no botao VER MAIS do produto Odonto
    [Documentation]    Palavra chave utilizada em multiplos casos de teste
    [Arguments]    ${CTID}
    ${BotaoVerMais}=    Read Element Locator    paginas[0].homeLogado[0].meusProdutos[0].odonto[1].botaoVerMais
    ${TituloOdonto}=    Read Element Locator    paginas[0].paginaDoSegmento[0].odonto[0].tituloOdonto
    click element    ${BotaoVerMais}
    ${FolderPath}=  return folder path    Odonto    ${CTID}
    wait until element is visible    ${TituloOdonto}
    ${data}=    get current date    # Obtem a data e hora atual
    ${data}=    format data for screenshot    ${data}
    capture page screenshot    ${FolderPath}//printRobot_02_${data}.png
    [Return]    ${CTID}

Quando clico na opcao Historico de Pagamentos no menu Financeiro
    [Documentation]    Palavra chave utilizada em multiplos casos de teste
    [Arguments]    ${CTID}
    ${DivMenuFinanceiro}=   Read Element Locator    paginas[0].paginaDoSegmento[0].menu[0].financeiro[0]
    ${LinkMenuItemHistoricoDePagamentos}=   Read Element Locator    paginas[0].paginaDoSegmento[0].menu[0].financeiro[1].linkHistoricoDePagamentos
    ${FolderPath}=  return folder path    Odonto    ${CTID}
    ${data}=    get current date    # Obtem a data e hora atual
    ${data}=    format data for screenshot    ${data}
    click element    ${DivMenuFinanceiro}
    wait until element is visible    ${LinkMenuItemHistoricoDePagamentos}
    capture page screenshot    ${FolderPath}//printRobot_03_${data}.png
    click link    ${LinkMenuItemHistoricoDePagamentos}
    [Return]    ${CTID}


Quando clico na opcao Utilizacao e Coparticipacao no menu Relatorios
    [Documentation]    Palavra chave utilizada em mais de um caso de teste
    [Arguments]    ${CTID}
    ${MenuRelatorios}=  Read Element Locator    paginas[0].paginaDoSegmento[0].menu[0].relatorios[0]
    ${MenuItemUtilizacaoECoparticipacao}=   Read Element Locator    paginas[0].paginaDoSegmento[0].menu[0].relatorios[1].utilizacaoECoparticipacao
    ${FolderPath}=  return folder path    Odonto    ${CTID}
    ${data}=    get current date    # Obtem a data e hora atual
    ${data}=    format data for screenshot    ${data}
    click element    ${MenuRelatorios}
    wait until element is visible    ${MenuItemUtilizacaoECoparticipacao}
    capture page screenshot    ${FolderPath}//printRobot_03_${data}.png
    click button    ${MenuItemUtilizacaoECoparticipacao}
    [Return]    ${CTID}


Quando clico no botao Utilizacao e Coparticipacao na pagina de detalhes do plano
    [Documentation]    Palavra chave utilizada em mais de um caso de teste
    [Arguments]    ${CTID}
    ${DivUtilizacaoECoparticipacao}=    Read Element Locator    paginas[0].paginaDoSegmento[0].odonto[2].detalhesDoPlano[0].divUtilizacaoECoparticipacao
    ${FolderPath}=  return folder path    Odonto    ${CTID}
    ${data}=    get current date    # Obtem a data e hora atual
    ${data}=    format data for screenshot    ${data}
    wait until element is visible   ${DivUtilizacaoECoparticipacao}
    capture page screenshot    ${FolderPath}//printRobot_04_${data}.png
    click element   ${DivUtilizacaoECoparticipacao}
    [Return]    ${CTID}


E solicito o relatorio por periodo
    [Documentation]    Palavra chave utilizada em mais de um caso de teste
    [Arguments]    ${CTID}
    ${CampoSelectProduto}=  Read Element Locator    paginas[1].modais[2].modalUtilizacaoECoparticipacao[0].selectProduto
    ${RadioPorPeriodo}=     Read Element Locator    paginas[1].modais[2].modalUtilizacaoECoparticipacao[1].intervalo[0].radioPorPeriodo
    ${CampoDataInicial}=    Read Element Locator    paginas[1].modais[2].modalUtilizacaoECoparticipacao[2].campoDataInicial
    ${CampoDataFinal}=      Read Element Locator    paginas[1].modais[2].modalUtilizacaoECoparticipacao[3].campoDataFinal
    ${BotaoGerarRelatorio}=     Read Element Locator    paginas[1].modais[2].modalUtilizacaoECoparticipacao[5].botaoGerarRelatorio
    ${FolderPath}=  return folder path    Odonto    ${CTID}
    ${data}=    get current date    # Obtem a data e hora atual
    ${data}=    format data for screenshot    ${data}
    wait until element is visible    ${CampoSelectProduto}
    select from list by index    ${CampoSelectProduto}   1
    click element    ${RadioPorPeriodo}
    ${dataAtual}=    get current date    # Obtem a data e hora atual
    ${dataAtual}=    convert date    ${dataAtual} date_format=%d.%m.%Y %H:%M   result_format=%d.%m.%Y     # Converte a data para o formato DD.MM.YYYY
    ${dataAtual}=    remove date separators    ${dataAtual} # Remove os separadores da data retornando apenas os numeros
    ${dataPassada}=  return past date    31  # retorna uma data passada de acordo com a quantidade de dias informada
    ${dataPassada}=  remove date separators    ${dataPassada}
    input text    ${CampoDataInicial}    ${dataPassada}
    input text    ${CampoDataFinal}  ${dataAtual}
    capture page screenshot    ${FolderPath}//printRobot_04_${data}.png
    click button    ${BotaoGerarRelatorio}
    [Return]    ${CTID}


E solicito o relatorio por semestre
    [Documentation]    Palavra chave utilizada em mais de um caso de teste
    [Arguments]    ${CTID}
    ${CampoSelectProduto}=  Read Element Locator    paginas[1].modais[2].modalUtilizacaoECoparticipacao[0].selectProduto
    ${RadioPorSemestre}=    Read Element Locator    paginas[1].modais[2].modalUtilizacaoECoparticipacao[1].intervalo[1].radioPorSemestre
    ${CampoSelectSemestre}=     Read Element Locator    paginas[1].modais[2].modalUtilizacaoECoparticipacao[4].selectSemestre
    ${BotaoGerarRelatorio}=     Read Element Locator    paginas[1].modais[2].modalUtilizacaoECoparticipacao[5].botaoGerarRelatorio
    ${FolderPath}=  return folder path    Odonto    ${CTID}
    ${data}=    get current date    # Obtem a data e hora atual
    ${data}=    format data for screenshot    ${data}
    wait until element is visible    ${CampoSelectProduto}
    select from list by index    ${CampoSelectProduto}   1
    click element    ${RadioPorSemestre}
    select from list by index    ${CampoSelectSemestre}     1
    click button    ${BotaoGerarRelatorio}
    capture page screenshot    ${FolderPath}//printRobot_04_${data}.png
    [Return]    ${CTID}


Entao o site processa a solicitacao do relatorio de Utilizacao e Coparticipacao
    [Documentation]    Palavra chave utilizada em mais de um caso de teste
    [Arguments]    ${CTID}
    ${CampoDataFinal}=      Read Element Locator    paginas[1].modais[2].modalUtilizacaoECoparticipacao[3].campoDataFinal
    ${CampoSelectSemestre}=     Read Element Locator    paginas[1].modais[2].modalUtilizacaoECoparticipacao[4].selectSemestre
    ${ModalAviso}=  Read Element Locator    paginas[1].modais[0].modalAviso
    ${ModalErroInterno}=    Read Element Locator    paginas[1].modais[1].modalErroInterno
    ${FolderPath}=  return folder path    Odonto    ${CTID}
    ${data}=    get current date    # Obtem a data e hora atual
    ${data}=    format data for screenshot    ${data}
    wait until element is not visible    ${CampoDataFinal}
    wait until element is not visible    ${CampoSelectSemestre}
    run keyword and ignore error    wait until element is visible    ${ModalAviso}
    page should not contain element    ${ModalErroInterno}
    capture page screenshot    ${FolderPath}//printRobot_05_${data}.png

Entao o site abre uma nova aba redirecionando para a pagina da Unimed Odonto
    [Documentation]    Palavra chave utilizada em mais de um caso de teste
    [Arguments]    ${CTID}
    ${FolderPath}=  return folder path    Odonto    ${CTID}
    ${data}=    get current date    # Obtem a data e hora atual
    ${data}=    format data for screenshot    ${data}
    Switch Window    title:Unimed Odonto
    Location Should Be  https://www.unimedodonto.com.br/
    capture page screenshot    ${FolderPath}//printRobot_04_${data}.png

Entao o site redireciona para a pagina de descontos em medicamentos
    [Documentation]    Palavra chave utilizada em mais de um caso de teste
    [Arguments]    ${CTID}
    ${TituloDescontosEmMedicamentos}=   Read Element Locator    paginas[4].descontosEmMedicamentos[0].tituloDescontosEmMedicamentos
    ${FolderPath}=  return folder path    Odonto    ${CTID}
    ${data}=    get current date    # Obtem a data e hora atual
    ${data}=    format data for screenshot    ${data}
    Wait until element is visible    ${TituloDescontosEmMedicamentos}
    sleep    1
    page should contain element    ${TituloDescontosEmMedicamentos}
    capture page screenshot    ${FolderPath}//printRobot_03_${data}.png

E clico no link do plano na coluna Produto
    [Documentation]  Palavra chave utilizada em mais de um caso de teste
    [Arguments]    ${CTID}
    ${LinkProduto}=     Read Element Locator    paginas[0].paginaDoSegmento[0].odonto[1].meusPlanos[0].linkProduto
    wait until element is visible    ${LinkProduto}
    ${PlanoOdonto}=     get text    ${LinkProduto}
    ${FolderPath}=  return folder path    Odonto    ${CTID}
    ${data}=    get current date    # Obtem a data e hora atual
    ${data}=    format data for screenshot    ${data}
    ${Lista}=    create list    ${CTID}  ${PlanoOdonto}
    capture page screenshot    ${FolderPath}//printRobot_03_${data}.png
    click link    ${LinkProduto}
    [Return]    ${Lista}

Entao o site redireciona para a pagina de detalhes do plano
    [Documentation]  Palavra chave utilizada em mais de um caso de teste
    [Arguments]    ${CTID}  ${PlanoOdonto}
    ${DivCartaoDigital}=    Read Element Locator    paginas[0].paginaDoSegmento[0].odonto[2].detalhesDoPlano[1].divCartaoDigital
    ${FolderPath}=  return folder path    Odonto    ${CTID}
    ${data}=    get current date    # Obtem a data e hora atual
    ${data}=    format data for screenshot    ${data}
    wait until element is visible    ${DivCartaoDigital}
    ${status}=    run keyword and return status    page should contain element    //span[text()='${PlanoOdonto}']
    run keyword if    '${status}'=='False'   page should contain element    //span[text()=' ${PlanoOdonto} ']
    run keyword if    '${status}'=='True'   page should contain element    //span[text()='${PlanoOdonto}']
    capture page screenshot    ${FolderPath}//printRobot_03_${data}.png

Entao o site redireciona para a pagina de 2 via de boleto
    [Documentation]  Palavra chave utilizada em mais de um caso de teste
    [Arguments]    ${CTID}
    ${Span2ViaDeBoleto}=    Read Element Locator    paginas[0].paginaDoSegmento[0].odonto[3].2ViaDeBoleto[0].span2ViaDeBoleto
    ${FolderPath}=  return folder path    Odonto    ${CTID}
    ${data}=    get current date    # Obtem a data e hora atual
    ${data}=    format data for screenshot    ${data}
    Wait Until Element Is Enabled    ${Span2ViaDeBoleto}
    Page Should Contain Element    ${Span2ViaDeBoleto}
    capture page screenshot    ${FolderPath}//printRobot_04_${data}.png

E clico no botao Cancelar do modal de Utilizacao e Coparticipacao
    [Documentation]  Palavra chave utilizada em mais de um caso de teste
    [Arguments]    ${CTID}
    ${CampoSelectProduto}=  Read Element Locator    paginas[1].modais[2].modalUtilizacaoECoparticipacao[0].selectProduto
    ${CampoDataFinal}=      Read Element Locator    paginas[1].modais[2].modalUtilizacaoECoparticipacao[3].campoDataFinal
    ${FolderPath}=  return folder path    Odonto    ${CTID}
    ${data}=    get current date    # Obtem a data e hora atual
    ${data}=    format data for screenshot    ${data}
    wait until element is visible    ${CampoSelectProduto}
    click element    ${CampoDataFinal}
    sleep    1
    click element    ${CampoDataFinal}
    sleep    1
    press keys    None  '\ue004'  #Pressiona a tecla TAB no modal
    sleep   1
    capture page screenshot    ${FolderPath}//printRobot_04_${data}.png
    press keys    None  '\ue007'  #Pressiona a tecla ENTER no botão Cancelar
    sleep    1
    [Return]    ${CTID}

Entao o site fecha o modal de Utilizacao e Coparticipacao
    [Documentation]  Palavra chave utilizada em mais de um caso de teste
    [Arguments]    ${CTID}
    ${CampoDataFinal}=      Read Element Locator    paginas[1].modais[2].modalUtilizacaoECoparticipacao[3].campoDataFinal
    ${status}=    run keyword and return status    input text    ${CampoDataFinal}     20022021
    ${FolderPath}=  return folder path    Odonto    ${CTID}
    ${data}=    get current date    # Obtem a data e hora atual
    ${data}=    format data for screenshot    ${data}
    capture page screenshot    ${FolderPath}//printRobot_05_${data}.png
    pass execution if    '${status}'=='False'   O modal foi fechado

Quando clico no botao Cartao Digital na pagina de detalhes do plano
    [Documentation]  Palavra chave utilizada em mais de um caso de teste
    [Arguments]    ${CTID}
    ${DivCartaoDigital}=    Read Element Locator    paginas[0].paginaDoSegmento[0].odonto[2].detalhesDoPlano[1].divCartaoDigital
    ${FolderPath}=  return folder path    Odonto    ${CTID}
    ${data}=    get current date    # Obtem a data e hora atual
    ${data}=    format data for screenshot    ${data}
    wait until element is visible    ${DivCartaoDigital}
    capture page screenshot    ${FolderPath}//printRobot_04_${data}.png
    click element   ${DivCartaoDigital}
    [Return]    ${CTID}

E clico na opcao Verso no modal Cartao Digital
    [Documentation]  Palavra chave utilizada em mais de um caso de teste
    [Arguments]    ${CTID}
    ${RadiobuttonVerso}=    Read Element Locator    paginas[1].modais[9].modalCartaoDigital[1].radiobuttonVerso
    ${DivUserInfo}=    Read Element Locator    paginas[1].modais[9].modalCartaoDigital[5].divUserInfo
    ${FolderPath}=  return folder path    Odonto    ${CTID}
    ${data}=    get current date    # Obtem a data e hora atual
    ${data}=    format data for screenshot    ${data}
    wait until element is visible    ${DivUserInfo}
    click element    ${DivUserInfo}
    scroll element into view   ${RadiobuttonVerso}
    capture page screenshot    ${FolderPath}//printRobot_05_${data}.png
    click element    ${RadiobuttonVerso}
    [Return]    ${CTID}

Entao o site fecha o modal Cartao Digital
    [Documentation]  Palavra chave utilizada em mais de um caso de teste
    [Arguments]    ${CTID}
    ${BotaoVoltar}=    Read Element Locator    paginas[1].modais[9].modalCartaoDigital[3].botaoVoltar
    ${FolderPath}=  return folder path    Odonto    ${CTID}
    ${data}=    get current date    # Obtem a data e hora atual
    ${data}=    format data for screenshot    ${data}
    sleep    2
    capture page screenshot    ${FolderPath}//printRobot_06_${data}.png
    ${status}=    run keyword and return status    click button    ${BotaoVoltar}
    pass execution if    '${status}'=='False'   O modal foi fechado

# ----------------- Inicio do teste: Validar acesso a 2 Via de boleto via menu acesso rapido ----
E clico na opcao 2 via de boleto no menu de acesso rapido
    [Arguments]    ${CTID}
    ${Div2ViaDeBoleto}=     Read Element Locator    paginas[0].homeLogado[0].menuAcessoRapido[0].2ViaDeBoleto
    ${FolderPath}=  return folder path    Odonto    ${CTID}
    ${data}=    get current date    # Obtem a data e hora atual
    ${data}=    format data for screenshot    ${data}
    capture page screenshot    ${FolderPath}//printRobot_02_${data}.png
    Click Element    ${Div2ViaDeBoleto}
    [Return]    ${CTID}

E seleciono o segmento Odonto, um produto e confirmo
    [Arguments]    ${CTID}
    ${SelectSegmento}=  Read Element Locator    paginas[1].modais[3].modalSelecionarProduto[0].selectSegmento
    ${SelectProduto}=   Read Element Locator    paginas[1].modais[3].modalSelecionarProduto[1].selectProduto
    ${BotaoConfirmar}=  Read Element Locator    paginas[1].modais[3].modalSelecionarProduto[2].botaoConfirmar
    ${FolderPath}=  return folder path    Odonto    ${CTID}
    ${data}=    get current date    # Obtem a data e hora atual
    ${data}=    format data for screenshot    ${data}
    Wait Until Element Is Visible    ${SelectSegmento}
    Select From List By Label    ${SelectSegmento}    Odonto
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
    ${FolderPath}=  return folder path    Odonto    ${CTID}
    ${data}=    get current date    # Obtem a data e hora atual
    ${data}=    format data for screenshot    ${data}
    capture page screenshot    ${FolderPath}//printRobot_02_${data}.png
    Click Element    ${DivInformeDeRendimentos}
    [Return]    ${CTID}

E no modal de informe de rendimentos seleciono o segmento Odonto, um produto e confirmo
    [Arguments]    ${CTID}
    ${SelectSegmento}=  Read Element Locator    paginas[1].modais[4].modalInformeDeRendimentos[0].selectSegmento
    ${SelectProduto}=   Read Element Locator    paginas[1].modais[4].modalInformeDeRendimentos[1].selectProduto
    ${BotaoGerarInforme}=   Read Element Locator    paginas[1].modais[4].modalInformeDeRendimentos[2].botaoGerarInforme
    ${FolderPath}=  return folder path    Odonto    ${CTID}
    ${data}=    get current date    # Obtem a data e hora atual
    ${data}=    format data for screenshot    ${data}
    Wait Until Element Is Visible    ${SelectSegmento}
    Select From List By Label    ${SelectSegmento}    Odonto
    Wait Until Element Is Visible    ${SelectProduto}
    capture page screenshot    ${FolderPath}//printRobot_03_${data}.png
    Click Button    ${BotaoGerarInforme}
    [Return]    ${CTID}

Entao o site exibe o modal de aviso
    [Arguments]    ${CTID}
    ${ModalAviso}=  Read Element Locator    paginas[1].modais[0].modalAviso
    Wait Until Element Is Visible    ${ModalAviso}
    ${FolderPath}=  return folder path    Odonto    ${CTID}
    ${data}=    get current date    # Obtem a data e hora atual
    ${data}=    format data for screenshot    ${data}
    capture page screenshot    ${FolderPath}//printRobot_04_${data}.png
# ----------------- Fim do teste: Validar acesso ao Informe de Rendimentos via menu acesso rapido ----

# ------------ Inicio do teste: Validar acesso aos Descontos em Medicamentos via menu acesso rapido ----
E clico na opcao Descontos em Medicamentos no menu de acesso rapido
    [Arguments]    ${CTID}
    ${FolderPath}=  return folder path    Odonto    ${CTID}
    ${data}=    get current date    # Obtem a data e hora atual
    ${data}=    format data for screenshot    ${data}
    capture page screenshot    ${FolderPath}//printRobot_02_${data}.png
    ${DivDescontosEmMedicamentos}=  Read Element Locator    paginas[0].homeLogado[0].menuAcessoRapido[2].descontosEmMedicamentos
    click element    ${DivDescontosEmMedicamentos}
    [Return]    ${CTID}
# ------------ Fim do teste: Validar acesso aos Descontos em Medicamentos via menu acesso rapido ----

# ------------ Inicio do teste: Validar acesso ao Clube de vantagens via menu acesso rapido ----
E clico na opcao Clube de Vantagens no menu de acesso rapido
    [Arguments]    ${CTID}
    ${DivClubeDeVantagens}=     Read Element Locator    paginas[0].homeLogado[0].menuAcessoRapido[3].clubeDeVantagens
    ${FolderPath}=  return folder path    Odonto    ${CTID}
    ${data}=    get current date    # Obtem a data e hora atual
    ${data}=    format data for screenshot    ${data}
    capture page screenshot    ${FolderPath}//printRobot_02_${data}.png
    click element    ${DivClubeDeVantagens}
    [Return]    ${CTID}

Quando clico no botao Acessar Clube de Vantagens no modal Clube de Vantagens
    [Arguments]    ${CTID}
    ${BotaoAcessarClubeDeVantagens}=    Read Element Locator    paginas[1].modais[5].modalClubeDeVantagens[0].botaoAcessarClubeDeVantagens
    ${FolderPath}=  return folder path    Odonto    ${CTID}
    ${data}=    get current date    # Obtem a data e hora atual
    ${data}=    format data for screenshot    ${data}
    wait until element is enabled   ${BotaoAcessarClubeDeVantagens}
    capture page screenshot    ${FolderPath}//printRobot_03_${data}.png
    click button    ${BotaoAcessarClubeDeVantagens}
    [Return]    ${CTID}

Entao o site abre uma nova aba redirecionando para a pagina do Clube de Vantagens
    [Arguments]    ${CTID}
    switch window    title:Clube de Vantagens Seguros Unimed
    ${FolderPath}=  return folder path    Odonto    ${CTID}
    ${data}=    get current date    # Obtem a data e hora atual
    ${data}=    format data for screenshot    ${data}
    location should be    https://clubedevantagens.segurosunimed.com.br/
    capture page screenshot    ${FolderPath}//printRobot_04_${data}.png
# ------------ Fim do teste: Validar acesso ao Clube de vantagens via menu acesso rapido ----

# ----------------- Inicio do teste: Validar acesso ao Guia Medico e Odontológico via menu acesso rapido ----
E clico na opcao Guia Medico e Odontologico no menu de acesso rapido
    [Arguments]    ${CTID}
    ${BotaoGuiaMedicoEOdontologico}=    Read Element Locator    paginas[0].homeLogado[0].menuAcessoRapido[4].guiaMedicoEOdontologico
    ${PlanoOdontoEmMeusProdutos}=   Read Element Locator    paginas[0].homeLogado[0].meusProdutos[0].odonto[2].nomeDoPlano
    wait until element is visible    ${PlanoOdontoEmMeusProdutos}
    ${PlanoOdonto}=   get text    ${PlanoOdontoEmMeusProdutos}
    ${lista}=   create list    ${CTID}  ${PlanoOdonto}
    ${FolderPath}=  return folder path    Odonto    ${CTID}
    ${data}=    get current date    # Obtem a data e hora atual
    ${data}=    format data for screenshot    ${data}
    Click Element    ${BotaoGuiaMedicoEOdontologico}
    capture page screenshot    ${FolderPath}//printRobot_02_${data}.png
    [Return]    ${lista}

E clico no plano Odonto exibido no modal Guia
    [Arguments]    ${CTID}  ${Plano}
    Wait Until Element Is Visible    //div[text()='${Plano}']
    ${FolderPath}=  return folder path    Odonto    ${CTID}
    ${data}=    get current date    # Obtem a data e hora atual
    ${data}=    format data for screenshot    ${data}
    capture page screenshot    ${FolderPath}//printRobot_03_${data}.png
    Click Element    //div[text()='${Plano}']
    [Return]    ${CTID}
# ----------------- Fim do teste: Validar acesso ao Guia Medico e Odontológico via menu acesso rapido ----

# ----------------- Inicio do teste: Validar acesso aos Ouvidoria via menu acesso rapido ----
E clico na opcao Ouvidoria no menu de acesso rapido
    [Arguments]    ${CTID}
    ${DivOuvidoria}=    Read Element Locator    paginas[0].homeLogado[0].menuAcessoRapido[5].ouvidoria
    ${FolderPath}=  return folder path    Odonto    ${CTID}
    ${data}=    get current date    # Obtem a data e hora atual
    ${data}=    format data for screenshot    ${data}
    capture page screenshot    ${FolderPath}//printRobot_02_${data}.png
    click element    ${DivOuvidoria}
    [Return]    ${CTID}

Entao o site abre uma nova aba redirecionando para a pagina de Ouvidoria
    [Arguments]    ${CTID}
    switch window    title:Ouvidoria | Seguros Unimed - Cuidar para Transformar
    ${TituloOuvidoria}=     Read Element Locator    paginas[2].ouvidoria[0].tituloOuvidoria
    ${FolderPath}=  return folder path    Odonto    ${CTID}
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
    ${FolderPath}=  return folder path    Odonto    ${CTID}
    ${data}=    get current date    # Obtem a data e hora atual
    ${data}=    format data for screenshot    ${data}
    capture page screenshot    ${FolderPath}//printRobot_02_${data}.png
    click element    ${DivSimuladorDePrevidencia}
    [Return]    ${CTID}

Entao o site abre uma nova aba redirecionando para a pagina do Simulador de Previdencia
    [Arguments]    ${CTID}
    switch window    title:Simulador de Previdência | Seguros Unimed
    ${SpanIniciarSimulacao}=    Read Element Locator    paginas[3].simuladorPrevidencia[0].spanIniciarSimulacao
    ${FolderPath}=  return folder path    Odonto    ${CTID}
    ${data}=    get current date    # Obtem a data e hora atual
    ${data}=    format data for screenshot    ${data}
    wait until element is visible    ${SpanIniciarSimulacao}
    page should contain element    ${SpanIniciarSimulacao}
    capture page screenshot    ${FolderPath}//printRobot_03_${data}.png
# ------- Fim do teste: Validar acesso aos Simulador de Previdencia via menu acesso rapido ----

# ----------------- Inicio do teste: Validar acesso aos dados do produto via botao VER MAIS do produto Odonto ----
Entao o site redireciona para a pagina do segmento odonto
    [Arguments]    ${CTID}
    ${TituloOdonto}=    Read Element Locator    paginas[0].paginaDoSegmento[0].odonto[0].tituloOdonto
    ${FolderPath}=  return folder path    Odonto    ${CTID}
    ${data}=    get current date    # Obtem a data e hora atual
    ${data}=    format data for screenshot    ${data}
    page should contain element    ${TituloOdonto}
    capture page screenshot    ${FolderPath}//printRobot_03_${data}.png
# ----------------- Fim do teste: Validar acesso aos dados do produto via botao VER MAIS do produto Odonto ----

# --- Inicio do teste: Validar acesso a apolice do usuario localizado abaixo do botao VER MAIS do produto Odonto ---
E clico no plano localizado abaixo do botao VER MAIS
    [Arguments]    ${CTID}
    ${DivPlanoECartao}=     Read Element Locator    paginas[0].homeLogado[0].meusProdutos[0].odonto[3].divPlanoECartao
    ${DivNomePlano}=    Read Element Locator    paginas[0].homeLogado[0].meusProdutos[0].odonto[2].nomeDoPlano
    ${FolderPath}=  return folder path    Odonto    ${CTID}
    ${data}=    get current date    # Obtem a data e hora atual
    ${data}=    format data for screenshot    ${data}
    wait until element is visible    ${DivPlanoECartao}
    ${PlanoOdonto}  get text    ${DivNomePlano}
    ${Lista}=   create list    ${CTID}  ${PlanoOdonto}
    capture page screenshot    ${FolderPath}//printRobot_02_${data}.png
    click element    ${DivPlanoECartao}
    [Return]    ${Lista}
# --- Fim do teste: Validar acesso a apolice do usuario localizado abaixo do botao VER MAIS do produto Odonto ---

# --- Inicio do teste: Validar acesso Historico de Pagamentos via Menu Financeiro ---
Entao o site redireciona para a pagina de Historico de Pagamentos
    [Arguments]    ${CTID}
    ${TituloHistoricoDePagamentos}=     Read Element Locator    paginas[0].paginaDoSegmento[0].odonto[4].historicoDePagamentos[0].tituloHistoricoDePagamentos
    ${SelectProduto}=   Read Element Locator    paginas[0].paginaDoSegmento[0].odonto[4].historicoDePagamentos[1].selectProduto
    wait until element is visible    ${SelectProduto}
    ${FolderPath}=  return folder path    Odonto    ${CTID}
    ${data}=    get current date    # Obtem a data e hora atual
    ${data}=    format data for screenshot    ${data}
    page should contain element    ${TituloHistoricoDePagamentos}
    capture page screenshot    ${FolderPath}//printRobot_04_${data}.png
# --- Fim do teste: Validar acesso Historico de Pagamentos via Menu Financeiro ---

# --- Inicio do teste: Validar detalhes do historico de pagamentos ---
E seleciono um produto e clico no botao Atualizar busca
    [Arguments]    ${CTID}
    ${SelectProduto}=   Read Element Locator    paginas[0].paginaDoSegmento[0].odonto[4].historicoDePagamentos[1].selectProduto
    ${BotaoAtualizarBusca}=     Read Element Locator    paginas[0].paginaDoSegmento[0].odonto[4].historicoDePagamentos[2].botaoAtualizarBusca
    ${FolderPath}=  return folder path    Odonto    ${CTID}
    ${data}=    get current date    # Obtem a data e hora atual
    ${data}=    format data for screenshot    ${data}
    wait until element is visible    ${SelectProduto}
    select from list by index    ${SelectProduto}  1
    capture page screenshot    ${FolderPath}//printRobot_04_${data}.png
    click button    ${BotaoAtualizarBusca}
    [Return]    ${CTID}

Entao o site processa a busca de historico de pagamentos
    [Arguments]    ${CTID}
    ${DivTextoPadraoAntesDaBusca}=  Read Element Locator    paginas[0].paginaDoSegmento[0].odonto[4].historicoDePagamentos[3].divTextoPadraoAntesDaBusca
    ${FolderPath}=  return folder path    Odonto    ${CTID}
    ${data}=    get current date    # Obtem a data e hora atual
    ${data}=    format data for screenshot    ${data}
    wait until element is not visible    ${DivTextoPadraoAntesDaBusca}
    page should not contain element    ${DivTextoPadraoAntesDaBusca}
    capture page screenshot    ${FolderPath}//printRobot_05_${data}.png
# --- Fim do teste: Validar detalhes do historico de pagamentos ---

# --- Inicio do teste: Validar acesso 2 via de boleto via Menu Financeiro ---
Quando clico na opcao 2 via de boleto no menu Financeiro
    [Arguments]    ${CTID}
    ${DivMenuFinanceiro}=   Read Element Locator    paginas[0].paginaDoSegmento[0].menu[0].financeiro[0]
    ${BotaoItemMenu2ViaDeBoleto}=   Read Element Locator    paginas[0].paginaDoSegmento[0].menu[0].financeiro[2].botao2ViaDeBoleto
    ${FolderPath}=  return folder path    Odonto    ${CTID}
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
    ${FolderPath}=  return folder path    Odonto    ${CTID}
    ${data}=    get current date    # Obtem a data e hora atual
    ${data}=    format data for screenshot    ${data}
    wait until element is visible    ${BotaoConfirmar}
    capture page screenshot    ${FolderPath}//printRobot_04_${data}.png
    click button    ${BotaoConfirmar}
    ${selectField}=  run keyword and return status    element should be enabled    ${SelectProdutoExcecao}
    ${button}=   run keyword and return status    element should be enabled   ${BotaoConfirmar}
    run keyword if      '${selectField}'=='True'    select from list by index    ${SelectProdutoExcecao}  1
    run keyword if    '${button}'=='True'   click button    ${BotaoConfirmar}
    sleep    2
    [Return]    ${CTID}
# --- Fim do teste: Validar acesso 2 via de boleto via Menu Financeiro ---

# --- Inicio do teste: Validar acesso Informe de Rendimentos via Menu Financeiro ---
Quando clico na opcao Informe de Rendimentos no menu Financeiro
    [Arguments]    ${CTID}
    ${DivMenuFinanceiro}=   Read Element Locator    paginas[0].paginaDoSegmento[0].menu[0].financeiro[0]
    ${BotaoItemMenuInformeDeRendimentos}=   Read Element Locator    paginas[0].paginaDoSegmento[0].menu[0].financeiro[3].botaoInformeDeRendimentos
    ${FolderPath}=  return folder path    Odonto    ${CTID}
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
    ${SelectProduto}=   Read Element Locator    paginas[1].modais[4].modalInformeDeRendimentos[1].selectProduto
    ${FolderPath}=  return folder path    Odonto    ${CTID}
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
    run keyword if    '${yearField}'=='True'    select from list by index    ${SelectProduto}   1
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
    ${FolderPath}=  return folder path    Odonto    ${CTID}
    ${data}=    get current date    # Obtem a data e hora atual
    ${data}=    format data for screenshot    ${data}
    wait until element is not visible    ${SelectAnoBase}
    run keyword and ignore error    wait until element is visible    ${TituloModalAviso}
    page should not contain element    ${DivErroInterno}
    capture page screenshot    ${FolderPath}//printRobot_05_${data}.png
# --- Fim do teste: Validar acesso Informe de Rendimentos via Menu Financeiro ---

# --- Inicio do teste: Validar acesso Utilizacao e Coparticipacao via Menu de Relatorios ---
Entao o site exibe o modal com campos para gerar o relatorio de Utilizacao e Coparticipacao
    [Arguments]    ${CTID}
    ${CampoSelectProduto}=  Read Element Locator    paginas[1].modais[2].modalUtilizacaoECoparticipacao[0].selectProduto
    ${RadioPorPeriodo}=     Read Element Locator    paginas[1].modais[2].modalUtilizacaoECoparticipacao[1].intervalo[0].radioPorPeriodo
    ${RadioPorSemestre}=    Read Element Locator    paginas[1].modais[2].modalUtilizacaoECoparticipacao[1].intervalo[1].radioPorSemestre
    ${CampoDataInicial}=    Read Element Locator    paginas[1].modais[2].modalUtilizacaoECoparticipacao[2].campoDataInicial
    ${CampoDataFinal}=      Read Element Locator    paginas[1].modais[2].modalUtilizacaoECoparticipacao[3].campoDataFinal
    ${BotaoGerarRelatorio}=     Read Element Locator    paginas[1].modais[2].modalUtilizacaoECoparticipacao[5].botaoGerarRelatorio
    ${FolderPath}=  return folder path    Odonto    ${CTID}
    ${data}=    get current date    # Obtem a data e hora atual
    ${data}=    format data for screenshot    ${data}
    wait until element is visible    ${CampoSelectProduto}
    page should contain element    ${CampoSelectProduto}
    page should contain element    ${RadioPorPeriodo}
    page should contain element    ${RadioPorSemestre}
    page should contain element    ${CampoDataInicial}
    page should contain element    ${CampoDataFinal}
    page should contain element    ${BotaoGerarRelatorio}
    capture page screenshot    ${FolderPath}//printRobot_04_${data}.png
# --- Fim do teste: Validar acesso Utilizacao e Coparticipacao via Menu de Relatorios ---

# --- Inicio do teste: Solicitar geracao de relatorio de Utilizacao e Coparticipacao por periodo via Menu Relatorios ---
    # Este teste utiliza apenas palavras chave compartilhadas
# --- Fim do teste: Solicitar geracao de relatorio de Utilizacao e Coparticipacao por periodo via Menu Relatorios ---

# --- Inicio do teste: Solicitar geracao de relatorio de Utilizacao e Coparticipacao por semestre via Menu Relatorios ---
    # Este teste utiliza apenas palavras chave compartilhadas
# --- Fim do teste: Solicitar geracao de relatorio de Utilizacao e Coparticipacao por semestre via Menu Relatorios ---

# --- Inicio do teste: Validar a funcionalidade do botao Cancelar do modal de Utilizacao e Coparticipacao via Menu Relatorios ---
    # Este teste utiliza apenas palavras chave compartilhadas
# --- Fim do teste: Validar a funcionalidade do botao Cancelar do modal de Utilizacao e Coparticipacao via Menu Relatorios ---

# --- Inicio do teste: Validar acesso Rede Credenciada via Menu de Informacoes ---
Quando clico na opcao Rede Credenciada no menu Informacoes
    [Arguments]    ${CTID}
    ${DivMenuInformacoes}=  Read Element Locator    paginas[0].paginaDoSegmento[0].menu[0].informacoes[0]
    ${LinkItemMenuRedeCredenciada}=     Read Element Locator    paginas[0].paginaDoSegmento[0].menu[0].informacoes[1].redeCredenciada[0].linkRedeCredenciada
    ${FolderPath}=  return folder path    Odonto    ${CTID}
    ${data}=    get current date    # Obtem a data e hora atual
    ${data}=    format data for screenshot    ${data}
    click element    ${DivMenuInformacoes}
    wait until element is visible    ${LinkItemMenuRedeCredenciada}
    capture page screenshot    ${FolderPath}//printRobot_03_${data}.png
    click link    ${LinkItemMenuRedeCredenciada}
    [Return]    ${CTID}
# --- Fim do teste: Validar acesso Rede Credenciada via Menu de Informacoes ---

# --- Inicio do teste: Validar acesso Descontos em Medicamentos via Menu de Informacoes ---
Quando clico na opcao Descontos em medicamentos no menu Informacoes
    [Arguments]    ${CTID}
    ${DivMenuInformacoes}=  Read Element Locator    paginas[0].paginaDoSegmento[0].menu[0].informacoes[0]
    ${LinkItemMenuDescontosEmMedicamentos}=     Read Element Locator    paginas[0].paginaDoSegmento[0].menu[0].informacoes[2].descontosEmMedicamentos[0].linkDescontosEmMedicamentos
    ${FolderPath}=  return folder path    Odonto    ${CTID}
    ${data}=    get current date    # Obtem a data e hora atual
    ${data}=    format data for screenshot    ${data}
    click element    ${DivMenuInformacoes}
    wait until element is visible    ${LinkItemMenuDescontosEmMedicamentos}
    capture page screenshot    ${FolderPath}//printRobot_03_${data}.png
    click link    ${LinkItemMenuDescontosEmMedicamentos}
    [Return]    ${CTID}
# --- Fim do teste: Validar acesso Descontos em Medicamentos via Menu de Informacoes ---

# --- Inicio do teste: Validar acesso aos MEUS PLANOS via hyperlink localizada na coluna produto ---
    # Caso de teste formado por palavras chaves que são reaproveitadas em outros casos de teste
# --- Fim do teste: Validar acesso aos MEUS PLANOS via hyperlink localizada na coluna produto ---

# --- Inicio do teste: Validar acesso ao Manual do Beneficiario na tela de detalhes da apolice ---
E clico na opcao Manual do Beneficiario
    [Arguments]    ${CTID}
    ${BotaoManualDoBeneficiario}=   Read Element Locator    paginas[0].paginaDoSegmento[0].odonto[2].detalhesDoPlano[2].botaoManualDoBeneficiario
    ${FolderPath}=  return folder path    Odonto    ${CTID}
    ${data}=    get current date    # Obtem a data e hora atual
    ${data}=    format data for screenshot    ${data}
    wait until element is enabled    ${BotaoManualDoBeneficiario}
    capture page screenshot    ${FolderPath}//printRobot_04_${data}.png
    click button    ${BotaoManualDoBeneficiario}
    [Return]    ${CTID}

Entao o site exibe o modal Manual do Beneficiario para baixar o doc
    [Arguments]    ${CTID}
    ${DivBaixeSeuManualdoBeneficiarioEmPDF}=    Read Element Locator    paginas[1].modais[6].modalManualDoBeneficiario[0].divBaixeSeuManualDoBeneficiárioEmPDF
    ${FolderPath}=  return folder path    Odonto    ${CTID}
    ${data}=    get current date    # Obtem a data e hora atual
    ${data}=    format data for screenshot    ${data}
    wait until element is visible    ${DivBaixeSeuManualdoBeneficiarioEmPDF}
    page should contain element    ${DivBaixeSeuManualdoBeneficiarioEmPDF}
    capture page screenshot    ${FolderPath}//printRobot_05_${data}.png
# --- Fim do teste: Validar acesso ao Manual do Beneficiario na tela de detalhes da apolice ---

# --- Inicio do teste: Validar a exibicao do botao Solicitar Cancelamento na pagina de detalhes do plano ---
Entao o site exibe o botao Solicitar Cancelamento na pagina de detalhes do plano
    [Arguments]    ${CTID}
    ${DivSolicitarCancelamento}=    Read Element Locator    paginas[0].paginaDoSegmento[0].odonto[2].detalhesDoPlano[3].divSolicitarCancelamento
    wait until element is visible    ${DivSolicitarCancelamento}
    ${FolderPath}=  return folder path    Odonto    ${CTID}
    ${data}=    get current date    # Obtem a data e hora atual
    ${data}=    format data for screenshot    ${data}
    scroll element into view    ${DivSolicitarCancelamento}
    ${data}=    get current date    # Obtem a data e hora atual
    ${data}=    format data for screenshot    ${data}
    page should contain element    ${DivSolicitarCancelamento}
    capture page screenshot    ${FolderPath}//printRobot_04_${data}.png
# --- Fim do teste: Validar a exibicao do botao Solicitar Cancelamento na pagina de detalhes do plano ---

# --- Inicio do teste: Validar a solicitacao de cancelamento de contrato na pagina de detalhes do plano ---
Quando clico na opcao Solicitar Cancelamento
    [Arguments]    ${CTID}
    ${DivSolicitarCancelamento}=    Read Element Locator    paginas[0].paginaDoSegmento[0].odonto[2].detalhesDoPlano[3].divSolicitarCancelamento
    ${FolderPath}=  return folder path    Odonto    ${CTID}
    ${data}=    get current date    # Obtem a data e hora atual
    ${data}=    format data for screenshot    ${data}
    wait until element is visible    ${DivSolicitarCancelamento}
    capture page screenshot    ${FolderPath}//printRobot_04_${data}.png
    scroll element into view    ${DivSolicitarCancelamento}
    click element    ${DivSolicitarCancelamento}
    [Return]    ${CTID}

E preencho todas a informacoes para enviar o requirimento
    [Arguments]    ${CTID}
    ${BotaoAvancar}=     Read Element Locator   paginas[0].paginaDoSegmento[0].odonto[5].solicitarCancelamento[0].botaoAvancar
    ${TextoCancelamento}=    Read Element Locator    paginas[0].paginaDoSegmento[0].odonto[5].solicitarCancelamento[1].textoCancelamento
    ${DivTermoDeConsentimento}=    Read Element Locator    paginas[0].paginaDoSegmento[0].odonto[5].solicitarCancelamento[2].divTermoDeConsentimento
    ${UltimaFraseDoTermo}=  Read Element Locator    paginas[0].paginaDoSegmento[0].odonto[5].solicitarCancelamento[3].ultimaFraseDoTermo
    ${DivLiEAceitoOsTermos}=   Read Element Locator    paginas[0].paginaDoSegmento[0].odonto[5].solicitarCancelamento[4].divLiEAceitoOsTermos
    ${InputNomeCivil}=  Read Element Locator    paginas[0].paginaDoSegmento[0].odonto[5].solicitarCancelamento[5].dadosDoSeguradoTitular[0].inputNomeCivil
    ${InputEmail}=  Read Element Locator    paginas[0].paginaDoSegmento[0].odonto[5].solicitarCancelamento[5].dadosDoSeguradoTitular[1].inputEmail
    ${InputCEP}=    Read Element Locator    paginas[0].paginaDoSegmento[0].odonto[5].solicitarCancelamento[6].endereco[0].inputCEP
    ${TextoCEPInvalido}=    Read Element Locator    paginas[0].paginaDoSegmento[0].odonto[5].solicitarCancelamento[6].endereco[6].textoCEPInvalido
    ${InputLogradouro}=    Read Element Locator    paginas[0].paginaDoSegmento[0].odonto[5].solicitarCancelamento[6].endereco[1].inputLogradouro
    ${InputNumero}=    Read Element Locator    paginas[0].paginaDoSegmento[0].odonto[5].solicitarCancelamento[6].endereco[2].inputNumero
    ${InputBairro}=    Read Element Locator  paginas[0].paginaDoSegmento[0].odonto[5].solicitarCancelamento[6].endereco[3].inputBairro
    ${SelectEstado}=    Read Element Locator    paginas[0].paginaDoSegmento[0].odonto[5].solicitarCancelamento[6].endereco[4].selectEstado
    ${SelectCidade}=    Read Element Locator    paginas[0].paginaDoSegmento[0].odonto[5].solicitarCancelamento[6].endereco[5].selectCidade
    ${InputTelefone}=   Read Element Locator    paginas[0].paginaDoSegmento[0].odonto[5].solicitarCancelamento[7].telefone[0].inputTelefone
    ${SelectTipoTelefone}=    Read Element Locator    paginas[0].paginaDoSegmento[0].odonto[5].solicitarCancelamento[7].telefone[1].selectTipoTelefone
    ${InputCPFTitular}=    Read Element Locator    paginas[0].paginaDoSegmento[0].odonto[5].solicitarCancelamento[8].dadosBancarios[0].inputCPFTitular
    ${InputNomeDoTitular}=    Read Element Locator    paginas[0].paginaDoSegmento[0].odonto[5].solicitarCancelamento[8].dadosBancarios[1].inputNomeDoTitular
    ${SelectTipoDePagamento}=   Read Element Locator    paginas[0].paginaDoSegmento[0].odonto[5].solicitarCancelamento[8].dadosBancarios[2].selectTipoDePagamento
    ${BotaoBanco}=  Read Element Locator    paginas[0].paginaDoSegmento[0].odonto[5].solicitarCancelamento[8].dadosBancarios[3].botaoBanco
    ${TituloModalSelecioneUmBanco}=    Read Element Locator    paginas[1].modais[7].modalSelecioneUmBanco[0].tituloSelecioneUmBanco
    ${RadiobuttonBanco}=    Read Element Locator    paginas[1].modais[7].modalSelecioneUmBanco[1].radiobuttonBancoDoBrasil
    ${InputAgenciaSemDigito}=   Read Element Locator    paginas[0].paginaDoSegmento[0].odonto[5].solicitarCancelamento[8].dadosBancarios[4].inputAgenciaSemDigito
    ${Input_Conta}=    Read Element Locator    paginas[0].paginaDoSegmento[0].odonto[5].solicitarCancelamento[8].dadosBancarios[5].inputConta
    ${Input_Digito}=    Read Element Locator    paginas[0].paginaDoSegmento[0].odonto[5].solicitarCancelamento[8].dadosBancarios[6].inputDigito
    ${BotaoEnviarRequerimento}=    Read Element Locator    paginas[0].paginaDoSegmento[0].odonto[5].solicitarCancelamento[8].dadosBancarios[7].botaoEnviarRequerimento
    ${FolderPath}=  return folder path    Odonto    ${CTID}
    ${data}=    get current date    # Obtem a data e hora atual
    ${data}=    format data for screenshot    ${data}
    wait until element is visible    ${TextoCancelamento}
    capture page screenshot    ${FolderPath}//printRobot_05_${data}.png
    click button    ${BotaoAvancar}
    wait until element is enabled   ${DivTermoDeConsentimento}
    capture page screenshot    ${FolderPath}//printRobot_06_${data}.png
    scroll element into view    ${UltimaFraseDoTermo}
    click element    ${UltimaFraseDoTermo}
    press keys  None  '\ue015'  # Arrow_Down para realizar um scroll para baixo no termo
    sleep    1
    click element    ${DivLiEAceitoOsTermos}
    click button    ${BotaoAvancar}
    wait until element is visible    ${InputNomeCivil}
    ${Email}=   get value    ${InputEmail}
    ${EmailLength}=    get length    ${Email}
    run keyword if    ${EmailLength}==0    input text    ${InputEmail}    automacao@robot.com
    input text    ${InputCEP}   01311000
    press keys    None  '\ue004'    #Pressiona a tecla TAB no modal
    wait until element is enabled    ${InputLogradouro}
    ${status}=    run keyword and return status    element should be visible    ${TextoCEPInvalido}
    run keyword if    '${status}'=='True'   click element    ${InputCEP}
    run keyword if    '${status}'=='True'    press keys    None  '\ue003'
    run keyword if    '${status}'=='True'   input text    ${InputCEP}   01311000
    input text    ${InputLogradouro}    Avenida Paulista
    input text    ${InputNumero}    607
    input text    ${InputBairro}    Bela Vista
    select from list by label    ${SelectEstado}    São Paulo
    select from list by label    ${SelectCidade}    São Paulo
    input text    ${InputTelefone}  11956563333
    select from list by label    ${SelectTipoTelefone}  Celular
    input text    ${InputCPFTitular}    32788572913
    input text    ${InputNomeDoTitular}    Augusto Neves
    select from list by label    ${SelectTipoDePagamento}   Conta corrente
    click button    ${BotaoBanco}
    wait until element is visible    ${TituloModalSelecioneUmBanco}
    click element    ${RadiobuttonBanco}
    press keys    None  '\ue007'  #Pressiona a tecla ENTER
    sleep    1
    input text    ${InputAgenciaSemDigito}  1234
    input text    ${Input_Conta}   12345
    click element    ${Input_Digito}
    input text    ${Input_Digito}   6
    click button    ${BotaoEnviarRequerimento}
    capture page screenshot    ${FolderPath}//printRobot_07_${data}.png
    [Return]    ${CTID}

Entao o site processa a solicitacao apos eu confirmar o envio do requerimento
    [Arguments]    ${CTID}
    ${DivErroDeConexao}=    Read Element Locator    paginas[1].modais[8].modalErroDeConexao[0].divErroDeConexao
    ${FolderPath}=  return folder path    Odonto    ${CTID}
    ${data}=    get current date    # Obtem a data e hora atual
    ${data}=    format data for screenshot    ${data}
    run keyword and ignore error    wait until element is visible   ${DivErroDeConexao}
    page should not contain element    ${DivErroDeConexao}
    capture page screenshot    ${FolderPath}//printRobot_08_${data}.png
# --- Fim do teste: Validar a solicitacao de cancelamento de contrato na pagina de detalhes do plano ---

# ------------ Inicio do teste: Validar a exibicao do botao Imprimir na tela de detalhes da apolice ----
Entao o site exibe o botao Imprimir na pagina de detalhes do plano
    [Arguments]    ${CTID}
    ${DivImprimir}=    Read Element Locator    paginas[0].paginaDoSegmento[0].odonto[2].detalhesDoPlano[4].divImprimir
    ${FolderPath}=  return folder path    Odonto    ${CTID}
    ${data}=    get current date    # Obtem a data e hora atual
    ${data}=    format data for screenshot    ${data}
    wait until element is visible    ${DivImprimir}
    scroll element into view    ${DivImprimir}
    page should contain element    ${DivImprimir}
    capture page screenshot    ${FolderPath}//printRobot_04_${data}.png
# ------------ Fim do teste: Validar a exibicao do botao Imprimir na tela de detalhes da apolice ----

# ------------ Inicio do teste: Validar botao Utilizacao e Coparticipacao na tela de detalhes da apolice ----
    # Este teste utiliza apenas palavras chave compartilhadas
# ------------ Fim do teste: Validar botao Utilizacao e Coparticipacao na tela de detalhes da apolice ----

# ------------ Inicio do teste: Validar botao Utilizacao e Coparticipacao na tela de detalhes da apolice ----
Entao o site exibe o botao Cartao Digital na pagina de detalhes do plano
    [Arguments]    ${CTID}
    ${DivCartaoDigital}=    Read Element Locator    paginas[0].paginaDoSegmento[0].odonto[2].detalhesDoPlano[1].divCartaoDigital
    ${FolderPath}=  return folder path    Odonto    ${CTID}
    ${data}=    get current date    # Obtem a data e hora atual
    ${data}=    format data for screenshot    ${data}
    wait until element is visible    ${DivCartaoDigital}
    capture page screenshot    ${FolderPath}//printRobot_04_${data}.png
    page should contain element  ${DivCartaoDigital}
# ------------ Fim do teste: Validar botao Utilizacao e Coparticipacao na tela de detalhes da apolice ----

# ------------ Inicio do teste: Solicitar geracao de relatorio de Utilizacao e Coparticipacao por periodo na pagina de detalhes do plano ----
    # Este teste utiliza apenas palavras chave compartilhadas
# ------------ Fim do teste: Solicitar geracao de relatorio de Utilizacao e Coparticipacao por periodo na pagina de detalhes do plano ----

# ------------ Inicio do teste: Solicitar geracao de relatorio de Utilizacao e Coparticipacao por semestre na pagina de detalhes do plano ----
    # Este teste utiliza apenas palavras chave compartilhadas
# ------------ Fim do teste: Solicitar geracao de relatorio de Utilizacao e Coparticipacao por semestre na pagina de detalhes do plano ----

# ------------ Inicio do teste: Validar a funcionalidade do botao Cancelar do modal de Utilizacao e Coparticipacao na pagina de detalhes do plano ----
    # Este teste utiliza apenas palavras chave compartilhadas
# ------------ Fim do teste: Validar a funcionalidade do botao Cancelar do modal de Utilizacao e Coparticipacao na pagina de detalhes do plano ----

# ------------ Inicio do teste: Validar botao Cartao Digital na tela de detalhes do plano ----
Entao o site exibe o modal Cartao Digital
    [Arguments]    ${CTID}
    ${TituloCartaoDigital}=    Read Element Locator    paginas[1].modais[9].modalCartaoDigital[0].tituloCartaoDigital
    ${FolderPath}=  return folder path    Odonto    ${CTID}
    ${data}=    get current date    # Obtem a data e hora atual
    ${data}=    format data for screenshot    ${data}
    wait until element is visible    ${TituloCartaoDigital}
    capture page screenshot    ${FolderPath}//printRobot_05_${data}.png
    page should contain element  ${TituloCartaoDigital}
# ------------ Fim do teste: Validar botao Cartao Digital na tela de detalhes do plano ----

# ------------ Inicio do teste: Validar a exibicao do verso do Cartao digital na opcao Verso ----
Entao o site exibe o verso do cartao
    [Arguments]    ${CTID}
    ${DivAssinatura}=    Read Element Locator    paginas[1].modais[9].modalCartaoDigital[6].divAssinatura
    ${FolderPath}=  return folder path    Odonto    ${CTID}
    ${data}=    get current date    # Obtem a data e hora atual
    ${data}=    format data for screenshot    ${data}
    wait until element is visible    ${DivAssinatura}
    capture page screenshot    ${FolderPath}//printRobot_06_${data}.png
    page should contain element  ${DivAssinatura}
# ------------ Fim do teste: Validar a exibicao do verso do Cartao digital na opcao Verso ----

# ------------ Inicio do teste: Validar a exibicao da frente do Cartao digital na opcao Frente ----
E clico na opcao Frente no modal Cartao Digital
    [Arguments]    ${CTID}
    ${RadiobuttonFrente}=    Read Element Locator    paginas[1].modais[9].modalCartaoDigital[2].radiobuttonFrente
    ${FolderPath}=  return folder path    Odonto    ${CTID}
    ${data}=    get current date    # Obtem a data e hora atual
    ${data}=    format data for screenshot    ${data}
    capture page screenshot    ${FolderPath}//printRobot_06_${data}.png
    click element    ${RadiobuttonFrente}
    [Return]    ${CTID}

Entao o site exibe a frente do cartao novamente
    [Arguments]    ${CTID}
    ${DivFrenteDoCartao}=    Read Element Locator    paginas[1].modais[9].modalCartaoDigital[7].divFrenteDoCartao
    ${FolderPath}=  return folder path    Odonto    ${CTID}
    ${data}=    get current date    # Obtem a data e hora atual
    ${data}=    format data for screenshot    ${data}
    wait until element is visible    ${DivFrenteDoCartao}
    capture page screenshot    ${FolderPath}//printRobot_07_${data}.png
    page should contain element   ${DivFrenteDoCartao}
# ------------ Fim do teste: Validar a exibicao da frente do Cartao digital na opcao Frente ----

# ------------ Inicio do teste: Validar a funcionalidade do botao Voltar do modal Cartao Digital ----
E clico no botao Voltar no modal Cartao Digital
    [Arguments]    ${CTID}
    ${BotaoVoltar}=    Read Element Locator    paginas[1].modais[9].modalCartaoDigital[3].botaoVoltar
    ${FolderPath}=  return folder path    Odonto    ${CTID}
    ${data}=    get current date    # Obtem a data e hora atual
    ${data}=    format data for screenshot    ${data}
    sleep    2
    capture page screenshot    ${FolderPath}//printRobot_05_${data}.png
    click button    ${BotaoVoltar}
    [Return]    ${CTID}
# ------------ Fim do teste: Validar a funcionalidade do botao Voltar do modal Cartao Digital ----

# ------------ Inicio do teste: Validar a funcionalidade do botao OK do modal Cartao Digital ----
E clico no botao OK no modal Cartao Digital
    [Arguments]    ${CTID}
    ${BotaoOK}=    Read Element Locator    paginas[1].modais[9].modalCartaoDigital[4].botaoOK
    ${FolderPath}=  return folder path    Odonto    ${CTID}
    ${data}=    get current date    # Obtem a data e hora atual
    ${data}=    format data for screenshot    ${data}
    sleep    2
    capture page screenshot    ${FolderPath}//printRobot_05_${data}.png
    click button    ${BotaoOK}
    [Return]    ${CTID}
# ------------ Fim do teste: Validar a funcionalidade do botao OK do modal Cartao Digital ----