*** Settings ***
Library    SeleniumLibrary
Library    DateTime
Library    C:/Automação/Portal_Cliente_PF/Library/externalkeywords.py
Library    C:/Automação/Portal_Cliente_PF/Library/folders.py
Resource    C:/Automação/Portal_Cliente_PF/Resources/resourceGeneral.robot

*** Variables ***
${dataFutura}

*** Keywords ***
Dado que eu realize login com um segurado do segmento Saude
    [Documentation]    Palavra chave utilizada em todos os casos de teste deste cenario
    [Arguments]    ${CTID}
    create folder    Saude     ${CTID}
    ${FolderPath}=  return folder path    Saude    ${CTID}
    ${DivCardHeaderSaude}=    Read Element Locator    paginas[0].homeLogado[0].meusProdutos[1].saude[0].divCardHeader
    Wait Until Element Is Visible    ${DivCardHeaderSaude}
    ${data}=    get current date    # Obtem a data e hora atual
    ${data}=    format data for screenshot    ${data}
    capture page screenshot    ${FolderPath}//printRobot_01_${data}.png
    [Return]    ${CTID}

E clico no botao VER MAIS do produto Saude
    [Documentation]    Palavra chave utilizada mais de um caso de teste
    [Arguments]    ${CTID}
    ${BotaoVerMais}=    Read Element Locator    paginas[0].homeLogado[0].meusProdutos[1].saude[1].botaoVerMais
    ${DivCartao}=   Read Element Locator    paginas[0].homeLogado[0].meusProdutos[1].saude[4].divCartao
    ${DivNomeDoPlano}=    Read Element Locator    paginas[0].homeLogado[0].meusProdutos[1].saude[2].nomeDoPlano
    ${TituloSaude}=    Read Element Locator    paginas[0].paginaDoSegmento[0].saude[0].tituloSaude
    wait until element is visible    ${DivCartao}
    ${Cartao}=  get text    ${DivCartao}
    ${NumeroDoCartao}=    return card number    ${Cartao}
    ${NomeDoPlano}=    get text    ${DivNomeDoPlano}
    click element    ${BotaoVerMais}
    ${Lista}=    create list    ${CTID}    ${NumeroDoCartao}    ${NomeDoPlano}
    ${FolderPath}=  return folder path    Saude    ${CTID}
    wait until element is visible    ${TituloSaude}
    ${data}=    get current date    # Obtem a data e hora atual
    ${data}=    format data for screenshot    ${data}
    capture page screenshot    ${FolderPath}//printRobot_02_${data}.png
    [Return]    ${Lista}

Entao o site redireciona para a pagina de detalhes do plano
    [Documentation]  Palavra chave utilizada em mais de um caso de teste
    [Arguments]    ${CTID}  ${PlanoSaude}
    ${DivCartaoDigital}=    Read Element Locator    paginas[0].paginaDoSegmento[0].saude[2].detalhesDoPlano[1].divCartaoDigital
    ${FolderPath}=  return folder path    Saude    ${CTID}
    ${data}=    get current date    # Obtem a data e hora atual
    ${data}=    format data for screenshot    ${data}
    wait until element is visible    ${DivCartaoDigital}
    ${status}=    run keyword and return status    page should contain element    //span[text()='${PlanoSaude}']
    run keyword if    '${status}'=='False'   page should contain element    //span[text()=' ${PlanoSaude} ']
    run keyword if    '${status}'=='True'   page should contain element    //span[text()='${PlanoSaude}']
    capture page screenshot    ${FolderPath}//printRobot_03_${data}.png

Entao o site redireciona para a pagina de Reembolsos e Previas
    [Documentation]  Palavra chave utilizada em mais de um caso de teste
    [Arguments]    ${CTID}
    ${TituloReembolsosEPrevias}=    Read Element Locator    paginas[0].paginaDoSegmento[0].saude[3].reembolsosEPrevias[0].tituloReembolsosEPrevias
    ${FolderPath}=  return folder path    Saude    ${CTID}
    ${data}=    get current date    # Obtem a data e hora atual
    ${data}=    format data for screenshot    ${data}
    wait until element is visible    ${TituloReembolsosEPrevias}
    capture page screenshot    ${FolderPath}//printRobot_04_${data}.png
    page should contain element    ${TituloReembolsosEPrevias}

Quando clico na opcao Reembolsos e Previas no Menu Financeiro
    [Documentation]  Palavra chave utilizada em mais de um caso de teste
    [Arguments]    ${CTID}
    ${DivMenuFinanceiro}=   Read Element Locator    paginas[0].paginaDoSegmento[0].menu[0].financeiro[0]
    ${LinkMenuItemReembolsosEPrevias}=    Read Element Locator    paginas[0].paginaDoSegmento[0].menu[0].financeiro[4].linkReembolsosEPrevias
    ${FolderPath}=  return folder path    Saude    ${CTID}
    ${data}=    get current date    # Obtem a data e hora atual
    ${data}=    format data for screenshot    ${data}
    click element    ${DivMenuFinanceiro}
    wait until element is visible    ${LinkMenuItemReembolsosEPrevias}
    capture page screenshot    ${FolderPath}//printRobot_03_${data}.png
    click link    ${LinkMenuItemReembolsosEPrevias}
    [Return]    ${CTID}

E clico no menu Previa na pagina de Reembolsos e Previas
    [Documentation]  Palavra chave utilizada em mais de um caso de teste
    [Arguments]    ${CTID}
    ${LinkPrevia}=    Read Element Locator    paginas[0].paginaDoSegmento[0].saude[3].reembolsosEPrevias[2].linkPrevia
    ${FolderPath}=  return folder path    Saude    ${CTID}
    ${data}=    get current date    # Obtem a data e hora atual
    ${data}=    format data for screenshot    ${data}
    wait until element is visible    ${LinkPrevia}
    capture page screenshot    ${FolderPath}//printRobot_04_${data}.png
    click link    ${LinkPrevia}
    [Return]    ${CTID}

E clico no menu Relatorios
    [Documentation]  Palavra chave utilizada em mais de um caso de teste
    [Arguments]    ${CTID}
    ${LinkRelatorios}=    Read Element Locator    paginas[0].paginaDoSegmento[0].saude[3].reembolsosEPrevias[3].linkRelatorios
    ${FolderPath}=  return folder path    Saude    ${CTID}
    ${data}=    get current date    # Obtem a data e hora atual
    ${data}=    format data for screenshot    ${data}
    wait until element is enabled    ${LinkRelatorios}
    capture page screenshot    ${FolderPath}//printRobot_04_${data}.png
    click link    ${LinkRelatorios}
    [Return]    ${CTID}

Entao o site redireciona para a pagina de 2 via de boleto
    [Documentation]  Palavra chave utilizada em mais de um caso de teste
    [Arguments]    ${CTID}
    ${Span2ViaDeBoleto}=    Read Element Locator    paginas[0].paginaDoSegmento[0].saude[4].2ViaDeBoleto[0].span2ViaDeBoleto
    ${FolderPath}=  return folder path    Saude    ${CTID}
    ${data}=    get current date    # Obtem a data e hora atual
    ${data}=    format data for screenshot    ${data}
    Wait Until Element Is Enabled    ${Span2ViaDeBoleto}
    Page Should Contain Element    ${Span2ViaDeBoleto}
    capture page screenshot    ${FolderPath}//printRobot_05_${data}.png

E preencho os campos necessarios para gerar o informe
    [Documentation]  Palavra chave utilizada em mais de um caso de teste
    [Arguments]    ${CTID}
    ${TituloInformeDeQuitacoes}=    Read Element Locator    paginas[1].modais[14].modalInformeDeQuitacoes[0].tituloInformeDeQuitacoes
    ${TituloInformeDeQuitacao}=    Read Element Locator    paginas[1].modais[14].modalInformeDeQuitacoes[4].tituloInformeDeQuitacao
    ${SelectSegmento}=    Read Element Locator    paginas[1].modais[14].modalInformeDeQuitacoes[1].selectSegmento
    ${SelectProduto}=   Read Element Locator    paginas[1].modais[14].modalInformeDeQuitacoes[2].selectProduto
    ${SelectAnoBase}=   Read Element Locator    paginas[1].modais[14].modalInformeDeQuitacoes[3].selectAnoBase
    ${FolderPath}=  return folder path    Saude    ${CTID}
    ${data}=    get current date    # Obtem a data e hora atual
    ${data}=    format data for screenshot    ${data}
    ${status}=  run keyword and return status    wait until element is visible    ${TituloInformeDeQuitacoes}
    run keyword if    '${status}'=='False'    wait until element is visible    ${TituloInformeDeQuitacao}
    run keyword and ignore error    select from list by label    ${SelectSegmento}    Saúde
    wait until element is visible    ${SelectProduto}
    run keyword and ignore error    select from list by index    ${SelectProduto}   1
    capture page screenshot    ${FolderPath}//printRobot_04_${data}.png
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
    ${FolderPath}=    return folder path    Saude   ${CTID}
    ${data}=    get current date    # Obtem a data e hora atual
    ${data}=    format data for screenshot    ${data}
    run keyword and ignore error       wait until element is visible     ${ModalAviso}
    page should not contain element    ${ModalErroInterno}
    capture page screenshot    ${FolderPath}//printRobot_05_${data}.png

