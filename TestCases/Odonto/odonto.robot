*** Settings ***
Library    SeleniumLibrary
Resource    C:/Automação/Portal_Cliente_PF/Resources/resourceGeneral.robot
Resource    C:/Automação/Portal_Cliente_PF/Resources/resourceOdonto.robot
Test Setup    Realizar login e maximizar a janela   Odonto
Test Teardown    Close Browser

*** Test Case ***
Validar acesso a 2 Via de boleto via menu acesso rapido
    [Tags]    CT01  RegressivoFull  RegressivoOdonto    Smoke   SmokeOdonto
    ${CTID}=    Dado que eu realize login com um segurado do segmento Odonto    CT-01
    ${CTID}=    E clico na opcao 2 via de boleto no menu de acesso rapido   ${CTID}
    ${CTID}=    E seleciono o segmento Odonto, um produto e confirmo    ${CTID}
    Entao o site redireciona para a pagina de 2 via de boleto   ${CTID}

Validar acesso ao Informe de Rendimentos via menu acesso rapido
    [Tags]    CT02  RegressivoFull  RegressivoOdonto    Smoke   SmokeOdonto
    ${CTID}=    Dado que eu realize login com um segurado do segmento Odonto    CT-02
    ${CTID}=    E clico na opcao Informe de Rendimentos no menu de acesso rapido    ${CTID}
    ${CTID}=    E no modal de informe de rendimentos seleciono o segmento Odonto, um produto e confirmo    ${CTID}
    Entao o site exibe o modal de aviso    ${CTID}

Validar acesso aos Descontos em Medicamentos via menu acesso rapido
    [Tags]    CT03  RegressivoFull  RegressivoOdonto    Smoke   SmokeOdonto
    ${CTID}=    Dado que eu realize login com um segurado do segmento Odonto    CT-03
    ${CTID}=    E clico na opcao Descontos em Medicamentos no menu de acesso rapido    ${CTID}
    Entao o site redireciona para a pagina de descontos em medicamentos    ${CTID}

Validar acesso ao Clube de vantagens via menu acesso rapido
    [Tags]    CT04  RegressivoFull  RegressivoOdonto    Smoke   SmokeOdonto
    ${CTID}=    Dado que eu realize login com um segurado do segmento Odonto    CT-04
    ${CTID}=    E clico na opcao Clube de Vantagens no menu de acesso rapido    ${CTID}
    ${CTID}=    Quando clico no botao Acessar Clube de Vantagens no modal Clube de Vantagens    ${CTID}
    Entao o site abre uma nova aba redirecionando para a pagina do Clube de Vantagens   ${CTID}

Validar acesso ao Guia Medico e Odontologico via menu acesso rapido
    [Tags]    CT05  RegressivoFull  RegressivoOdonto    Smoke   SmokeOdonto
    ${CTID}=    Dado que eu realize login com um segurado do segmento Odonto    CT-05
    ${Lista}=  E clico na opcao Guia Medico e Odontologico no menu de acesso rapido    ${CTID}
    ${CTID}=    E clico no plano Odonto exibido no modal Guia   ${Lista[0]}     ${Lista[1]}
    Entao o site abre uma nova aba redirecionando para a pagina da Unimed Odonto    ${CTID}

Validar acesso aos Ouvidoria via menu acesso rapido
    [Tags]    CT06  RegressivoFull  RegressivoOdonto    Smoke   SmokeOdonto
    ${CTID}=    Dado que eu realize login com um segurado do segmento Odonto    CT-06
    ${CTID}=    E clico na opcao Ouvidoria no menu de acesso rapido    ${CTID}
    Entao o site abre uma nova aba redirecionando para a pagina de Ouvidoria    ${CTID}

Validar acesso aos Simulador de Previdencia via menu acesso rapido
    [Tags]    CT07  RegressivoFull  RegressivoOdonto    Smoke   SmokeOdonto
    ${CTID}=    Dado que eu realize login com um segurado do segmento Odonto    CT-07
    ${CTID}=    E clico na opcao Simulador de Previdencia no menu de acesso rapido    ${CTID}
    Entao o site abre uma nova aba redirecionando para a pagina do Simulador de Previdencia    ${CTID}

