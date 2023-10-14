*** Settings ***
Library    SeleniumLibrary
Resource    C:/Automação/Portal_Cliente_PF/Resources/resourceGeneral.robot
Resource    C:/Automação/Portal_Cliente_PF/Resources/resourceRE.robot
Test Setup    Realizar login e maximizar a janela   RE
Test Teardown    Close Browser

*** Test Cases ***
Validar acesso a 2 Via de boleto via menu acesso rapido
    [Tags]    CT99  RegressivoFull  RegressivoRE    Smoke   SmokeRE
    ${CTID}=    Dado que eu realize login com um segurado do segmento RE    CT-99
    ${CTID}=    E clico na opcao 2 via de boleto no menu de acesso rapido   ${CTID}
    ${CTID}=    E seleciono o segmento Vida, um produto e confirmo    ${CTID}
    Entao o site redireciona para a pagina de 2 via de boleto   ${CTID}

Validar acesso ao Informe de Quitacoes via menu acesso rapido
    [Tags]    CT100  RegressivoFull  RegressivoRE    Smoke   SmokeRE
    ${CTID}=    Dado que eu realize login com um segurado do segmento RE    CT-100
    ${CTID}=    E clico na opcao Informe de Quitacoes no menu acesso rapido    ${CTID}
    ${CTID}=    E preencho os campos necessarios para gerar o informe   ${CTID}
    Entao o site processa a solicitacao do informe de quitacoes    ${CTID}

Validar acesso aos Clube de Vantagens via menu acesso rapido
    [Tags]    CT101  RegressivoFull  RegressivoRE    Smoke   SmokeRE
    ${CTID}=    Dado que eu realize login com um segurado do segmento RE    CT-101
    ${CTID}=    E clico na opcao Clube de Vantagens no menu de acesso rapido    ${CTID}
    ${CTID}=    Quando clico no botao Acessar Clube de Vantagens no modal Clube de Vantagens    ${CTID}
    Entao o site abre uma nova aba redirecionando para a pagina do Clube de Vantagens   ${CTID}

Validar acesso a Ouvidoria via menu acesso rapido
    [Tags]    CT103  RegressivoFull  RegressivoRE    Smoke   SmokeRE
    ${CTID}=    Dado que eu realize login com um segurado do segmento RE    CT-103
    ${CTID}=    E clico na opcao Ouvidoria no menu de acesso rapido    ${CTID}
    Entao o site abre uma nova aba redirecionando para a pagina de Ouvidoria    ${CTID}

Validar acesso ao Simulador de Previdencia via menu acesso rapido
    [Tags]    CT104  RegressivoFull  RegressivoRE    Smoke   SmokeRE
    ${CTID}=    Dado que eu realize login com um segurado do segmento RE    CT-104
    ${CTID}=    E clico na opcao Simulador de Previdencia no menu de acesso rapido    ${CTID}
    Entao o site abre uma nova aba redirecionando para a pagina do Simulador de Previdencia    ${CTID}

Validar acesso aos dados do produto via botao VER MAIS do produto RE
    [Tags]    CT105  RegressivoFull  RegressivoRE    Smoke   SmokeRE
    ${CTID}=    Dado que eu realize login com um segurado do segmento RE    CT-105
    ${Lista}=    E clico no botao VER MAIS do produto RE    ${CTID}
    Entao o site redireciona para a pagina do segmento RE   ${Lista[0]}

Validar acesso a apolice do usuario localizado abaixo do botao VER MAIS do produto RE
    [Tags]    CT106  RegressivoFull  RegressivoRE    Smoke   SmokeRE
    ${CTID}=    Dado que eu realize login com um segurado do segmento RE    CT-106
    ${Lista}=   E clico no plano localizado abaixo do botao VER MAIS    ${CTID}
    Entao o site redireciona para a pagina de detalhes do plano     ${Lista[0]}     ${Lista[1]}

