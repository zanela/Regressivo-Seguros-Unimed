*** Settings ***
Library    SeleniumLibrary
Resource    C:/Automação/Portal_Cliente_PF/Resources/resourceGeneral.robot
Resource    C:/Automação/Portal_Cliente_PF/Resources/resourceSaude.robot
Test Setup    Realizar login e maximizar a janela    Saude
Test Teardown    Close Browser

*** Test Cases ***
Validar acesso aos dados do produto via botao VER MAIS do produto SAUDE
    [Tags]    CT35  RegressivoFull  RegressivoSaude    Smoke   SmokeSaude
    ${CTID}=    Dado que eu realize login com um segurado do segmento Saude    CT-35
    ${Lista}=    E clico no botao VER MAIS do produto Saude    ${CTID}
    Entao o site redireciona para a pagina do segmento saude    ${Lista[0]}

Validar acesso a apolice do usuario localizado abaixo do botao VER MAIS do produto SAUDE
    [Tags]    CT36  RegressivoFull  RegressivoSaude    Smoke   SmokeSaude
    ${CTID}=    Dado que eu realize login com um segurado do segmento Saude    CT-36
    ${Lista}=   E clico no plano localizado abaixo do botao VER MAIS    ${CTID}
    Entao o site redireciona para a pagina de detalhes do plano     ${Lista[0]}     ${Lista[1]}

Validar acesso a Reembolsos e Previas via Menu Financeiro
    [Tags]    CT37  RegressivoFull  RegressivoSaude    Smoke   SmokeSaude
    ${CTID}=    Dado que eu realize login com um segurado do segmento Saude    CT-37
    ${Lista}=    E clico no botao VER MAIS do produto Saude    ${CTID}
    ${CTID}=    Quando clico na opcao Reembolsos e Previas no Menu Financeiro   ${Lista[0]}
    Entao o site redireciona para a pagina de Reembolsos e Previas    ${CTID}

Validar acesso via SubMenu Previa
    [Tags]    CT38  RegressivoFull  RegressivoSaude    Smoke   SmokeSaude
    ${CTID}=    Dado que eu realize login com um segurado do segmento Saude    CT-38
    ${Lista}=    E clico no botao VER MAIS do produto Saude    ${CTID}
    ${CTID}=    Quando clico na opcao Reembolsos e Previas no Menu Financeiro   ${Lista[0]}
    ${CTID}=    E clico no menu Previa na pagina de Reembolsos e Previas    ${CTID}
    Entao o site exibe as opcoes para solicitacao de previa de reembolso    ${CTID}

Validar a solicitacao de uma nova previa de consulta medica
    [Tags]    CT39  RegressivoFull  RegressivoSaude
    ${CTID}=    Dado que eu realize login com um segurado do segmento Saude    CT-39
    ${Lista}=    E clico no botao VER MAIS do produto Saude    ${CTID}
    ${CTID}=    Quando clico na opcao Reembolsos e Previas no Menu Financeiro   ${Lista[0]}
    ${CTID}=    E clico no menu Previa na pagina de Reembolsos e Previas    ${Lista[0]}
    ${CTID}=    E solicito uma nova previa de consulta medica   ${Lista[0]}    ${Lista[1]}
    Entao o site processa o calculo da previa de consulta medica    ${CTID}

Validar acesso via SubMenu Reembolsos
    [Tags]    CT40  RegressivoFull  RegressivoSaude    Smoke   SmokeSaude
    ${CTID}=    Dado que eu realize login com um segurado do segmento Saude    CT-40
    ${Lista}=    E clico no botao VER MAIS do produto Saude    ${CTID}
    ${CTID}=    Quando clico na opcao Reembolsos e Previas no Menu Financeiro   ${Lista[0]}
    ${CTID}=    E clico no menu Previa na pagina de Reembolsos e Previas    ${Lista[0]}
    ${CTID}=    E clico no menu Reembolso na pagina de Reembolsos e Previas    ${CTID}
    Entao o site exibe novamente as opcoes para solicitacao de reembolso    ${CTID}