Validar acesso aos dados do produto via botao VER MAIS do produto Odonto
    [Tags]    CT08  RegressivoFull  RegressivoOdonto    Smoke   SmokeOdonto
    ${CTID}=    Dado que eu realize login com um segurado do segmento Odonto    CT-08
    ${CTID}=    E clico no botao VER MAIS do produto Odonto    ${CTID}
    Entao o site redireciona para a pagina do segmento odonto   ${CTID}

Validar acesso a apolice do usuario localizado abaixo do botao VER MAIS do produto Odonto
    [Tags]    CT09  RegressivoFull  RegressivoOdonto    Smoke   SmokeOdonto
    ${CTID}=    Dado que eu realize login com um segurado do segmento Odonto    CT-09
    ${Lista}=   E clico no plano localizado abaixo do botao VER MAIS    ${CTID}
    Entao o site redireciona para a pagina de detalhes do plano     ${Lista[0]}     ${Lista[1]}

Validar acesso ao Historico de Pagamentos via Menu Financeiro
    [Tags]    CT10  RegressivoFull  RegressivoOdonto    Smoke   SmokeOdonto
    ${CTID}=    Dado que eu realize login com um segurado do segmento Odonto    CT-10
    ${CTID}=    E clico no botao VER MAIS do produto Odonto     ${CTID}
    ${CTID}=    Quando clico na opcao Historico de Pagamentos no menu Financeiro    ${CTID}
    Entao o site redireciona para a pagina de Historico de Pagamentos   ${CTID}

Validar detalhes do historico de pagamentos
    [Tags]    CT11  RegressivoFull  RegressivoOdonto    Smoke   SmokeOdonto
    ${CTID}=    Dado que eu realize login com um segurado do segmento Odonto    CT-11
    ${CTID}=    E clico no botao VER MAIS do produto Odonto    ${CTID}
    ${CTID}=    Quando clico na opcao Historico de Pagamentos no menu Financeiro    ${CTID}
    ${CTID}=    E seleciono um produto e clico no botao Atualizar busca    ${CTID}
    Entao o site processa a busca de historico de pagamentos    ${CTID}

Validar acesso a 2 via de boleto via Menu Financeiro
    [Tags]    CT12  RegressivoFull  RegressivoOdonto    Smoke   SmokeOdonto
    ${CTID}=    Dado que eu realize login com um segurado do segmento Odonto    CT-12
    ${CTID}=    E clico no botao VER MAIS do produto Odonto    ${CTID}
    ${CTID}=    Quando clico na opcao 2 via de boleto no menu Financeiro    ${CTID}
    ${CTID}=    E seleciono o produto e clico no botao Confirmar    ${CTID}
    Entao o site redireciona para a pagina de 2 via de boleto   ${CTID}

Validar acesso ao Informe de Rendimentos via Menu Financeiro
    [Tags]    CT13  RegressivoFull  RegressivoOdonto    Smoke   SmokeOdonto
    ${CTID}=    Dado que eu realize login com um segurado do segmento Odonto    CT-13
    ${CTID}=    E clico no botao VER MAIS do produto Odonto     ${CTID}
    ${CTID}=    Quando clico na opcao Informe de Rendimentos no menu Financeiro     ${CTID}
    ${CTID}=    E confirmo a geracao do informe no modal Informe de Rendimentos     ${CTID}
    Entao o site processa a solicitacao do informe de rendimentos       ${CTID}

Validar acesso ao Utilizacao e Coparticipacao via Menu de Relatorios
    [Tags]    CT14  RegressivoFull  RegressivoOdonto    Smoke   SmokeOdonto
    ${CTID}=    Dado que eu realize login com um segurado do segmento Odonto    CT-14
    ${CTID}=    E clico no botao VER MAIS do produto Odonto    ${CTID}
    ${CTID}=    Quando clico na opcao Utilizacao e Coparticipacao no menu Relatorios    ${CTID}
    Entao o site exibe o modal com campos para gerar o relatorio de Utilizacao e Coparticipacao    ${CTID}

Solicitar geracao de relatorio de Utilizacao e Coparticipacao por periodo via Menu Relatorios
    [Tags]    CT15  RegressivoFull  RegressivoOdonto    Smoke   SmokeOdonto
    ${CTID}=    Dado que eu realize login com um segurado do segmento Odonto    CT-15
    ${CTID}=    E clico no botao VER MAIS do produto Odonto    ${CTID}
    ${CTID}=    Quando clico na opcao Utilizacao e Coparticipacao no menu Relatorios    ${CTID}
    ${CTID}=    E solicito o relatorio por periodo    ${CTID}
    Entao o site processa a solicitacao do relatorio de Utilizacao e Coparticipacao    ${CTID}

