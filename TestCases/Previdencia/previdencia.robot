*** Settings ***
Library    SeleniumLibrary
Resource    C:/Automação/Portal_Cliente_PF/Resources/resourceGeneral.robot
Resource    C:/Automação/Portal_Cliente_PF/Resources/resourcePrevidencia.robot
Test Setup    Realizar login e maximizar a janela   Previdencia
Test Teardown    Close Browser

*** Test Cases ***
Validar acesso a 2 Via de boleto via menu acesso rapido
    [Tags]    CT124  RegressivoFull  RegressivoPrev
    ${CTID}=    Dado que eu realize login com um segurado do segmento Previdencia    CT-124
    ${CTID}=    E clico na opcao 2 via de boleto no menu de acesso rapido   ${CTID}
    ${CTID}=    E seleciono o segmento Vida, um produto e confirmo    ${CTID}
    Entao o site redireciona para a pagina de 2 via de boleto   ${CTID}

Validar acesso ao Informe de Rendimentos via menu acesso rapido
    [Tags]    CT125  RegressivoFull  RegressivoPrev    Smoke   SmokePrev
    ${CTID}=    Dado que eu realize login com um segurado do segmento Previdencia    CT-125
    ${CTID}=    E clico na opcao Informe de Rendimentos no menu de acesso rapido    ${CTID}
    ${CTID}=    E no modal de informe de rendimentos seleciono o segmento Saude, um produto e confirmo    ${CTID}
    Entao o site exibe o modal de aviso    ${CTID}

Validar acesso ao Clube de Vantagens via menu acesso rapido
    [Tags]    CT126  RegressivoFull  RegressivoPrev    Smoke   SmokePrev
    ${CTID}=    Dado que eu realize login com um segurado do segmento Previdencia    CT-126
    ${CTID}=    E clico na opcao Clube de Vantagens no menu de acesso rapido    ${CTID}
    ${CTID}=    Quando clico no botao Acessar Clube de Vantagens no modal Clube de Vantagens    ${CTID}
    Entao o site abre uma nova aba redirecionando para a pagina do Clube de Vantagens   ${CTID}

Validar acesso a Ouvidoria via menu acesso rapido
    [Tags]    CT127  RegressivoFull  RegressivoPrev    Smoke   SmokePrev
    ${CTID}=    Dado que eu realize login com um segurado do segmento Previdencia    CT-127
    ${CTID}=    E clico na opcao Ouvidoria no menu de acesso rapido    ${CTID}
    Entao o site abre uma nova aba redirecionando para a pagina de Ouvidoria    ${CTID}

Validar acesso ao Simulador de Previdencia via menu acesso rapido
    [Tags]    CT128  RegressivoFull  RegressivoPrev    Smoke   SmokePrev
    ${CTID}=    Dado que eu realize login com um segurado do segmento Previdencia    CT-128
    ${CTID}=    E clico na opcao Simulador de Previdencia no menu de acesso rapido    ${CTID}
    Entao o site abre uma nova aba redirecionando para a pagina do Simulador de Previdencia    ${CTID}

Validar acesso aos dados do produto via botao VER MAIS do produto PREV
    [Tags]    CT130  RegressivoFull  RegressivoPrev    Smoke   SmokePrev
    ${CTID}=    Dado que eu realize login com um segurado do segmento Previdencia    CT-130
    ${CTID}=    E clico no botao VER MAIS do produto Previdencia    ${CTID}
    Entao o site redireciona para a pagina do segmento previdencia    ${CTID}

Validar acesso ao hyperlink Ver Propostas do usuario localizado abaixo do botao VER MAIS do produto PREV
    [Tags]    CT131  RegressivoFull  RegressivoPrev    Smoke   SmokePrev
    ${CTID}=    Dado que eu realize login com um segurado do segmento Previdencia    CT-131
    ${CTID}=    E clico no link Ver propostas localizado abaixo dos saldos de propostas    ${CTID}
    Entao o site redireciona para a pagina do segmento previdencia exibindo as propostas    ${CTID}

Validar acesso ao Historico de Pagamentos via Menu Financeiro
    [Tags]    CT137  RegressivoFull  RegressivoPrev    Smoke   SmokePrev
    ${CTID}=    Dado que eu realize login com um segurado do segmento Previdencia    CT-137
    ${CTID}=    E clico no botao VER MAIS do produto Previdencia    ${CTID}
    ${CTID}=    Quando clico na opcao Historico de Pagamentos no menu Financeiro    ${CTID}
    Entao o site redireciona para a pagina de Historico de Pagamentos   ${CTID}

Validar a busca de historico de pagamentos
    [Tags]    CT138  RegressivoFull  RegressivoPrev    Smoke   SmokePrev
    ${CTID}=    Dado que eu realize login com um segurado do segmento Previdencia    CT-138
    ${CTID}=    E clico no botao VER MAIS do produto Previdencia    ${CTID}
    ${CTID}=    Quando clico na opcao Historico de Pagamentos no menu Financeiro    ${CTID}
    ${CTID}=    E seleciono um produto e clico no botao Atualizar busca    ${CTID}
    ${CTID}=    Entao o site processa a busca de historico de pagamentos    ${CTID}