Validar acesso Historico de Pagamentos via Menu Financeiro
    [Tags]    CT107  RegressivoFull  RegressivoRE    Smoke   SmokeRE
    ${CTID}=    Dado que eu realize login com um segurado do segmento RE    CT-107
    ${Lista}=    E clico no botao VER MAIS do produto RE    ${CTID}
    ${CTID}=    Quando clico na opcao Historico de Pagamentos no menu Financeiro    ${Lista[0]}
    Entao o site redireciona para a pagina de Historico de Pagamentos   ${CTID}

Validar a busca de historico de pagamentos
    [Tags]    CT108  RegressivoFull  RegressivoRE    Smoke   SmokeRE
    ${CTID}=    Dado que eu realize login com um segurado do segmento RE    CT-108
    ${Lista}=    E clico no botao VER MAIS do produto RE    ${CTID}
    ${CTID}=    Quando clico na opcao Historico de Pagamentos no menu Financeiro    ${Lista[0]}
    ${CTID}=    E seleciono um produto e clico no botao Atualizar busca    ${CTID}
    Entao o site processa a busca de historico de pagamentos    ${CTID}

Validar acesso 2 via de boleto via Menu Financeiro
    [Tags]    CT111  RegressivoFull  RegressivoRE    Smoke   SmokeRE
    ${CTID}=    Dado que eu realize login com um segurado do segmento RE    CT-111
    ${Lista}=    E clico no botao VER MAIS do produto RE    ${CTID}
    ${CTID}=    Quando clico na opcao 2 via de boleto no menu Financeiro    ${Lista[0]}
    ${CTID}=    E seleciono o produto e clico no botao Confirmar    ${CTID}
    Entao o site redireciona para a pagina de 2 via de boleto   ${CTID}

Validar acesso ao Informe de Quitacoes via Menu Financeiro
    [Tags]    CT112  RegressivoFull  RegressivoRE    Smoke   SmokeRE
    ${CTID}=    Dado que eu realize login com um segurado do segmento RE    CT-112
    ${Lista}=    E clico no botao VER MAIS do produto RE    ${CTID}
    ${CTID}=    Quando clico na opcao Informe de Quitacoes no menu Financeiro   ${Lista[0]}
    ${CTID}=    E preencho os campos necessarios para gerar o informe   ${CTID}
    Entao o site processa a solicitacao do informe de quitacoes    ${CTID}

Validar acesso a Perguntas Frequentes (FAQ) via Menu Informacoes
    [Tags]    CT115  RegressivoFull  RegressivoRE    Smoke   SmokeRE
    ${CTID}=    Dado que eu realize login com um segurado do segmento RE    CT-115
    ${Lista}=    E clico no botao VER MAIS do produto RE    ${CTID}
    ${CTID}=    Quando clico na opcao Perguntas Frequentes no menu Informacoes    ${Lista[0]}
    Entao o site abre uma nova aba redirecionando para a pagina da faq do RE    ${CTID}

Validar acesso aos MEUS PLANOS via hyperlink localizada na coluna produtos
    [Tags]    CT117  RegressivoFull  RegressivoRE    Smoke   SmokeRE
    ${CTID}=    Dado que eu realize login com um segurado do segmento RE    CT-117
    ${Lista}=    E clico no botao VER MAIS do produto RE    ${CTID}
    ${Lista}=   E clico no link do plano na coluna Produto    ${Lista[0]}
    Entao o site redireciona para a pagina de detalhes do plano    ${Lista[0]}    ${Lista[1]}

Validar a exibicao dos dados da Apolice
    [Tags]    CT118  RegressivoFull  RegressivoRE    Smoke   SmokeRE
    ${CTID}=    Dado que eu realize login com um segurado do segmento RE    CT-118
    ${Lista}=    E clico no botao VER MAIS do produto RE    ${CTID}
    ${Lista}=   E clico no link do plano na coluna Produto    ${Lista[0]}
    Entao o site exibe os dados da apolice  ${Lista[0]}    ${Lista[2]}