Solicitar geracao de relatorio de Utilizacao e Coparticipacao por semestre via Menu Relatorios
    [Tags]    CT16  RegressivoFull  RegressivoOdonto    Smoke   SmokeOdonto
    ${CTID}=    Dado que eu realize login com um segurado do segmento Odonto    CT-16
    ${CTID}=    E clico no botao VER MAIS do produto Odonto    ${CTID}
    ${CTID}=    Quando clico na opcao Utilizacao e Coparticipacao no menu Relatorios    ${CTID}
    ${CTID}=    E solicito o relatorio por semestre    ${CTID}
    Entao o site processa a solicitacao do relatorio de Utilizacao e Coparticipacao    ${CTID}

Validar a funcionalidade do botao Cancelar do modal de Utilizacao e Coparticipacao via Menu Relatorios
    [Tags]    CT17  RegressivoFull  RegressivoOdonto    Smoke   SmokeOdonto
    ${CTID}=    Dado que eu realize login com um segurado do segmento Odonto    CT-17
    ${CTID}=    E clico no botao VER MAIS do produto Odonto    ${CTID}
    ${CTID}=    Quando clico na opcao Utilizacao e Coparticipacao no menu Relatorios    ${CTID}
    ${CTID}=    E clico no botao Cancelar do modal de Utilizacao e Coparticipacao    ${CTID}
    Entao o site fecha o modal de Utilizacao e Coparticipacao    ${CTID}

Validar acesso a Rede Credenciada via Menu de Informacoes
    [Tags]    CT18  RegressivoFull  RegressivoOdonto    Smoke   SmokeOdonto
    ${CTID}=    Dado que eu realize login com um segurado do segmento Odonto    CT-18
    ${CTID}=    E clico no botao VER MAIS do produto Odonto    ${CTID}
    ${CTID}=    Quando clico na opcao Rede Credenciada no menu Informacoes    ${CTID}
    Entao o site abre uma nova aba redirecionando para a pagina da Unimed Odonto    ${CTID}

Validar acesso a Descontos em Medicamentos via Menu de Informacoes
    [Tags]    CT19  RegressivoFull  RegressivoOdonto    Smoke   SmokeOdonto
    ${CTID}=    Dado que eu realize login com um segurado do segmento Odonto    CT-19
    ${CTID}=    E clico no botao VER MAIS do produto Odonto    ${CTID}
    ${CTID}=    Quando clico na opcao Descontos em medicamentos no menu Informacoes    ${CTID}
    Entao o site redireciona para a pagina de descontos em medicamentos    ${CTID}

Validar acesso aos MEUS PLANOS via hyperlink localizada na coluna produto
    [Tags]    CT20  RegressivoFull  RegressivoOdonto    Smoke   SmokeOdonto
    ${CTID}=    Dado que eu realize login com um segurado do segmento Odonto    CT-20
    ${CTID}=    E clico no botao VER MAIS do produto Odonto    ${CTID}
    ${Lista}=   E clico no link do plano na coluna Produto    ${CTID}
    Entao o site redireciona para a pagina de detalhes do plano    ${Lista[0]}    ${Lista[1]}

Validar acesso ao Manual do Beneficiario na tela de detalhes da apolice
    [Tags]    CT21  RegressivoFull  RegressivoOdonto    Smoke   SmokeOdonto
    ${CTID}=    Dado que eu realize login com um segurado do segmento Odonto    CT-21
    ${CTID}=    E clico no botao VER MAIS do produto Odonto    ${CTID}
    ${Lista}=    E clico no link do plano na coluna Produto    ${CTID}
    ${CTID}=    E clico na opcao Manual do Beneficiario    ${Lista[0]}
    Entao o site exibe o modal Manual do Beneficiario para baixar o doc    ${CTID}

Validar a exibicao do botao Solicitar Cancelamento na pagina de detalhes do plano
    [Tags]    CT22  RegressivoFull  RegressivoOdonto
    ${CTID}=    Dado que eu realize login com um segurado do segmento Odonto    CT-22
    ${CTID}=    E clico no botao VER MAIS do produto Odonto     ${CTID}
    ${Lista}=  E clico no link do plano na coluna Produto      ${CTID}
    Entao o site exibe o botao Solicitar Cancelamento na pagina de detalhes do plano    ${Lista[0]}