Validar acesso a tabelas de reembolso
    [Tags]    CT41  RegressivoFull  RegressivoSaude    Smoke   SmokeSaude
    ${CTID}=    Dado que eu realize login com um segurado do segmento Saude    CT-41
    ${Lista}=    E clico no botao VER MAIS do produto Saude    ${CTID}
    ${CTID}=    Quando clico na opcao Reembolsos e Previas no Menu Financeiro   ${Lista[0]}
    ${CTID}=    E clico no botao Tabelas na pagina de reembolsos    ${CTID}
    Entao o site abre uma nova aba redirecionando para a pagina Tabela de Reembolso    ${CTID}

Validar acesso via SubMenu Relatorios
    [Tags]    CT42  RegressivoFull  RegressivoSaude    Smoke   SmokeSaude
    ${CTID}=    Dado que eu realize login com um segurado do segmento Saude    CT-42
    ${Lista}=    E clico no botao VER MAIS do produto Saude    ${CTID}
    ${CTID}=    Quando clico na opcao Reembolsos e Previas no Menu Financeiro   ${Lista[0]}
    ${CTID}=    E clico no menu Relatorios    ${CTID}
    Entao o site exibe os campos do relatorio demonstrativo de reembolso    ${CTID}

Validar a geracao de relatorio Demonstrativo de reembolso
    [Tags]    CT43  RegressivoFull  RegressivoSaude    Smoke   SmokeSaude
    ${CTID}=    Dado que eu realize login com um segurado do segmento Saude    CT-43
    ${Lista}=    E clico no botao VER MAIS do produto Saude    ${CTID}
    ${CTID}=    Quando clico na opcao Reembolsos e Previas no Menu Financeiro   ${Lista[0]}
    ${CTID}=    E clico no menu Relatorios    ${CTID}
    ${CTID}=    E solicito a geracao do relatorio demostrativo de reembolso    ${Lista[0]}    ${Lista[1]}
    Entao o site processa a geracao do relatorio demonstrativo de reembolso    ${CTID}

Validar acesso ao Historico de Pagamentos via Menu Financeiro
    [Tags]    CT44  RegressivoFull  RegressivoSaude    Smoke   SmokeSaude
    ${CTID}=    Dado que eu realize login com um segurado do segmento Saude    CT-44
    ${Lista}=    E clico no botao VER MAIS do produto Saude    ${CTID}
    ${CTID}=    Quando clico na opcao Historico de Pagamentos no menu Financeiro    ${CTID}
    Entao o site redireciona para a pagina de Historico de Pagamentos   ${CTID}

Validar a busca de historico de pagamentos
    [Tags]    CT45  RegressivoFull  RegressivoSaude    Smoke   SmokeSaude
    ${CTID}=    Dado que eu realize login com um segurado do segmento Saude    CT-45
    ${Lista}=    E clico no botao VER MAIS do produto Saude    ${CTID}
    ${CTID}=    Quando clico na opcao Historico de Pagamentos no menu Financeiro    ${CTID}
    ${CTID}=    E seleciono um produto e clico no botao Atualizar busca    ${CTID}
    ${CTID}=    Entao o site processa a busca de historico de pagamentos    ${CTID}

Validar acesso a 2 via de boleto via Menu Financeiro
    [Tags]    CT46  RegressivoFull  RegressivoSaude    Smoke   SmokeSaude
    ${CTID}=    Dado que eu realize login com um segurado do segmento Saude    CT-46
    ${Lista}=    E clico no botao VER MAIS do produto Saude    ${CTID}
    ${CTID}=    Quando clico na opcao 2 via de boleto no menu Financeiro    ${CTID}
    ${CTID}=    E seleciono o produto e clico no botao Confirmar    ${CTID}
    Entao o site redireciona para a pagina de 2 via de boleto   ${CTID}