E clico no plano Saude exibido no modal Guia
    [Documentation]  Palavra chave utilizada em mais de um caso de teste
    [Arguments]    ${CTID}  ${Plano}
    Wait Until Element Is Visible    //div[text()='${Plano}']
    ${FolderPath}=  return folder path    Saude    ${CTID}
    ${data}=    get current date    # Obtem a data e hora atual
    ${data}=    format data for screenshot    ${data}
    capture page screenshot    ${FolderPath}//printRobot_04_${data}.png
    Click Element    //div[text()='${Plano}']
    [Return]    ${CTID}

Entao o site redireciona para a pagina do guia medico
    [Documentation]  Palavra chave utilizada em mais de um caso de teste
    [Arguments]    ${CTID}
    ${TituloGuiaMedico}=    Read Element Locator    paginas[5].guiaMedico[0].tituloGuiaMedico
    ${FolderPath}=  return folder path    Saude    ${CTID}
    ${data}=    get current date    # Obtem a data e hora atual
    ${data}=    format data for screenshot    ${data}
    wait until element is visible    ${TituloGuiaMedico}
    capture page screenshot    ${FolderPath}//printRobot_05_${data}.png
    page should contain element    ${TituloGuiaMedico}

Entao o site redireciona para a pagina de descontos em medicamentos
    [Documentation]    Palavra chave utilizada em mais de um caso de teste
    [Arguments]    ${CTID}
    ${TituloDescontosEmMedicamentos}=   Read Element Locator    paginas[4].descontosEmMedicamentos[0].tituloDescontosEmMedicamentos
    ${FolderPath}=  return folder path    Saude    ${CTID}
    ${data}=    get current date    # Obtem a data e hora atual
    ${data}=    format data for screenshot    ${data}
    Wait until element is visible    ${TituloDescontosEmMedicamentos}
    sleep    1
    page should contain element    ${TituloDescontosEmMedicamentos}
    capture page screenshot    ${FolderPath}//printRobot_04_${data}.png

E clico no botao Beneficios
    [Documentation]    Palavra chave utilizada em mais de um caso de teste
    [Arguments]    ${CTID}
    ${DivBeneficios}=   Read Element Locator    paginas[0].paginaDoSegmento[0].saude[2].detalhesDoPlano[2].divBeneficios
    ${FolderPath}=  return folder path    Saude    ${CTID}
    ${data}=    get current date    # Obtem a data e hora atual
    ${data}=    format data for screenshot    ${data}
    wait until element is visible    ${DivBeneficios}
    capture page screenshot    ${FolderPath}//printRobot_04_${data}.png
    click element    ${DivBeneficios}
    [Return]    ${CTID}

E clico no link do plano na coluna Produto
    [Documentation]  Palavra chave utilizada em mais de um caso de teste
    [Arguments]    ${CTID}
    ${LinkProduto}=     Read Element Locator    paginas[0].paginaDoSegmento[0].saude[1].meusPlanos[0].linkProduto
    wait until element is visible    ${LinkProduto}
    ${PlanoSaude}=     get text    ${LinkProduto}
    ${FolderPath}=  return folder path    Saude    ${CTID}
    ${data}=    get current date    # Obtem a data e hora atual
    ${data}=    format data for screenshot    ${data}
    ${Lista}=    create list    ${CTID}  ${PlanoSaude}
    capture page screenshot    ${FolderPath}//printRobot_03_${data}.png
    click link    ${LinkProduto}
    [Return]    ${Lista}

Quando clico no botao Cartao Digital na pagina de detalhes do plano
    [Documentation]  Palavra chave utilizada em mais de um caso de teste
    [Arguments]    ${CTID}
    ${DivCartaoDigital}=    Read Element Locator    paginas[0].paginaDoSegmento[0].saude[2].detalhesDoPlano[1].divCartaoDigital
    ${FolderPath}=  return folder path    Saude    ${CTID}
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
    ${ImagemFrenteCartaoDigital}=    Read Element Locator    paginas[1].modais[9].modalCartaoDigital[8].imagemFrenteCartaoDigitalSaude
    ${FolderPath}=  return folder path    Saude    ${CTID}
    ${data}=    get current date    # Obtem a data e hora atual
    ${data}=    format data for screenshot    ${data}
    wait until element is visible    ${ImagemFrenteCartaoDigital}
    click element    ${ImagemFrenteCartaoDigital}
    scroll element into view   ${RadiobuttonVerso}
    capture page screenshot    ${FolderPath}//printRobot_05_${data}.png
    click element    ${RadiobuttonVerso}
    [Return]    ${CTID}

Entao o site fecha o modal Cartao Digital
    [Documentation]  Palavra chave utilizada em mais de um caso de teste
    [Arguments]    ${CTID}
    ${BotaoVoltar}=    Read Element Locator    paginas[1].modais[9].modalCartaoDigital[3].botaoVoltar
    ${FolderPath}=  return folder path    Saude    ${CTID}
    ${data}=    get current date    # Obtem a data e hora atual
    ${data}=    format data for screenshot    ${data}
    sleep    2
    capture page screenshot    ${FolderPath}//printRobot_06_${data}.png
    ${status}=    run keyword and return status    click button    ${BotaoVoltar}
    pass execution if    '${status}'=='False'   O modal foi fechado

E clico na opcao Dados Cadastrais e Desbloqueio de Cartao no menu de acesso rapido
    [Documentation]  Palavra chave utilizada em mais de um caso de teste
    [Arguments]    ${CTID}
    ${DivDadosCadastraisEDesbloqueioDeCartao}=  Read Element Locator    paginas[0].homeLogado[0].menuAcessoRapido[7].dadosCadastraisEDesbloqueioDeCartao
    ${FolderPath}=  return folder path    Saude    ${CTID}
    ${data}=    get current date    # Obtem a data e hora atual
    ${data}=    format data for screenshot    ${data}
    capture page screenshot    ${FolderPath}//printRobot_02_${data}.png
    click element   ${DivDadosCadastraisEDesbloqueioDeCartao}
    [Return]    ${CTID}

E clico no produto Saude no modal Dados cadastrais e desbloqueio de cartao
    [Documentation]  Palavra chave utilizada em mais de um caso de teste
    [Arguments]    ${CTID}
    ${DivProduto}=   Read Element Locator    paginas[1].modais[17].modalDadosCadastraisEDesbloqueioDeCartao[0].divProduto
    ${FolderPath}=  return folder path    Saude    ${CTID}
    ${data}=    get current date    # Obtem a data e hora atual
    ${data}=    format data for screenshot    ${data}
    wait until element is enabled  ${DivProduto}
    capture page screenshot    ${FolderPath}//printRobot_03_${data}.png
    click element    ${DivProduto}
    [Return]    ${CTID}

 # ---------------- Inicio do Teste: Validar acesso aos dados do produto via botao VER MAIS do produto SAUDE ---
Entao o site redireciona para a pagina do segmento saude
    [Arguments]    ${CTID}
    ${TituloSaude}=    Read Element Locator    paginas[0].paginaDoSegmento[0].saude[0].tituloSaude
    ${FolderPath}=  return folder path    Saude    ${CTID}
    ${data}=    get current date    # Obtem a data e hora atual
    ${data}=    format data for screenshot    ${data}
    page should contain element    ${TituloSaude}
    capture page screenshot    ${FolderPath}//printRobot_03_${data}.png
 # ---------------- Fim do Teste: Validar acesso aos dados do produto via botao VER MAIS do produto SAUDE ---

 # --- Inicio do Teste: Validar acesso a apolice do usuario localizado abaixo do botao VER MAIS do produto SAUDE ---
E clico no plano localizado abaixo do botao VER MAIS
    [Arguments]    ${CTID}
    ${DivPlanoECartao}=     Read Element Locator    paginas[0].homeLogado[0].meusProdutos[1].saude[3].divPlanoECartao
    ${DivNomePlano}=    Read Element Locator    paginas[0].homeLogado[0].meusProdutos[1].saude[2].nomeDoPlano
    ${FolderPath}=  return folder path    Saude    ${CTID}
    ${data}=    get current date    # Obtem a data e hora atual
    ${data}=    format data for screenshot    ${data}
    wait until element is visible    ${DivPlanoECartao}
    ${PlanoSaude}  SeleniumLibrary.get text    ${DivNomePlano}
    ${Lista}=   create list    ${CTID}  ${PlanoSaude}
    capture page screenshot    ${FolderPath}//printRobot_02_${data}.png
    click element    ${DivPlanoECartao}
    [Return]    ${Lista}
 # --- Fim do Teste: Validar acesso a apolice do usuario localizado abaixo do botao VER MAIS do produto SAUDE ---

 # --- Inicio do Teste: Validar acesso a Reembolsos e Previas via Menu Financeiro ---
    # Este caso de teste utiliza apenas palavras chave compartilhadas
 # --- Fim do Teste: Validar acesso a Reembolsos e Previas via Menu Financeiro ---

 # --- Inicio do Teste: Validar acesso via SubMenu Previa ---