Validar a solicitacao de cancelamento de contrato na pagina de detalhes do plano
    [Tags]    CT23  RegressivoFull  RegressivoOdonto
    ${CTID}=    Dado que eu realize login com um segurado do segmento Odonto    CT-23
    ${CTID}=    E clico no botao VER MAIS do produto Odonto    ${CTID}
    ${Lista}=   E clico no link do plano na coluna Produto      ${CTID}
    ${CTID}=    Quando clico na opcao Solicitar Cancelamento    ${Lista[0]}
    ${CTID}=    E preencho todas a informacoes para enviar o requirimento   ${CTID}
    Entao o site processa a solicitacao apos eu confirmar o envio do requerimento   ${CTID}

Validar a exibicao do botao Imprimir na tela de detalhes da apolice
    [Tags]    CT24  RegressivoFull  RegressivoOdonto    Smoke   SmokeOdonto
    ${CTID}=    Dado que eu realize login com um segurado do segmento Odonto    CT-24
    ${CTID}=    E clico no botao VER MAIS do produto Odonto    ${CTID}
    ${Lista}=   E clico no link do plano na coluna Produto      ${CTID}
    Entao o site exibe o botao Imprimir na pagina de detalhes do plano    ${Lista[0]}

Validar botao Utilizacao e Coparticipacao na tela de detalhes da apolice
    [Tags]    CT25  RegressivoFull  RegressivoOdonto    Smoke   SmokeOdonto
    ${CTID}=    Dado que eu realize login com um segurado do segmento Odonto    CT-25
    ${CTID}=    E clico no botao VER MAIS do produto Odonto    ${CTID}
    ${Lista}=   E clico no link do plano na coluna Produto      ${CTID}
    ${CTID}=    Quando clico no botao Utilizacao e Coparticipacao na pagina de detalhes do plano    ${Lista[0]}
    Entao o site exibe o modal com campos para gerar o relatorio de Utilizacao e Coparticipacao    ${CTID}

Validar a exibicao do botao Cartao Digital na pagina de detalhes do plano
    [Tags]    CT26  RegressivoFull  RegressivoOdonto    Smoke   SmokeOdonto
    ${CTID}=    Dado que eu realize login com um segurado do segmento Odonto    CT-26
    ${CTID}=    E clico no botao VER MAIS do produto Odonto    ${CTID}
    ${Lista}=   E clico no link do plano na coluna Produto      ${CTID}
    Entao o site exibe o botao Cartao Digital na pagina de detalhes do plano    ${Lista[0]}

Solicitar geracao de relatorio de Utilizacao e Coparticipacao por periodo na pagina de detalhes do plano
    [Tags]    CT27  RegressivoFull  RegressivoOdonto    Smoke   SmokeOdonto
    ${CTID}=    Dado que eu realize login com um segurado do segmento Odonto    CT-27
    ${CTID}=    E clico no botao VER MAIS do produto Odonto    ${CTID}
    ${Lista}=   E clico no link do plano na coluna Produto      ${CTID}
    ${CTID}=    Quando clico no botao Utilizacao e Coparticipacao na pagina de detalhes do plano    ${Lista[0]}
    ${CTID}=    E solicito o relatorio por periodo    ${CTID}
    Entao o site processa a solicitacao do relatorio de Utilizacao e Coparticipacao    ${CTID}

Solicitar geracao de relatorio de Utilizacao e Coparticipacao por semestre na pagina de detalhes do plano
    [Tags]    CT28  RegressivoFull  RegressivoOdonto    Smoke   SmokeOdonto
    ${CTID}=    Dado que eu realize login com um segurado do segmento Odonto    CT-28
    ${CTID}=    E clico no botao VER MAIS do produto Odonto    ${CTID}
    ${Lista}=   E clico no link do plano na coluna Produto      ${CTID}
    ${CTID}=    Quando clico no botao Utilizacao e Coparticipacao na pagina de detalhes do plano    ${Lista[0]}
    ${CTID}=    E solicito o relatorio por semestre    ${CTID}
    Entao o site processa a solicitacao do relatorio de Utilizacao e Coparticipacao    ${CTID}