Validar acesso ao Informe de Rendimentos via Menu Financeiro
    [Tags]    CT47  RegressivoFull  RegressivoSaude    Smoke   SmokeSaude
    ${CTID}=    Dado que eu realize login com um segurado do segmento Saude    CT-47
    ${Lista}=    E clico no botao VER MAIS do produto Saude    ${CTID}
    ${CTID}=    Quando clico na opcao Informe de Rendimentos no menu Financeiro    ${CTID}
    ${CTID}=    E confirmo a geracao do informe no modal Informe de Rendimentos    ${CTID}
    Entao o site processa a solicitacao do informe de rendimentos   ${CTID}

Validar acesso ao Informe de Quitacoes via Menu Financeiro
    [Tags]    CT48  RegressivoFull  RegressivoSaude    Smoke   SmokeSaude
    ${CTID}=    Dado que eu realize login com um segurado do segmento Saude    CT-48
    ${Lista}=   E clico no botao VER MAIS do produto Saude    ${CTID}
    ${CTID}=    Quando clico na opcao Informe de Quitacoes no menu Financeiro   ${CTID}
    ${CTID}=    E preencho os campos necessarios para gerar o informe   ${CTID}
    Entao o site processa a solicitacao do informe de quitacoes    ${CTID}

Validar acesso ao Guia Medico via Menu de Informacoes
    [Tags]    CT49  RegressivoFull  RegressivoSaude    Smoke   SmokeSaude
    ${CTID}=    Dado que eu realize login com um segurado do segmento Saude    CT-49
    ${Lista}=   E clico no botao VER MAIS do produto Saude    ${CTID}
    ${CTID}=    Quando clico na opcao Guia Medico no menu Informacoes   ${CTID}
    ${CTID}=    E clico no plano Saude exibido no modal Guia    ${Lista[0]}    ${Lista[2]}
    Entao o site redireciona para a pagina do guia medico   ${CTID}

Validar acesso ao Descontos em Medicamentos via Menu de Informacoes
    [Tags]    CT50  RegressivoFull  RegressivoSaude    Smoke   SmokeSaude
    ${CTID}=    Dado que eu realize login com um segurado do segmento Saude    CT-50
    ${Lista}=   E clico no botao VER MAIS do produto Saude    ${CTID}
    ${CTID}=    Quando clico na opcao Descontos em medicamentos no menu Informacoes    ${CTID}
    Entao o site redireciona para a pagina de descontos em medicamentos    ${CTID}

Validar acesso a Perguntas Frequentes via Menu de Informacoes
    [Tags]    CT51  RegressivoFull  RegressivoSaude    Smoke   SmokeSaude
    ${CTID}=    Dado que eu realize login com um segurado do segmento Saude    CT-51
    ${Lista}=   E clico no botao VER MAIS do produto Saude    ${CTID}
    ${CTID}=    Quando clico na opcao Perguntas Frequentes no menu Informacoes    ${CTID}
    Entao o site abre uma nova aba redirecionando para a pagina da faq de Saude    ${CTID}

Validar acesso aos MEUS PLANOS via hyperlink localizada na coluna produtos
    [Tags]    CT52  RegressivoFull  RegressivoSaude    Smoke   SmokeSaude
    ${CTID}=    Dado que eu realize login com um segurado do segmento Saude    CT-52
    ${Lista}=   E clico no botao VER MAIS do produto Saude    ${CTID}
    ${Lista}=   E clico no link do plano na coluna Produto    ${CTID}
    Entao o site redireciona para a pagina de detalhes do plano    ${Lista[0]}    ${Lista[1]}

Validar a funcionalidade do botao Beneficios na pagina de detalhes do plano
    [Tags]    CT53  RegressivoFull  RegressivoSaude    Smoke   SmokeSaude
    ${CTID}=    Dado que eu realize login com um segurado do segmento Saude    CT-53
    ${Lista}=   E clico no botao VER MAIS do produto Saude    ${CTID}
    ${Lista}=   E clico no link do plano na coluna Produto    ${CTID}
    ${CTID}=    E clico no botao Beneficios    ${CTID}
    Entao o site exibe o modal Beneficios do plano    ${CTID}