Entao o site exibe as opcoes para solicitacao de previa de reembolso
    [Arguments]    ${CTID}
    ${LinkNovaPreviaDeConsultaMedica}=    Read Element Locator    paginas[0].paginaDoSegmento[0].saude[3].reembolsosEPrevias[5].previa[0].linkNovaPreviaDeConsultaMedica
    ${LinkNovaPreviaDeOutrosProcedimentos}=    Read Element Locator    paginas[0].paginaDoSegmento[0].saude[3].reembolsosEPrevias[5].previa[1].linkNovaPreviaDeOutrosProcedimentos
    ${FolderPath}=  return folder path    Saude    ${CTID}
    ${data}=    get current date    # Obtem a data e hora atual
    ${data}=    format data for screenshot    ${data}
    wait until element is visible    ${LinkNovaPreviaDeConsultaMedica}
    capture page screenshot    ${FolderPath}//printRobot_05_${data}.png
    page should contain element    ${LinkNovaPreviaDeConsultaMedica}
    page should contain element    ${LinkNovaPreviaDeConsultaMedica}
 # --- Fim do Teste: Validar acesso via SubMenu Previa ---

 # --- Inicio do Teste: Validar a solicitacao de uma nova previa de consulta medica ---
E solicito uma nova previa de consulta medica
    [Arguments]    ${CTID}  ${NumeroDoCartao}
    ${LinkNovaPreviaDeConsultaMedica}=    Read Element Locator    paginas[0].paginaDoSegmento[0].saude[3].reembolsosEPrevias[5].previa[0].linkNovaPreviaDeConsultaMedica
    ${BotaoPaciente}=    Read Element Locator    paginas[0].paginaDoSegmento[0].saude[3].reembolsosEPrevias[5].previa[3].dadosDoProcedimento[0].botaoPaciente
    ${TituloModalSelecioneOPaciente}=   Read Element Locator    paginas[1].modais[10].modalSelecioneOPaciente[0].tituloSelecioneOPaciente
    ${CampoDataPrevistaDaConsulta}=    Read Element Locator    paginas[0].paginaDoSegmento[0].saude[3].reembolsosEPrevias[5].previa[3].dadosDoProcedimento[1].campoDataPrevistaDaConsulta
    ${BotaoCalcularPrevia}=    Read Element Locator    paginas[0].paginaDoSegmento[0].saude[3].reembolsosEPrevias[5].previa[3].dadosDoProcedimento[2].botaoCalcularPrevia
    ${BotaoEnviar}=    Read Element Locator    paginas[1].modais[11].modalEnviarSolicitacao[1].botaoEnviar
    ${TituloEnviarSolicitacao}=    Read Element Locator    paginas[1].modais[11].modalEnviarSolicitacao[0].tituloEnviarSolicitacao
    ${FolderPath}=  return folder path    Saude    ${CTID}
    ${data}=    get current date    # Obtem a data e hora atual
    ${data}=    format data for screenshot    ${data}
    wait until element is enabled    ${LinkNovaPreviaDeConsultaMedica}
    click link    ${LinkNovaPreviaDeConsultaMedica}
    wait until element is enabled    ${BotaoPaciente}
    click element    ${BotaoPaciente}
    wait until element is visible    ${TituloModalSelecioneOPaciente}
    click element    //input[@id='${NumeroDoCartao}Radio']
    capture page screenshot    ${FolderPath}//printRobot_05_${data}.png
    sleep    1
    press keys    None  '\ue004'    #Pressiona a tecla TAB no modal
    sleep    1
    press keys    None  '\ue007'  #Pressiona a tecla ENTER
    sleep    1
    ${dataAtual}=    get current date    # Obtem a data e hora atual
    ${dataAtual}=    convert date    ${dataAtual} date_format=%d.%m.%Y %H:%M   result_format=%d.%m.%Y     # Converte a data para o formato DD.MM.YYYY
    ${dataAtual}=    remove date separators    ${dataAtual} # Remove os separadores da data retornando apenas os numeros
    ${dataFutura}=  return future date    15  # retorna uma data futura de acordo com a quantidade de dias informada
    ${dataFutura}=  remove date separators    ${dataFutura}
    input text    ${CampoDataPrevistaDaConsulta}    ${dataFutura}
    capture page screenshot    ${FolderPath}//printRobot_06_${data}.png
    click button    ${BotaoCalcularPrevia}
    wait until element is visible    ${TituloEnviarSolicitacao}
    capture page screenshot    ${FolderPath}//printRobot_07_${data}.png
    click button    ${BotaoEnviar}
    [Return]    ${CTID}

Entao o site processa o calculo da previa de consulta medica
    [Arguments]    ${CTID}
    ${LinkImprimir}=     Read Element Locator    paginas[0].paginaDoSegmento[0].saude[3].reembolsosEPrevias[5].previa[4].paginaResultadoDoCalculo[0].linkImprimir
    ${FolderPath}=  return folder path    Saude    ${CTID}
    ${data}=    get current date    # Obtem a data e hora atual
    ${data}=    format data for screenshot    ${data}
    wait until element is enabled    ${LinkImprimir}
    capture page screenshot    ${FolderPath}//printRobot_08_${data}.png
    page should contain element    ${LinkImprimir}
 # --- Fim do Teste: Validar a solicitacao de uma nova previa de consulta medica ---

 # --- Inicio do Teste: Validar acesso via SubMenu Reembolsos ---
E clico no menu Reembolso na pagina de Reembolsos e Previas
    [Arguments]    ${CTID}
    ${LinkReembolso}=   Read Element Locator    paginas[0].paginaDoSegmento[0].saude[3].reembolsosEPrevias[1].linkReembolso
    ${LinkNovaPreviaDeConsultaMedica}=    Read Element Locator    paginas[0].paginaDoSegmento[0].saude[3].reembolsosEPrevias[5].previa[0].linkNovaPreviaDeConsultaMedica
    ${FolderPath}=  return folder path    Saude    ${CTID}
    ${data}=    get current date    # Obtem a data e hora atual
    ${data}=    format data for screenshot    ${data}
    wait until element is enabled    ${LinkNovaPreviaDeConsultaMedica}
    capture page screenshot    ${FolderPath}//printRobot_05_${data}.png
    click link    ${LinkReembolso}
    [Return]    ${CTID}

Entao o site exibe novamente as opcoes para solicitacao de reembolso
    [Arguments]    ${CTID}
    ${LinkNovaSolicitacaoDeReembolso}=  Read Element Locator    paginas[0].paginaDoSegmento[0].saude[3].reembolsosEPrevias[4].reembolso[0].linkNovaSolicitacaoDeReembolso
    ${FolderPath}=  return folder path    Saude    ${CTID}
    ${data}=    get current date    # Obtem a data e hora atual
    ${data}=    format data for screenshot    ${data}
    wait until element is enabled    ${LinkNovaSolicitacaoDeReembolso}
    capture page screenshot    ${FolderPath}//printRobot_06_${data}.png
    page should contain element    ${LinkNovaSolicitacaoDeReembolso}
 # --- Fim do Teste: Validar acesso via SubMenu Reembolsos ---

 # --- Inicio do Teste: Validar acesso a tabelas de reembolso ---
E clico no botao Tabelas na pagina de reembolsos
    [Arguments]    ${CTID}
    ${botaoTabelas}=    Read Element Locator    paginas[0].paginaDoSegmento[0].saude[3].reembolsosEPrevias[4].reembolso[1].botaoTabelas
    ${FolderPath}=  return folder path    Saude    ${CTID}
    ${data}=    get current date    # Obtem a data e hora atual
    ${data}=    format data for screenshot    ${data}
    wait until element is enabled   ${botaoTabelas}
    capture page screenshot    ${FolderPath}//printRobot_04_${data}.png
    click button    ${botaoTabelas}
    [Return]    ${CTID}

Entao o site abre uma nova aba redirecionando para a pagina Tabela de Reembolso
    [Arguments]    ${CTID}
    ${FolderPath}=  return folder path    Saude    ${CTID}
    ${data}=    get current date    # Obtem a data e hora atual
    ${data}=    format data for screenshot    ${data}
    ${handles}=    get window handles
    switch window    ${handles}[1]
    sleep    1
    location should be    https://seguros-unimed-arquivos-publicos.s3-sa-east-1.amazonaws.com/anexos-portal/portal-pf/tabelas-reembolso/TabelaDeReembolso2018.pdf
    capture page screenshot    ${FolderPath}//printRobot_05_${data}.png
 # --- Fim do Teste: Validar acesso a tabelas de reembolso ---

 # --- Inicio do Teste: Validar acesso via SubMenu Relatorios ---
Entao o site exibe os campos do relatorio demonstrativo de reembolso
    [Arguments]    ${CTID}
    ${BotaoBeneficiario}=    Read Element Locator    paginas[0].paginaDoSegmento[0].saude[3].reembolsosEPrevias[6].relatorios[0].demonstrativoDeReembolso[0].botaoBeneficiario
    ${FolderPath}=  return folder path    Saude    ${CTID}
    ${data}=    get current date    # Obtem a data e hora atual
    ${data}=    format data for screenshot    ${data}
    wait until element is visible    ${BotaoBeneficiario}
    capture page screenshot    ${FolderPath}//printRobot_05_${data}.png
 # --- Fim do Teste: Validar acesso via SubMenu Relatorios ---

 # --- Inicio do Teste: Validar a geracao de relatorio Demonstrativo de reembolso ---