Validar a funcionalidade do botao Cancelar do modal de Utilizacao e Coparticipacao na pagina de detalhes do plano
    [Tags]    CT29  RegressivoFull  RegressivoOdonto    Smoke   SmokeOdonto
    ${CTID}=    Dado que eu realize login com um segurado do segmento Odonto    CT-29
    ${CTID}=    E clico no botao VER MAIS do produto Odonto    ${CTID}
    ${Lista}=   E clico no link do plano na coluna Produto      ${CTID}
    ${CTID}=    Quando clico no botao Utilizacao e Coparticipacao na pagina de detalhes do plano    ${Lista[0]}
    ${CTID}=    E clico no botao Cancelar do modal de Utilizacao e Coparticipacao    ${CTID}
    Entao o site fecha o modal de Utilizacao e Coparticipacao    ${CTID}

Validar botao Cartao Digital na tela de detalhes do plano
    [Tags]    CT30  RegressivoFull  RegressivoOdonto    Smoke   SmokeOdonto
    ${CTID}=    Dado que eu realize login com um segurado do segmento Odonto    CT-30
    ${CTID}=    E clico no botao VER MAIS do produto Odonto    ${CTID}
    ${Lista}=   E clico no link do plano na coluna Produto      ${CTID}
    ${CTID}=    Quando clico no botao Cartao Digital na pagina de detalhes do plano    ${Lista[0]}
    Entao o site exibe o modal Cartao Digital   ${CTID}

Validar a exibicao do verso do Cartao digital na opcao Verso
    [Tags]    CT31  RegressivoFull  RegressivoOdonto    Smoke   SmokeOdonto
    ${CTID}=    Dado que eu realize login com um segurado do segmento Odonto    CT-31
    ${CTID}=    E clico no botao VER MAIS do produto Odonto    ${CTID}
    ${Lista}=   E clico no link do plano na coluna Produto      ${CTID}
    ${CTID}=    Quando clico no botao Cartao Digital na pagina de detalhes do plano    ${Lista[0]}
    ${CTID}=    E clico na opcao Verso no modal Cartao Digital    ${CTID}
    Entao o site exibe o verso do cartao    ${CTID}

Validar a exibicao da frente do Cartao digital na opcao Frente
    [Tags]    CT32  RegressivoFull  RegressivoOdonto    Smoke   SmokeOdonto
    ${CTID}=    Dado que eu realize login com um segurado do segmento Odonto    CT-32
    ${CTID}=    E clico no botao VER MAIS do produto Odonto    ${CTID}
    ${Lista}=   E clico no link do plano na coluna Produto      ${CTID}
    ${CTID}=    Quando clico no botao Cartao Digital na pagina de detalhes do plano    ${Lista[0]}
    ${CTID}=    E clico na opcao Verso no modal Cartao Digital    ${CTID}
    ${CTID}=    E clico na opcao Frente no modal Cartao Digital    ${CTID}
    Entao o site exibe a frente do cartao novamente    ${CTID}

Validar a funcionalidade do botao Voltar do modal Cartao Digital
    [Tags]    CT33  RegressivoFull  RegressivoOdonto    Smoke   SmokeOdonto
    ${CTID}=    Dado que eu realize login com um segurado do segmento Odonto    CT-33
    ${CTID}=    E clico no botao VER MAIS do produto Odonto    ${CTID}
    ${Lista}=   E clico no link do plano na coluna Produto      ${CTID}
    ${CTID}=    Quando clico no botao Cartao Digital na pagina de detalhes do plano    ${Lista[0]}
    ${CTID}=    E clico no botao Voltar no modal Cartao Digital    ${CTID}
    Entao o site fecha o modal Cartao Digital   ${CTID}

Validar a funcionalidade do botao OK do modal Cartao Digital
    [Tags]    CT34  RegressivoFull  RegressivoOdonto    Smoke   SmokeOdonto
    ${CTID}=    Dado que eu realize login com um segurado do segmento Odonto    CT-34
    ${CTID}=    E clico no botao VER MAIS do produto Odonto    ${CTID}
    ${Lista}=   E clico no link do plano na coluna Produto      ${CTID}
    ${CTID}=    Quando clico no botao Cartao Digital na pagina de detalhes do plano    ${Lista[0]}
    ${CTID}=    E clico no botao OK no modal Cartao Digital    ${CTID}
    Entao o site fecha o modal Cartao Digital   ${CTID}