Validar a exibicao dos detalhes de beneficio na pagina de detalhes do plano
    [Tags]    CT54  RegressivoFull  RegressivoSaude    Smoke   SmokeSaude
    ${CTID}=    Dado que eu realize login com um segurado do segmento Saude    CT-54
    ${Lista}=   E clico no botao VER MAIS do produto Saude    ${CTID}
    ${Lista}=   E clico no link do plano na coluna Produto    ${CTID}
    ${CTID}=    E clico no botao Beneficios    ${CTID}
    ${CTID}=    Quando clico no botao Ver Detalhes no modal Beneficios do plano    ${CTID}
    Entao o site exibe o modal Detalhes do beneficio    ${CTID}

Validar a funcionalidade do botao Cartao Digital na pagina de detalhes do plano
    [Tags]    CT55  RegressivoFull  RegressivoSaude    Smoke   SmokeSaude
    ${CTID}=    Dado que eu realize login com um segurado do segmento Saude    CT-55
    ${Lista}=   E clico no botao VER MAIS do produto Saude    ${CTID}
    ${Lista}=   E clico no link do plano na coluna Produto    ${CTID}
    ${CTID}=    Quando clico no botao Cartao Digital na pagina de detalhes do plano    ${Lista[0]}
    Entao o site exibe o modal Cartao Digital   ${CTID}

Validar a exibicao do verso do Cartao digital na opcao Verso
    [Tags]    CT56  RegressivoFull  RegressivoSaude    Smoke   SmokeSaude
    ${CTID}=    Dado que eu realize login com um segurado do segmento Saude    CT-56
    ${Lista}=   E clico no botao VER MAIS do produto Saude    ${CTID}
    ${Lista}=   E clico no link do plano na coluna Produto      ${CTID}
    ${CTID}=    Quando clico no botao Cartao Digital na pagina de detalhes do plano    ${Lista[0]}
    ${CTID}=    E clico na opcao Verso no modal Cartao Digital    ${CTID}
    Entao o site exibe o verso do cartao    ${CTID}

Validar a exibicao da frente do Cartao digital na opcao Frente
    [Tags]    CT57  RegressivoFull  RegressivoSaude    Smoke   SmokeSaude
    ${CTID}=    Dado que eu realize login com um segurado do segmento Saude    CT-57
    ${Lista}=   E clico no botao VER MAIS do produto Saude    ${CTID}
    ${Lista}=   E clico no link do plano na coluna Produto      ${CTID}
    ${CTID}=    Quando clico no botao Cartao Digital na pagina de detalhes do plano    ${Lista[0]}
    ${CTID}=    E clico na opcao Verso no modal Cartao Digital    ${CTID}
    ${CTID}=    E clico na opcao Frente no modal Cartao Digital    ${CTID}
    Entao o site exibe a frente do cartao novamente    ${CTID}

Validar a funcionalidade do botao Voltar do modal Cartao Digital
    [Tags]    CT58  RegressivoFull  RegressivoSaude    Smoke   SmokeSaude
    ${CTID}=    Dado que eu realize login com um segurado do segmento Saude    CT-58
    ${Lista}=   E clico no botao VER MAIS do produto Saude    ${CTID}
    ${Lista}=   E clico no link do plano na coluna Produto      ${CTID}
    ${CTID}=    Quando clico no botao Cartao Digital na pagina de detalhes do plano    ${Lista[0]}
    ${CTID}=    E clico no botao Voltar no modal Cartao Digital    ${CTID}
    Entao o site fecha o modal Cartao Digital   ${CTID}

Validar a funcionalidade do botao OK do modal Cartao Digital
    [Tags]    CT59  RegressivoFull  RegressivoSaude    Smoke   SmokeSaude
    ${CTID}=    Dado que eu realize login com um segurado do segmento Saude    CT-59
    ${Lista}=   E clico no botao VER MAIS do produto Saude    ${CTID}
    ${Lista}=   E clico no link do plano na coluna Produto      ${CTID}
    ${CTID}=    Quando clico no botao Cartao Digital na pagina de detalhes do plano    ${Lista[0]}
    ${CTID}=    E clico no botao OK no modal Cartao Digital    ${CTID}
    Entao o site fecha o modal Cartao Digital   ${CTID}