E solicito a geracao do relatorio demostrativo de reembolso
    [Arguments]    ${CTID}  ${NumeroDoCartao}
    ${BotaoBeneficiario}=    Read Element Locator    paginas[0].paginaDoSegmento[0].saude[3].reembolsosEPrevias[6].relatorios[0].demonstrativoDeReembolso[0].botaoBeneficiario
    ${modalSelecioneOBeneficiario}=    Read Element Locator    paginas[1].modais[12].modalSelecioneOBeneficiario[0].tituloSelecioneOBeneficiario
    ${SelectPeriodo}=    Read Element Locator    paginas[0].paginaDoSegmento[0].saude[3].reembolsosEPrevias[6].relatorios[0].demonstrativoDeReembolso[1].selectPeriodo
    ${BotaoGerarRelatorio}=    Read Element Locator    paginas[0].paginaDoSegmento[0].saude[3].reembolsosEPrevias[6].relatorios[0].demonstrativoDeReembolso[2].botaoGerarRelatorio
    ${FolderPath}=  return folder path    Saude    ${CTID}
    ${data}=    get current date    # Obtem a data e hora atual
    ${data}=    format data for screenshot    ${data}
    wait until element is enabled    ${BotaoBeneficiario}
    capture page screenshot    ${FolderPath}//printRobot_05_${data}.png
    click element    ${BotaoBeneficiario}
    wait until element is visible   ${modalSelecioneOBeneficiario}
    click element    //input[@id='${NumeroDoCartao}Radio']
    capture page screenshot    ${FolderPath}//printRobot_06_${data}.png
    sleep    1
    press keys    None  '\ue004'    #Pressiona a tecla TAB no modal
    sleep    1
    press keys    None  '\ue007'  #Pressiona a tecla ENTER
    sleep    1
    select from list by label   ${SelectPeriodo}    30 dias
    capture page screenshot    ${FolderPath}//printRobot_07_${data}.png
    click button    ${BotaoGerarRelatorio}
    [Return]    ${CTID}

Entao o site processa a geracao do relatorio demonstrativo de reembolso
    [Arguments]    ${CTID}
    ${tituloModalErro}=    Read Element Locator    paginas[1].modais[13].modalErro[0].tituloModalErro
    ${DivTextoModalErro}=    Read Element Locator    paginas[1].modais[13].modalErro[1].divTexto
    ${ModalErroInterno}=    Read Element Locator    paginas[1].modais[1].modalErroInterno
    ${FolderPath}=  return folder path    Saude    ${CTID}
    ${data}=    get current date    # Obtem a data e hora atual
    ${data}=    format data for screenshot    ${data}
    run keyword and ignore error    wait until element is visible    ${tituloModalErro}
    capture page screenshot    ${FolderPath}//printRobot_08_${data}.png
    run keyword and ignore error    page should contain element   ${DivTextoModalErro}
    page should not contain element    ${ModalErroInterno}
 # --- Fim do Teste: Validar a geracao de relatorio Demonstrativo de reembolso ---

 # --- Inicio do Teste: Validar acesso ao Historico de Pagamentos via Menu Financeiro ---
Quando clico na opcao Historico de Pagamentos no menu Financeiro
    [Arguments]    ${CTID}
    ${DivMenuFinanceiro}=   Read Element Locator    paginas[0].paginaDoSegmento[0].menu[0].financeiro[0]
    ${LinkMenuItemHistoricoDePagamentos}=   Read Element Locator    paginas[0].paginaDoSegmento[0].menu[0].financeiro[1].linkHistoricoDePagamentos
    ${FolderPath}=  return folder path    Saude    ${CTID}
    ${data}=    get current date    # Obtem a data e hora atual
    ${data}=    format data for screenshot    ${data}
    click element    ${DivMenuFinanceiro}
    wait until element is visible    ${LinkMenuItemHistoricoDePagamentos}
    capture page screenshot    ${FolderPath}//printRobot_03_${data}.png
    click link    ${LinkMenuItemHistoricoDePagamentos}
    [Return]    ${CTID}

Entao o site redireciona para a pagina de Historico de Pagamentos
    [Arguments]    ${CTID}
    ${TituloHistoricoDePagamentos}=     Read Element Locator    paginas[0].paginaDoSegmento[0].saude[5].historicoDePagamentos[0].tituloHistoricoDePagamentos
    ${SelectProduto}=   Read Element Locator    paginas[0].paginaDoSegmento[0].saude[5].historicoDePagamentos[1].selectProduto
    wait until element is visible    ${SelectProduto}
    ${FolderPath}=  return folder path    Saude    ${CTID}
    ${data}=    get current date    # Obtem a data e hora atual
    ${data}=    format data for screenshot    ${data}
    page should contain element    ${TituloHistoricoDePagamentos}
    capture page screenshot    ${FolderPath}//printRobot_04_${data}.png
 # --- Fim do Teste: Validar acesso ao Historico de Pagamentos via Menu Financeiro ---

 # --- Inicio do Teste: Validar a busca de historico de pagamentos ---
E seleciono um produto e clico no botao Atualizar busca
    [Arguments]    ${CTID}
    ${SelectProduto}=   Read Element Locator    paginas[0].paginaDoSegmento[0].saude[5].historicoDePagamentos[1].selectProduto
    ${BotaoAtualizarBusca}=     Read Element Locator    paginas[0].paginaDoSegmento[0].saude[5].historicoDePagamentos[2].botaoAtualizarBusca
    ${FolderPath}=  return folder path    Saude    ${CTID}
    ${data}=    get current date    # Obtem a data e hora atual
    ${data}=    format data for screenshot    ${data}
    wait until element is visible    ${SelectProduto}
    select from list by index    ${SelectProduto}  1
    capture page screenshot    ${FolderPath}//printRobot_04_${data}.png
    click button    ${BotaoAtualizarBusca}
    [Return]    ${CTID}

Entao o site processa a busca de historico de pagamentos
    [Arguments]    ${CTID}
    ${DivTextoPadraoAntesDaBusca}=  Read Element Locator    paginas[0].paginaDoSegmento[0].saude[5].historicoDePagamentos[3].divTextoPadraoAntesDaBusca
    ${FolderPath}=  return folder path    Saude    ${CTID}
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
    ${FolderPath}=  return folder path    Saude    ${CTID}
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
    ${FolderPath}=  return folder path    Saude    ${CTID}
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
    ${FolderPath}=  return folder path    Saude    ${CTID}
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
    ${FolderPath}=  return folder path    Saude    ${CTID}
    ${data}=    get current date    # Obtem a data e hora atual
    ${data}=    format data for screenshot    ${data}
    wait until element is visible    ${SelectAnoBase}
    wait until element is visible    ${SelectProduto}
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
    ${FolderPath}=  return folder path    Saude    ${CTID}
    ${data}=    get current date    # Obtem a data e hora atual
    ${data}=    format data for screenshot    ${data}
    wait until element is not visible    ${SelectAnoBase}
    run keyword and ignore error    wait until element is visible    ${TituloModalAviso}
    page should not contain element    ${DivErroInterno}
    capture page screenshot    ${FolderPath}//printRobot_05_${data}.png
 # --- Fim do teste: Validar acesso ao Informe de Rendimentos via Menu Financeiro ---

 # --- Inicio do teste: Validar acesso ao Informe de Quitacoes via Menu Financeiro ---
Quando clico na opcao Informe de Quitacoes no menu Financeiro
    [Arguments]    ${CTID}
    ${DivMenuFinanceiro}=   Read Element Locator    paginas[0].paginaDoSegmento[0].menu[0].financeiro[0]
    ${BotaoInformeDeQuitacoes}=    Read Element Locator    paginas[0].paginaDoSegmento[0].menu[0].financeiro[5].botaoInformeDeQuitacoes
    ${FolderPath}=  return folder path    Saude    ${CTID}
    ${data}=    get current date    # Obtem a data e hora atual
    ${data}=    format data for screenshot    ${data}
    click element    ${DivMenuFinanceiro}
    wait until element is visible    ${BotaoInformeDeQuitacoes}
    capture page screenshot    ${FolderPath}//printRobot_03_${data}.png
    click button    ${BotaoInformeDeQuitacoes}
    [Return]    ${CTID}
 # --- Fim do teste: Validar acesso ao Informe de Quitacoes via Menu Financeiro ---

 # --- Inicio do teste: Validar acesso ao Guia Medico via Menu de Informacoes ---
Quando clico na opcao Guia Medico no menu Informacoes
    [Arguments]    ${CTID}
    ${DivMenuInformacoes}=  Read Element Locator    paginas[0].paginaDoSegmento[0].menu[0].informacoes[0]
    ${BotaoGuiaMedico}=    Read Element Locator    paginas[0].paginaDoSegmento[0].menu[0].informacoes[3].botaoGuiaMedico
    ${FolderPath}=  return folder path    Saude    ${CTID}
    ${data}=    get current date    # Obtem a data e hora atual
    ${data}=    format data for screenshot    ${data}
    click element    ${DivMenuInformacoes}
    wait until element is visible    ${BotaoGuiaMedico}
    capture page screenshot    ${FolderPath}//printRobot_03_${data}.png
    click button    ${BotaoGuiaMedico}
    [Return]    ${CTID}
 # --- Fim do teste: Validar acesso ao Guia Medico via Menu de Informacoes ---

 # --- Inicio do teste: Validar acesso ao Descontos em Medicamentos via Menu de Informacoes ---