Validar acesso a 2 via de boleto via Menu Financeiro
    [Tags]    CT139  RegressivoFull  RegressivoPrev    Smoke   SmokePrev
    ${CTID}=    Dado que eu realize login com um segurado do segmento Previdencia    CT-139
    ${CTID}=    E clico no botao VER MAIS do produto Previdencia    ${CTID}
    ${CTID}=    Quando clico na opcao 2 via de boleto no menu Financeiro    ${CTID}
    ${CTID}=    E seleciono o produto e clico no botao Confirmar    ${CTID}
    Entao o site redireciona para a pagina de 2 via de boleto   ${CTID}

Validar acesso ao Informe de Rendimentos via Menu Financeiro
    [Tags]    CT140  RegressivoFull  RegressivoPrev    Smoke   SmokePrev
    ${CTID}=    Dado que eu realize login com um segurado do segmento Previdencia    CT-140
    ${CTID}=    E clico no botao VER MAIS do produto Previdencia    ${CTID}
    ${CTID}=    Quando clico na opcao Informe de Rendimentos no menu Financeiro    ${CTID}
    ${CTID}=    E confirmo a geracao do informe no modal Informe de Rendimentos    ${CTID}
    Entao o site processa a solicitacao do informe de rendimentos   ${CTID}

Validar acesso ao Simulador via Menu Financeiro
    [Tags]    CT141  RegressivoFull  RegressivoPrev    Smoke   SmokePrev
    ${CTID}=    Dado que eu realize login com um segurado do segmento Previdencia    CT-141
    ${CTID}=    E clico no botao VER MAIS do produto Previdencia    ${CTID}
    ${CTID}=    Quando clico na opcao Simulador no menu Financeiro  ${CTID}
    Entao o site abre uma nova aba redirecionando para a pagina do Simulador de Previdencia    ${CTID}

Validar acesso a Perguntas Frequentes (FAQ) via Menu Informacoes
    [Tags]    CT143  RegressivoFull  RegressivoPrev    Smoke   SmokePrev
    ${CTID}=    Dado que eu realize login com um segurado do segmento Previdencia    CT-143
    ${CTID}=    E clico no botao VER MAIS do produto Previdencia    ${CTID}
    ${CTID}=    Quando clico na opcao Perguntas Frequentes no menu Informacoes    ${CTID}
    Entao o site abre uma nova aba redirecionando para a pagina da faq de Previdencia    ${CTID}

Validar Exibicao do Saldo Total do produto localizado em Composicao da Reserva
    [Tags]     CT145  RegressivoFull  RegressivoPrev    Smoke   SmokePrev
    ${CTID}=    Dado que eu realize login com um segurado do segmento Previdencia    CT-145
    ${CTID}=    E clico no botao VER MAIS do produto Previdencia    ${CTID} 
    Entao o site redireciona para a pagina da previdencia com o saldo total da composicao da reserva   ${CTID}

Validar Exibicao do Saldo individual do produto localizado em Composicao da Reserva
    [Tags]     CT146  RegressivoFull  RegressivoPrev    Smoke   SmokePrev
    ${CTID}=    Dado que eu realize login com um segurado do segmento Previdencia    CT-146
    ${CTID}=    E clico no botao VER MAIS do produto Previdencia    ${CTID}
    Entao o site redireciona para a pagina da previdencia com o saldo individual da composicao da reserva   ${CTID}

Validar Exibição do Saldo Empresarial do produto em Composição da Reserva
    [Tags]     CT147 RegressivoFull  RegressivoPrev    Smoke   SmokePrev
    ${CTID}=    Dado que eu realize login com um segurado do segmento Previdencia    CT-147
    ${CTID}=    E clico no botao VER MAIS do produto Previdencia    ${CTID}
    Entao o site redireciona para a pagina da previdencia com o saldo empresarial da composicao da reserva


Validar a funcionalidade do botão Ocultar Dados (Olho) do produto PREV localizado em Composição da Reserva
    [Tags]     CT149  RegressivoFull  RegressivoPrev    Smoke   SmokePrev
    ${CTID}=    Dado que eu realize login com um segurado do segmento Previdencia    CT-149
    ${CTID}=    E clico no botao VER MAIS do produto Previdencia    ${CTID} 
    ${CTID}=    Quando clico no botão ocultar dados           ${CTID} 
    Entao o site oculta os valores da composicao da reserva     ${CTID}



Validar Exibição do Grid Rentabilidade de Fundos
    [Tags]     CT150  RegressivoFull  RegressivoPrev    Smoke   SmokePrev
    ${CTID}=    Dado que eu realize login com um segurado do segmento Previdencia    CT-150
    ${CTID}=    E clico no botao VER MAIS do produto Previdencia      ${CTID}
    Entao o site redireciona para a pagina da previdencia com o grid de rentabilidade de fundos      ${CTID}