Validar a funcionalidade do botao Manual do Segurado na pagina de detalhes do plano
    [Tags]    CT60  RegressivoFull  RegressivoSaude    Smoke   SmokeSaude
    ${CTID}=    Dado que eu realize login com um segurado do segmento Saude    CT-60
    ${Lista}=   E clico no botao VER MAIS do produto Saude    ${CTID}
    ${Lista}=   E clico no link do plano na coluna Produto      ${CTID}
    ${CTID}=    E clico na opcao Manual do Beneficiario    ${Lista[0]}
    Entao o site exibe o modal Manual do Beneficiario para baixar o doc    ${CTID}

Validar a exibicao do botao Solicitar cancelamento na pagina de detalhes do plano
    [Tags]    CT61  RegressivoFull  RegressivoSaude
    ${CTID}=    Dado que eu realize login com um segurado do segmento Saude    CT-61
    ${Lista}=   E clico no botao VER MAIS do produto Saude    ${CTID}
    ${Lista}=   E clico no link do plano na coluna Produto      ${CTID}
    Entao o site exibe o botao Solicitar Cancelamento na pagina de detalhes do plano    ${Lista[0]}

Validar a solicitacao de cancelamento de contrato na pagina de detalhes do plano
    [Tags]    CT62  RegressivoFull  RegressivoSaude
    ${CTID}=    Dado que eu realize login com um segurado do segmento Saude    CT-62
    ${Lista}=   E clico no botao VER MAIS do produto Saude    ${CTID}
    ${Lista}=   E clico no link do plano na coluna Produto      ${CTID}
    ${CTID}=    Quando clico na opcao Solicitar Cancelamento    ${Lista[0]}
    ${CTID}=    E preencho todas a informacoes para enviar o requirimento   ${CTID}
    Entao o site processa a solicitacao apos eu confirmar o envio do requerimento   ${CTID}

Validar acesso aos Dados Cadastrais e Desbloqueio De Cartao via menu acesso rapido
    [Tags]    CT63  RegressivoFull  RegressivoSaude    Smoke   SmokeSaude
    ${CTID}=    Dado que eu realize login com um segurado do segmento Saude    CT-63
    ${CTID}=    E clico na opcao Dados Cadastrais e Desbloqueio de Cartao no menu de acesso rapido   ${CTID}
    ${CTID}=    E clico no produto Saude no modal Dados cadastrais e desbloqueio de cartao    ${CTID}
    Entao o site redireciona para a pagina de dados cadastrais  ${CTID}

Validar a atualizacao cadastral e desbloqueio de cartao via menu acesso rapido
    [Tags]    CT64  RegressivoFull  RegressivoSaude
    ${CTID}=    Dado que eu realize login com um segurado do segmento Saude    CT-64
    ${CTID}=    E clico na opcao Dados Cadastrais e Desbloqueio de Cartao no menu de acesso rapido   ${CTID}
    ${CTID}=    E clico no produto Saude no modal Dados cadastrais e desbloqueio de cartao    ${CTID}
    ${CTID}=    Quando atualizo os dados cadastrais e confirmo    ${CTID}
    Entao o site informa o numero de protocolo referente a atualizacao cadastral    ${CTID}

Validar acesso a Reembolsos e Previas via menu acesso rapido
    [Tags]    CT65  RegressivoFull  RegressivoSaude    Smoke   SmokeSaude
    ${CTID}=    Dado que eu realize login com um segurado do segmento Saude    CT-65
    ${CTID}=    E clico na opcao Reembolsos e Previas no menu de acesso rapido  ${CTID}
    Entao o site redireciona para a pagina de Reembolsos e Previas    ${CTID}