Quando clico na opcao Descontos em medicamentos no menu Informacoes
    [Arguments]    ${CTID}
    ${DivMenuInformacoes}=  Read Element Locator    paginas[0].paginaDoSegmento[0].menu[0].informacoes[0]
    ${LinkItemMenuDescontosEmMedicamentos}=     Read Element Locator    paginas[0].paginaDoSegmento[0].menu[0].informacoes[2].descontosEmMedicamentos[0].linkDescontosEmMedicamentos
    ${FolderPath}=  return folder path    Saude    ${CTID}
    ${data}=    get current date    # Obtem a data e hora atual
    ${data}=    format data for screenshot    ${data}
    click element    ${DivMenuInformacoes}
    wait until element is visible    ${LinkItemMenuDescontosEmMedicamentos}
    capture page screenshot    ${FolderPath}//printRobot_03_${data}.png
    click link    ${LinkItemMenuDescontosEmMedicamentos}
    [Return]    ${CTID}
 # --- Fim do teste: Validar acesso ao Descontos em Medicamentos via Menu de Informacoes ---

 # --- Inicio do teste: Validar acesso a Perguntas Frequentes via Menu de Informacoes ---
Quando clico na opcao Perguntas Frequentes no menu Informacoes
    [Arguments]    ${CTID}
    ${DivMenuInformacoes}=  Read Element Locator    paginas[0].paginaDoSegmento[0].menu[0].informacoes[0]
    ${LinkPerguntasFrequentes}=    Read Element Locator    paginas[0].paginaDoSegmento[0].menu[0].informacoes[4].linkPerguntasFrequentes
    ${FolderPath}=  return folder path    Saude    ${CTID}
    ${data}=    get current date    # Obtem a data e hora atual
    ${data}=    format data for screenshot    ${data}
    click element    ${DivMenuInformacoes}
    wait until element is visible    ${LinkPerguntasFrequentes}
    capture page screenshot    ${FolderPath}//printRobot_03_${data}.png
    click link    ${LinkPerguntasFrequentes}
    [Return]    ${CTID}

Entao o site abre uma nova aba redirecionando para a pagina da faq de Saude
    [Arguments]    ${CTID}
    ${TituloPerguntasMaisProcuradasEmSaude}=    Read Element Locator    paginas[6].faqSaude[0].tituloPerguntasMaisProcuradasEmSaude
    ${FolderPath}=  return folder path    Saude    ${CTID}
    ${data}=    get current date    # Obtem a data e hora atual
    ${data}=    format data for screenshot    ${data}
    switch window    title:FAQ | Seguros Unimed
    wait until element is visible    ${TituloPerguntasMaisProcuradasEmSaude}
    capture page screenshot    ${FolderPath}//printRobot_04_${data}.png
    page should contain element    ${TituloPerguntasMaisProcuradasEmSaude}
 # --- Fim do teste: Validar acesso a Perguntas Frequentes via Menu de Informacoes ---

 # --- Inicio do teste: Validar acesso aos MEUS PLANOS via hyperlink localizada na coluna produtos ---
    # Este caso de teste utiliza apenas palavras chave compartilhadas
 # --- Fim do teste: Validar acesso aos MEUS PLANOS via hyperlink localizada na coluna produtos ---

 #--- Inicio do teste: Validar a funcionalidade do botao Beneficios na pagina de detalhes do plano ----
Entao o site exibe o modal Beneficios do plano
    [Arguments]    ${CTID}
    ${TituloBeneficiosDoPlano}=    Read Element Locator    paginas[1].modais[15].modalBeneficiosDoPlano[0].tituloBeneficiosDoPlano
    ${BotaoVerDetalhes}=    Read Element Locator    paginas[1].modais[15].modalBeneficiosDoPlano[1].botaoVerDetalhes
    ${FolderPath}=  return folder path    Saude    ${CTID}
    ${data}=    get current date    # Obtem a data e hora atual
    ${data}=    format data for screenshot    ${data}
    wait until element is visible    ${TituloBeneficiosDoPlano}
    wait until element is enabled    ${BotaoVerDetalhes}
    capture page screenshot    ${FolderPath}//printRobot_05_${data}.png
    page should contain element    ${TituloBeneficiosDoPlano}
 #--- Fim do teste: Validar a funcionalidade do botao Beneficios na pagina de detalhes do plano ----

 #--- Inicio do teste: Validar a exibicao dos detalhes de beneficio na pagina de detalhes do plano ----
Quando clico no botao Ver Detalhes no modal Beneficios do plano
    [Arguments]    ${CTID}
    ${TituloBeneficiosDoPlano}=    Read Element Locator    paginas[1].modais[15].modalBeneficiosDoPlano[0].tituloBeneficiosDoPlano
    ${BotaoVerDetalhes}=    Read Element Locator    paginas[1].modais[15].modalBeneficiosDoPlano[1].botaoVerDetalhes
    ${FolderPath}=  return folder path    Saude    ${CTID}
    ${data}=    get current date    # Obtem a data e hora atual
    ${data}=    format data for screenshot    ${data}
    wait until element is visible    ${TituloBeneficiosDoPlano}
    wait until element is enabled    ${BotaoVerDetalhes}
    capture page screenshot    ${FolderPath}//printRobot_05_${data}.png
    click button    ${BotaoVerDetalhes}
    [Return]    ${CTID}

Entao o site exibe o modal Detalhes do beneficio
    [Arguments]    ${CTID}
    ${TituloDetalhesDoBeneficio}=   Read Element Locator    paginas[1].modais[16].modalDetalhesDoBeneficio[0].tituloDetalhesDoBeneficio
    ${DivMensagem}=    Read Element Locator    paginas[1].modais[16].modalDetalhesDoBeneficio[1].divMensagem
    ${FolderPath}=  return folder path    Saude    ${CTID}
    ${data}=    get current date    # Obtem a data e hora atual
    ${data}=    format data for screenshot    ${data}
    wait until element is visible    ${TituloDetalhesDoBeneficio}
    run keyword and ignore error    wait until element is visible    ${DivMensagem}
    capture page screenshot    ${FolderPath}//printRobot_06_${data}.png
    page should contain element    ${TituloDetalhesDoBeneficio}
 #--- Fim do teste: Validar a exibicao dos detalhes de beneficio na pagina de detalhes do plano ----

 #--- Inicio do teste: Validar a funcionalidade do botao Cartao Digital na pagina de detalhes do plano ----
Entao o site exibe o modal Cartao Digital
    [Arguments]    ${CTID}
    ${TituloCartaoDigital}=    Read Element Locator    paginas[1].modais[9].modalCartaoDigital[0].tituloCartaoDigital
    ${FolderPath}=  return folder path    Saude    ${CTID}
    ${data}=    get current date    # Obtem a data e hora atual
    ${data}=    format data for screenshot    ${data}
    wait until element is visible    ${TituloCartaoDigital}
    capture page screenshot    ${FolderPath}//printRobot_05_${data}.png
    page should contain element  ${TituloCartaoDigital}
 #--- Fim do teste: Validar a funcionalidade do botao Cartao Digital na pagina de detalhes do plano ----

 # ------------ Inicio do teste: Validar a exibicao do verso do Cartao digital na opcao Verso ----
Entao o site exibe o verso do cartao
    [Arguments]    ${CTID}
    ${DivBlackBar}=    Read Element Locator    paginas[1].modais[9].modalCartaoDigital[9].divBlackBarVersoCartaoDigitalSaude
    ${FolderPath}=  return folder path    Saude    ${CTID}
    ${data}=    get current date    # Obtem a data e hora atual
    ${data}=    format data for screenshot    ${data}
    wait until element is visible    ${DivBlackBar}
    capture page screenshot    ${FolderPath}//printRobot_06_${data}.png
    page should contain element  ${DivBlackBar}
 # ------------ Fim do teste: Validar a exibicao do verso do Cartao digital na opcao Verso ----

 # ------------ Inicio do teste: Validar a exibicao da frente do Cartao digital na opcao Frente ----
E clico na opcao Frente no modal Cartao Digital
    [Arguments]    ${CTID}
    ${RadiobuttonFrente}=    Read Element Locator    paginas[1].modais[9].modalCartaoDigital[2].radiobuttonFrente
    ${FolderPath}=  return folder path    Saude    ${CTID}
    ${data}=    get current date    # Obtem a data e hora atual
    ${data}=    format data for screenshot    ${data}
    capture page screenshot    ${FolderPath}//printRobot_06_${data}.png
    click element    ${RadiobuttonFrente}
    [Return]    ${CTID}

Entao o site exibe a frente do cartao novamente
    [Arguments]    ${CTID}
    ${ImagemFrenteCartaoDigital}=    Read Element Locator    paginas[1].modais[9].modalCartaoDigital[8].imagemFrenteCartaoDigitalSaude
    ${FolderPath}=  return folder path    Saude    ${CTID}
    ${data}=    get current date    # Obtem a data e hora atual
    ${data}=    format data for screenshot    ${data}
    wait until element is visible    ${ImagemFrenteCartaoDigital}
    capture page screenshot    ${FolderPath}//printRobot_07_${data}.png
    page should contain element   ${ImagemFrenteCartaoDigital}
 # ------------ Fim do teste: Validar a exibicao da frente do Cartao digital na opcao Frente ----

 # ------------ Inicio do teste: Validar a funcionalidade do botao Voltar do modal Cartao Digital ----
