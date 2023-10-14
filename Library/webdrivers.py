# Função responsável por retornar  os drivers dos browsers
# O usuário informa em qual browser deseja testar, então a função retorna o browser solicitado

def get_web_driver(browser):
    web_driver = ''
    if browser == 'Chrome':
        web_driver = 'C:/Automação/Portal_Cliente_PF/Webdrivers/chromedriver.exe'
    else:
        print('O browser informado não está disponível')

    return web_driver