Validar acesso a 2 Via de boleto via menu acesso rapido
    [Tags]    CT66  RegressivoFull  RegressivoSaude    Smoke   SmokeSaude
    ${CTID}=    Dado que eu realize login com um segurado do segmento Saude    CT-66
    ${CTID}=    E clico na opcao 2 via de boleto no menu de acesso rapido   ${CTID}
    ${CTID}=    E seleciono o segmento Saude, um produto e confirmo    ${CTID}
    Entao o site redireciona para a pagina de 2 via de boleto   ${CTID}

Validar acesso ao Informe de Rendimentos via menu acesso rapido
    [Tags]    CT67  RegressivoFull  RegressivoSaude    Smoke   SmokeSaude
    ${CTID}=    Dado que eu realize login com um segurado do segmento Saude    CT-67
    ${CTID}=    E clico na opcao Informe de Rendimentos no menu de acesso rapido    ${CTID}
    ${CTID}=    E no modal de informe de rendimentos seleciono o segmento Saude, um produto e confirmo    ${CTID}
    Entao o site exibe o modal de aviso    ${CTID}

Validar acesso ao Informe de Quitacoes via menu acesso rapido
    [Tags]    CT68  RegressivoFull  RegressivoSaude    Smoke   SmokeSaude
    ${CTID}=    Dado que eu realize login com um segurado do segmento Saude    CT-68
    ${CTID}=    E clico na opcao Informe de Quitacoes no menu acesso rapido    ${CTID}
    ${CTID}=    E preencho os campos necessarios para gerar o informe   ${CTID}
    Entao o site processa a solicitacao do informe de quitacoes    ${CTID}

Validar acesso ao Descontos em Medicamentos via menu acesso rapido
    [Tags]    CT69  RegressivoFull  RegressivoSaude    Smoke   SmokeSaude
    ${CTID}=    Dado que eu realize login com um segurado do segmento Saude    CT-69
    ${CTID}=    E clico na opcao Descontos em Medicamentos no menu de acesso rapido    ${CTID}
    Entao o site redireciona para a pagina de descontos em medicamentos    ${CTID}

Validar acesso ao Clube de vantagens via menu acesso rapido
    [Tags]    CT70  RegressivoFull  RegressivoSaude    Smoke   SmokeSaude
    ${CTID}=    Dado que eu realize login com um segurado do segmento Saude    CT-70
    ${CTID}=    E clico na opcao Clube de Vantagens no menu de acesso rapido    ${CTID}
    ${CTID}=    Quando clico no botao Acessar Clube de Vantagens no modal Clube de Vantagens    ${CTID}
    Entao o site abre uma nova aba redirecionando para a pagina do Clube de Vantagens   ${CTID}

Validar acesso ao Guia Medico e Odontologico via menu acesso rapido
    [Tags]    CT71  RegressivoFull  RegressivoSaude    Smoke   SmokeSaude
    ${CTID}=    Dado que eu realize login com um segurado do segmento Saude    CT-71
    ${Lista}=   E clico na opcao Guia Medico e Odontologico no menu de acesso rapido    ${CTID}
    ${CTID}=    E clico no plano Saude exibido no modal Guia   ${Lista[0]}     ${Lista[1]}
    Entao o site redireciona para a pagina do guia medico    ${CTID}

Validar acesso a Ouvidoria via menu acesso rapido
    [Tags]    CT72  RegressivoFull  RegressivoSaude    Smoke   SmokeSaude
    ${CTID}=    Dado que eu realize login com um segurado do segmento Saude    CT-72
    ${CTID}=    E clico na opcao Ouvidoria no menu de acesso rapido    ${CTID}
    Entao o site abre uma nova aba redirecionando para a pagina de Ouvidoria    ${CTID}

Validar acesso ao Simulador de Previdencia via menu acesso rapido
    [Tags]    CT73  RegressivoFull  RegressivoSaude    Smoke   SmokeSaude
    ${CTID}=    Dado que eu realize login com um segurado do segmento Saude    CT-73
    ${CTID}=    E clico na opcao Simulador de Previdencia no menu de acesso rapido    ${CTID}
    Entao o site abre uma nova aba redirecionando para a pagina do Simulador de Previdencia    ${CTID}