E clico no botao Voltar no modal Cartao Digital
    [Arguments]    ${CTID}
    ${BotaoVoltar}=    Read Element Locator    paginas[1].modais[9].modalCartaoDigital[3].botaoVoltar
    ${FolderPath}=  return folder path    Saude    ${CTID}
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
    ${FolderPath}=  return folder path    Saude    ${CTID}
    ${data}=    get current date    # Obtem a data e hora atual
    ${data}=    format data for screenshot    ${data}
    sleep    2
    capture page screenshot    ${FolderPath}//printRobot_05_${data}.png
    click button    ${BotaoOK}
    [Return]    ${CTID}
 # ------------ Fim do teste: Validar a funcionalidade do botao OK do modal Cartao Digital ----

 # --- Inicio do teste: Validar acesso ao Manual do Beneficiario na tela de detalhes da apolice ---
E clico na opcao Manual do Beneficiario
    [Arguments]    ${CTID}
    ${BotaoManualDoBeneficiario}=   Read Element Locator    paginas[0].paginaDoSegmento[0].saude[2].detalhesDoPlano[3].botaoManualDoBeneficiario
    ${FolderPath}=  return folder path    Saude    ${CTID}
    ${data}=    get current date    # Obtem a data e hora atual
    ${data}=    format data for screenshot    ${data}
    wait until element is enabled    ${BotaoManualDoBeneficiario}
    capture page screenshot    ${FolderPath}//printRobot_04_${data}.png
    click button    ${BotaoManualDoBeneficiario}
    [Return]    ${CTID}

Entao o site exibe o modal Manual do Beneficiario para baixar o doc
    [Arguments]    ${CTID}
    ${DivBaixeSeuManualdoBeneficiarioEmPDF}=    Read Element Locator    paginas[1].modais[6].modalManualDoBeneficiario[0].divBaixeSeuManualDoBeneficiárioEmPDF
    ${FolderPath}=  return folder path    Saude    ${CTID}
    ${data}=    get current date    # Obtem a data e hora atual
    ${data}=    format data for screenshot    ${data}
    wait until element is visible    ${DivBaixeSeuManualdoBeneficiarioEmPDF}
    page should contain element    ${DivBaixeSeuManualdoBeneficiarioEmPDF}
    capture page screenshot    ${FolderPath}//printRobot_05_${data}.png
 # --- Fim do teste: Validar acesso ao Manual do Beneficiario na tela de detalhes da apolice ---

 # --- Inicio do teste: Validar a exibicao do botao Solicitar cancelamento na pagina de detalhes do plano ---
Entao o site exibe o botao Solicitar Cancelamento na pagina de detalhes do plano
    [Arguments]    ${CTID}
    ${DivSolicitarCancelamento}=    Read Element Locator    paginas[0].paginaDoSegmento[0].saude[2].detalhesDoPlano[4].divSolicitarCancelamento
    wait until element is visible    ${DivSolicitarCancelamento}
    ${FolderPath}=  return folder path    Saude    ${CTID}
    ${data}=    get current date    # Obtem a data e hora atual
    ${data}=    format data for screenshot    ${data}
    scroll element into view    ${DivSolicitarCancelamento}
    ${data}=    get current date    # Obtem a data e hora atual
    ${data}=    format data for screenshot    ${data}
    page should contain element    ${DivSolicitarCancelamento}
    capture page screenshot    ${FolderPath}//printRobot_04_${data}.png
 # --- Fim do teste: Validar a exibicao do botao Solicitar cancelamento na pagina de detalhes do plano ---

 # --- Inicio do teste: Validar a solicitacao de cancelamento de contrato na pagina de detalhes do plano ---
Quando clico na opcao Solicitar Cancelamento
    [Arguments]    ${CTID}
    ${DivSolicitarCancelamento}=    Read Element Locator    paginas[0].paginaDoSegmento[0].saude[2].detalhesDoPlano[4].divSolicitarCancelamento
    ${FolderPath}=  return folder path    Saude    ${CTID}
    ${data}=    get current date    # Obtem a data e hora atual
    ${data}=    format data for screenshot    ${data}
    wait until element is enabled    ${DivSolicitarCancelamento}
    scroll element into view    ${DivSolicitarCancelamento}
    capture page screenshot    ${FolderPath}//printRobot_04_${data}.png
    click element    ${DivSolicitarCancelamento}
    [Return]    ${CTID}

E preencho todas a informacoes para enviar o requirimento
    [Arguments]    ${CTID}
    ${BotaoAvancar}=     Read Element Locator   paginas[0].paginaDoSegmento[0].saude[6].solicitarCancelamento[0].botaoAvancar
    ${TextoCancelamento}=    Read Element Locator    paginas[0].paginaDoSegmento[0].saude[6].solicitarCancelamento[1].textoCancelamento
    ${DivTermoDeConsentimento}=    Read Element Locator    paginas[0].paginaDoSegmento[0].saude[6].solicitarCancelamento[2].divTermoDeConsentimento
    ${UltimaFraseDoTermo}=  Read Element Locator    paginas[0].paginaDoSegmento[0].saude[6].solicitarCancelamento[3].ultimaFraseDoTermo
    ${DivLiEAceitoOsTermos}=   Read Element Locator    paginas[0].paginaDoSegmento[0].saude[6].solicitarCancelamento[4].divLiEAceitoOsTermos
    ${InputNomeCivil}=  Read Element Locator    paginas[0].paginaDoSegmento[0].saude[6].solicitarCancelamento[5].dadosDoSeguradoTitular[0].inputNomeCivil
    ${InputEmail}=  Read Element Locator    paginas[0].paginaDoSegmento[0].saude[6].solicitarCancelamento[5].dadosDoSeguradoTitular[1].inputEmail
    ${InputCEP}=    Read Element Locator    paginas[0].paginaDoSegmento[0].saude[6].solicitarCancelamento[6].endereco[0].inputCEP
    ${TextoCEPInvalido}=    Read Element Locator    paginas[0].paginaDoSegmento[0].saude[6].solicitarCancelamento[6].endereco[6].textoCEPInvalido
    ${InputLogradouro}=    Read Element Locator    paginas[0].paginaDoSegmento[0].saude[6].solicitarCancelamento[6].endereco[1].inputLogradouro
    ${InputNumero}=    Read Element Locator    paginas[0].paginaDoSegmento[0].saude[6].solicitarCancelamento[6].endereco[2].inputNumero
    ${InputBairro}=    Read Element Locator  paginas[0].paginaDoSegmento[0].saude[6].solicitarCancelamento[6].endereco[3].inputBairro
    ${SelectEstado}=    Read Element Locator    paginas[0].paginaDoSegmento[0].saude[6].solicitarCancelamento[6].endereco[4].selectEstado
    ${SelectCidade}=    Read Element Locator    paginas[0].paginaDoSegmento[0].saude[6].solicitarCancelamento[6].endereco[5].selectCidade
    ${InputTelefone}=   Read Element Locator    paginas[0].paginaDoSegmento[0].saude[6].solicitarCancelamento[7].telefone[0].inputTelefone
    ${SelectTipoTelefone}=    Read Element Locator    paginas[0].paginaDoSegmento[0].saude[6].solicitarCancelamento[7].telefone[1].selectTipoTelefone
    ${InputCPFTitular}=    Read Element Locator    paginas[0].paginaDoSegmento[0].saude[6].solicitarCancelamento[8].dadosBancarios[0].inputCPFTitular
    ${InputNomeDoTitular}=    Read Element Locator    paginas[0].paginaDoSegmento[0].saude[6].solicitarCancelamento[8].dadosBancarios[1].inputNomeDoTitular
    ${SelectTipoDePagamento}=   Read Element Locator    paginas[0].paginaDoSegmento[0].saude[6].solicitarCancelamento[8].dadosBancarios[2].selectTipoDePagamento
    ${BotaoBanco}=  Read Element Locator    paginas[0].paginaDoSegmento[0].saude[6].solicitarCancelamento[8].dadosBancarios[3].botaoBanco
    ${TituloModalSelecioneUmBanco}=    Read Element Locator    paginas[1].modais[7].modalSelecioneUmBanco[0].tituloSelecioneUmBanco
    ${RadiobuttonBanco}=    Read Element Locator    paginas[1].modais[7].modalSelecioneUmBanco[1].radiobuttonBancoDoBrasil
    ${InputAgenciaSemDigito}=   Read Element Locator    paginas[0].paginaDoSegmento[0].saude[6].solicitarCancelamento[8].dadosBancarios[4].inputAgenciaSemDigito
    ${Input_Conta}=    Read Element Locator    paginas[0].paginaDoSegmento[0].saude[6].solicitarCancelamento[8].dadosBancarios[5].inputConta
    ${Input_Digito}=    Read Element Locator    paginas[0].paginaDoSegmento[0].saude[6].solicitarCancelamento[8].dadosBancarios[6].inputDigito
    ${BotaoEnviarRequerimento}=    Read Element Locator    paginas[0].paginaDoSegmento[0].saude[6].solicitarCancelamento[8].dadosBancarios[7].botaoEnviarRequerimento
    ${FolderPath}=  return folder path    Saude    ${CTID}
    ${data}=    get current date    # Obtem a data e hora atual
    ${data}=    format data for screenshot    ${data}
    wait until element is enabled    ${TextoCancelamento}
    capture page screenshot    ${FolderPath}//printRobot_05_${data}.png
    click element    ${TextoCancelamento}
    click button    ${BotaoAvancar}
    wait until element is enabled   ${DivTermoDeConsentimento}
    capture page screenshot    ${FolderPath}//printRobot_06_${data}.png
    scroll element into view    ${UltimaFraseDoTermo}
    click element    ${UltimaFraseDoTermo}
    press keys  None  '\ue015'  # Arrow_Down para realizar um scroll para baixo no termo
    sleep    1
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
    ${FolderPath}=  return folder path    Saude    ${CTID}
    ${data}=    get current date    # Obtem a data e hora atual
    ${data}=    format data for screenshot    ${data}
    run keyword and ignore error    wait until element is visible   ${DivErroDeConexao}
    page should not contain element    ${DivErroDeConexao}
    capture page screenshot    ${FolderPath}//printRobot_08_${data}.png
 # --- Fim do teste: Validar a solicitacao de cancelamento de contrato na pagina de detalhes do plano ---

 # --- Inicio do teste: Validar acesso aos Dados Cadastrais e Desbloqueio De Cartao via menu acesso rapido ---
Entao o site redireciona para a pagina de dados cadastrais
    [Arguments]    ${CTID}
    ${TituloDadosCadastraisEDesbloqueioDeCartao}=   Read Element Locator    paginas[7].dadosCadastrais[0].tituloDadosCadastraisEDesbloqueioDeCartao
    ${SubtituloDadosDoCartao}=  Read Element Locator    paginas[7].dadosCadastrais[1].subtituloDadosDoCartao
    ${FolderPath}=  return folder path    Saude    ${CTID}
    ${data}=    get current date    # Obtem a data e hora atual
    ${data}=    format data for screenshot    ${data}
    wait until element is visible   ${TituloDadosCadastraisEDesbloqueioDeCartao}
    wait until element is visible   ${SubtituloDadosDoCartao}
    capture page screenshot    ${FolderPath}//printRobot_04_${data}.png
    page should contain element   ${SubtituloDadosDoCartao}
 # --- Fim do teste: Validar acesso aos Dados Cadastrais e Desbloqueio De Cartao via menu acesso rapido ---

 # --- Inicio do teste: Validar a atualizacao cadastral e desbloqueio de cartao via menu acesso rapido ---
Quando atualizo os dados cadastrais e confirmo
    [Arguments]    ${CTID}
    ${CampoNomeCompleto}=   Read Element Locator    paginas[7].dadosCadastrais[2].campoNomeCompleto
    ${CampoCpf}=    Read Element Locator    paginas[7].dadosCadastrais[3].campoCpf
    ${CampoDataDeNascimento}=   Read Element Locator    paginas[7].dadosCadastrais[4].campoDataDeNascimento
    ${SelectSexo}=    Read Element Locator    paginas[7].dadosCadastrais[5].selectSexo
    ${CampoNomeDaMae}=    Read Element Locator    paginas[7].dadosCadastrais[6].campoNomeDaMae
    ${CampoEnderecoResidencial}=    Read Element Locator    paginas[7].dadosCadastrais[7].campoEnderecoResidencial
    ${CampoCep}=    Read Element Locator    paginas[1].modais[19].modalEndereco[0].campoCep
    ${CampoLogradouro}=    Read Element Locator    paginas[1].modais[19].modalEndereco[1].campoLogradouro
    ${CampoNumero}=     Read Element Locator    paginas[1].modais[19].modalEndereco[2].campoNumero
    ${CampoBairro}=    Read Element Locator    paginas[1].modais[19].modalEndereco[3].campoBairro
    ${SelectCidade}=    Read Element Locator    paginas[1].modais[19].modalEndereco[4].selectCidade
    ${SelectEstado}=    Read Element Locator    paginas[1].modais[19].modalEndereco[5].selectEstado
    ${BotaoConfirmar}=    Read Element Locator    paginas[1].modais[19].modalEndereco[6].botaoConfirmar
    ${CampoCns}=    Read Element Locator    paginas[7].dadosCadastrais[8].campoCns
    ${SelectEstadoCivil}=    Read Element Locator    paginas[7].dadosCadastrais[9].selectEstadoCivil
    ${CampoDdiCelular}=    Read Element Locator    paginas[7].dadosCadastrais[10].campoDdiCelular
    ${CampoCelular}=    Read Element Locator    paginas[7].dadosCadastrais[11].campoCelular
    ${CampoEmail}=    Read Element Locator    paginas[7].dadosCadastrais[12].campoEmail
    ${BotaoDesbloquearESalvarAlteracoes}=   Read Element Locator    paginas[7].dadosCadastrais[13].botaoDesbloquearESalvarAlteracoes
    ${FolderPath}=  return folder path    Saude    ${CTID}
    ${data}=    get current date    # Obtem a data e hora atual
    ${data}=    format data for screenshot    ${data}
    wait until element is enabled    ${CampoNomeCompleto}
   # ${length}=  get length    ${CampoNomeCompleto}
    #run keyword if    '${length}'==0    input text    ${CampoNomeCompleto}  Robovaldo de Automação Robot
   # ${length}=  get length  ${campoCpf}
    # run keyword if    '${length}'==0    input text    ${campoCpf}   55432189313
    # ${length}=  get length  ${CampoDataDeNascimento}
    # run keyword if    '${length}'==0    input text    ${CampoDataDeNascimento}    16051985
    # select from list by label    ${SelectSexo}    Masculino
    ${length}=  get length  ${CampoNomeDaMae}
    run keyword if    '${length}'==0    input text    ${CampoNomeDaMae}    Robotica de Automação Robot
    click element    ${CampoEnderecoResidencial}
    wait until element is enabled    ${CampoCep}
    ${length}=  get length  ${CampoCep}
    run keyword if    '${length}'==0    input text    ${CampoCep}   01311000
    wait until element is visible    ${CampoLogradouro}
    run keyword if    '${length}'==0    input text    ${CampoLogradouro}    Avenida Paulista
    run keyword if    '${length}'==0    input text    ${CampoNumero}    607
    run keyword if    '${length}'==0    input text    ${CampoBairro}    Bela Vista
    run keyword if    '${length}'==0    select from list by label    ${SelectEstado}    São Paulo
    run keyword if    '${length}'==0    select from list by label    ${SelectCidade}    São Paulo
    click button    ${BotaoConfirmar}
    wait until element is not visible    ${BotaoConfirmar}
    run keyword if    '${length}'==0    input text    ${CampoCns}   259792934720000
    select from list by label    ${SelectEstadoCivil}   SOLTEIRO
    ${length}=  get length  ${CampoDdiCelular}
    run keyword if    '${length}'==0    input text    ${CampoDdiCelular}    55
    ${length}=  get length  ${CampoCelular}
    run keyword if    '${length}'==0    input text    ${CampoCelular}   11956432285
    ${length}=  get length  ${CampoEmail}
    run keyword if    '${length}'==0    input text    ${CampoEmail}    robovaldo@robot.rb
    capture page screenshot    ${FolderPath}//printRobot_04_${data}.png
    click button    ${BotaoDesbloquearESalvarAlteracoes}
    [Return]    ${CTID}

Entao o site informa o numero de protocolo referente a atualizacao cadastral
    [Arguments]    ${CTID}
    ${TituloOperacaoConcluida}=    Read Element Locator    paginas[1].modais[18].modalOperacaoConcluida[0].tituloOperacaoConcluida
    ${DivNumeroDoProtocolo}=    Read Element Locator    paginas[1].modais[18].modalOperacaoConcluida[1].divNumeroDoProtocolo
    ${FolderPath}=  return folder path    Saude    ${CTID}
    ${data}=    get current date    # Obtem a data e hora atual
    ${data}=    format data for screenshot    ${data}
    wait until element is not visible    ${TituloOperacaoConcluida}
    wait until element is visible    ${DivNumeroDoProtocolo}
    capture page screenshot    ${FolderPath}//printRobot_05_${data}.png
    page should contain element    ${DivNumeroDoProtocolo}
    ${protocolo}=   get text    ${DivNumeroDoProtocolo}
    save protocol number    ${FolderPath}   ${data}    ${protocolo}
 # --- Fim do teste: Validar a atualizacao cadastral e desbloqueio de cartao via menu acesso rapido ---

 # --- Inicio do teste: Validar acesso a Reembolsos e Previas via menu acesso rapido ---
E clico na opcao Reembolsos e Previas no menu de acesso rapido
    [Arguments]    ${CTID}
    ${DivReembolsoEPrevias}=    Read Element Locator    paginas[0].homeLogado[0].menuAcessoRapido[8].reembolsoEPrevias
    ${FolderPath}=  return folder path    Saude    ${CTID}
    ${data}=    get current date    # Obtem a data e hora atual
    ${data}=    format data for screenshot    ${data}
    capture page screenshot    ${FolderPath}//printRobot_02_${data}.png
    click element    ${DivReembolsoEPrevias}
    [Return]    ${CTID}
 # --- Fim do teste: Validar acesso a Reembolsos e Previas via menu acesso rapido ---

# ----------------- Inicio do teste: Validar acesso a 2 Via de boleto via menu acesso rapido ----
E clico na opcao 2 via de boleto no menu de acesso rapido
    [Arguments]    ${CTID}
    ${Div2ViaDeBoleto}=     Read Element Locator    paginas[0].homeLogado[0].menuAcessoRapido[0].2ViaDeBoleto
    ${FolderPath}=  return folder path    Saude    ${CTID}
    ${data}=    get current date    # Obtem a data e hora atual
    ${data}=    format data for screenshot    ${data}
    capture page screenshot    ${FolderPath}//printRobot_02_${data}.png
    Click Element    ${Div2ViaDeBoleto}
    [Return]    ${CTID}

E seleciono o segmento Saude, um produto e confirmo
    [Arguments]    ${CTID}
    ${SelectSegmento}=  Read Element Locator    paginas[1].modais[3].modalSelecionarProduto[0].selectSegmento
    ${SelectProduto}=   Read Element Locator    paginas[1].modais[3].modalSelecionarProduto[1].selectProduto
    ${BotaoConfirmar}=  Read Element Locator    paginas[1].modais[3].modalSelecionarProduto[2].botaoConfirmar
    ${FolderPath}=  return folder path    Saude    ${CTID}
    ${data}=    get current date    # Obtem a data e hora atual
    ${data}=    format data for screenshot    ${data}
    Wait Until Element Is Visible    ${SelectSegmento}
    Select From List By Label    ${SelectSegmento}    Saúde
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
    ${FolderPath}=  return folder path    Saude    ${CTID}
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
    ${FolderPath}=  return folder path    Saude    ${CTID}
    ${data}=    get current date    # Obtem a data e hora atual
    ${data}=    format data for screenshot    ${data}
    Wait Until Element Is Visible    ${SelectSegmento}
    run keyword and ignore error    Select From List By Label    ${SelectSegmento}    Saúde
    Wait Until Element Is Visible    ${SelectProduto}
    select from list by index   ${SelectProduto}    1
    capture page screenshot    ${FolderPath}//printRobot_03_${data}.png
    Click Button    ${BotaoGerarInforme}
    [Return]    ${CTID}

Entao o site exibe o modal de aviso
    [Arguments]    ${CTID}
    ${ModalAviso}=  Read Element Locator    paginas[1].modais[0].modalAviso
    Wait Until Element Is Visible    ${ModalAviso}
    ${FolderPath}=  return folder path    Saude    ${CTID}
    ${data}=    get current date    # Obtem a data e hora atual
    ${data}=    format data for screenshot    ${data}
    capture page screenshot    ${FolderPath}//printRobot_04_${data}.png
 # ----------------- Fim do teste: Validar acesso ao Informe de Rendimentos via menu acesso rapido ----

 # ----------------- Inicio do teste: Validar acesso ao Informe de Quitacoes via menu acesso rapido ----
E clico na opcao Informe de Quitacoes no menu acesso rapido
    [Arguments]    ${CTID}
    ${DivInformeDeQuitacoes}=   Read Element Locator    paginas[0].homeLogado[0].menuAcessoRapido[9].informeDeQuitacoes
    ${FolderPath}=  return folder path    Saude    ${CTID}
    ${data}=    get current date    # Obtem a data e hora atual
    ${data}=    format data for screenshot    ${data}
    scroll element into view    ${DivInformeDeQuitacoes}
    capture page screenshot    ${FolderPath}//printRobot_02_${data}.png
    click element    ${DivInformeDeQuitacoes}
    [Return]    ${CTID}
 # ----------------- Fim do teste: Validar acesso ao Informe de Quitacoes via menu acesso rapido ----

 # ------------ Inicio do teste: Validar acesso aos Descontos em Medicamentos via menu acesso rapido ----
E clico na opcao Descontos em Medicamentos no menu de acesso rapido
    [Arguments]    ${CTID}
    ${FolderPath}=  return folder path    Saude    ${CTID}
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
    ${FolderPath}=  return folder path    Saude    ${CTID}
    ${data}=    get current date    # Obtem a data e hora atual
    ${data}=    format data for screenshot    ${data}
    capture page screenshot    ${FolderPath}//printRobot_02_${data}.png
    click element    ${DivClubeDeVantagens}
    [Return]    ${CTID}

Quando clico no botao Acessar Clube de Vantagens no modal Clube de Vantagens
    [Arguments]    ${CTID}
    ${BotaoAcessarClubeDeVantagens}=    Read Element Locator    paginas[1].modais[5].modalClubeDeVantagens[0].botaoAcessarClubeDeVantagens
    ${FolderPath}=  return folder path    Saude    ${CTID}
    ${data}=    get current date    # Obtem a data e hora atual
    ${data}=    format data for screenshot    ${data}
    wait until element is enabled   ${BotaoAcessarClubeDeVantagens}
    capture page screenshot    ${FolderPath}//printRobot_03_${data}.png
    click button    ${BotaoAcessarClubeDeVantagens}
    [Return]    ${CTID}

Entao o site abre uma nova aba redirecionando para a pagina do Clube de Vantagens
    [Arguments]    ${CTID}
    switch window    title:Clube de Vantagens Seguros Unimed
    ${FolderPath}=  return folder path    Saude    ${CTID}
    ${data}=    get current date    # Obtem a data e hora atual
    ${data}=    format data for screenshot    ${data}
    location should be    https://clubedevantagens.segurosunimed.com.br/
    capture page screenshot    ${FolderPath}//printRobot_04_${data}.png
 # ------------ Fim do teste: Validar acesso ao Clube de vantagens via menu acesso rapido ----

 # ----------------- Inicio do teste: Validar acesso ao Guia Medico e Odontológico via menu acesso rapido ----
E clico na opcao Guia Medico e Odontologico no menu de acesso rapido
    [Arguments]    ${CTID}
    ${BotaoGuiaMedicoEOdontologico}=    Read Element Locator    paginas[0].homeLogado[0].menuAcessoRapido[4].guiaMedicoEOdontologico
    ${PlanoOdontoEmMeusProdutos}=   Read Element Locator    paginas[0].homeLogado[0].meusProdutos[1].saude[2].nomeDoPlano
    wait until element is visible    ${PlanoOdontoEmMeusProdutos}
    ${PlanoOdonto}=   get text    ${PlanoOdontoEmMeusProdutos}
    ${lista}=   create list    ${CTID}  ${PlanoOdonto}
    ${FolderPath}=  return folder path    Saude    ${CTID}
    ${data}=    get current date    # Obtem a data e hora atual
    ${data}=    format data for screenshot    ${data}
    Click Element    ${BotaoGuiaMedicoEOdontologico}
    capture page screenshot    ${FolderPath}//printRobot_02_${data}.png
    [Return]    ${lista}
 # ----------------- Fim do teste: Validar acesso ao Guia Medico e Odontológico via menu acesso rapido ----

 # ----------------- Inicio do teste: Validar acesso aos Ouvidoria via menu acesso rapido ----
E clico na opcao Ouvidoria no menu de acesso rapido
    [Arguments]    ${CTID}
    ${DivOuvidoria}=    Read Element Locator    paginas[0].homeLogado[0].menuAcessoRapido[5].ouvidoria
    ${FolderPath}=  return folder path    Saude    ${CTID}
    ${data}=    get current date    # Obtem a data e hora atual
    ${data}=    format data for screenshot    ${data}
    capture page screenshot    ${FolderPath}//printRobot_02_${data}.png
    click element    ${DivOuvidoria}
    [Return]    ${CTID}

Entao o site abre uma nova aba redirecionando para a pagina de Ouvidoria
    [Arguments]    ${CTID}
    switch window    title:Ouvidoria | Seguros Unimed - Cuidar para Transformar
    ${TituloOuvidoria}=     Read Element Locator    paginas[2].ouvidoria[0].tituloOuvidoria
    ${FolderPath}=  return folder path    Saude    ${CTID}
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
    ${FolderPath}=  return folder path    Saude    ${CTID}
    ${data}=    get current date    # Obtem a data e hora atual
    ${data}=    format data for screenshot    ${data}
    capture page screenshot    ${FolderPath}//printRobot_02_${data}.png
    click element    ${DivSimuladorDePrevidencia}
    [Return]    ${CTID}

Entao o site abre uma nova aba redirecionando para a pagina do Simulador de Previdencia
    [Arguments]    ${CTID}
    switch window    title:Simulador de Previdência | Seguros Unimed
    ${SpanIniciarSimulacao}=    Read Element Locator    paginas[3].simuladorPrevidencia[0].spanIniciarSimulacao
    ${FolderPath}=  return folder path    Saude    ${CTID}
    ${data}=    get current date    # Obtem a data e hora atual
    ${data}=    format data for screenshot    ${data}
    wait until element is visible    ${SpanIniciarSimulacao}
    page should contain element    ${SpanIniciarSimulacao}
    capture page screenshot    ${FolderPath}//printRobot_03_${data}.png
 # ------- Fim do teste: Validar acesso aos Simulador de Previdencia via menu acesso rapido ----