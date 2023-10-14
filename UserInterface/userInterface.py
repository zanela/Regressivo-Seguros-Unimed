import tkinter.messagebox
from tkinter import *
from tkinter import ttk
import subprocess
import os
import xlsxwriter



root = Tk()
root.geometry('430x220')
root.resizable(False, False)
root.configure(background="#009ddb")
root.title('Automação Portal Cliente PF')

style = ttk.Style()
style.configure('TLabel', background='#009ddb', foreground='#f6f8fa', font=('helvetica', '10'))
style.configure('TButton', foreground='#009ddb', font=('helvetica', '10'))

totalTests = 159
forbiddenTestsInProduction = [22, 23, 39, 61, 62, 64, 87, 95, 96, 109, 110, 114, 119, 120, 129, 157, 159]
environments = [' ', 'Homologação', 'Pré-produção', 'Produção']
testTypes = [' ']
test = ['']
envLabel = ttk.Label(text="Selecione o ambiente:")
envLabel.grid(row=0, column=0)

pathLabel = ttk.Label(text="Informe o local das evidências:")
pathLabel.grid(row=0, column=3)

pathField = ttk.Entry(width=35)
pathField.grid(row=1, column=3)
# cria o combobox

selected_env = StringVar()
environment_cb = ttk.Combobox(textvariable=selected_env)
environment_cb.grid(row=1, column=0, padx=20)
environment_cb['values'] = environments
environment_cb['state'] = 'readonly'
environment_cb.current(0)

selected_testType = StringVar()
testType_cb = ttk.Combobox(textvariable=selected_testType)
testType_cb.grid(row=4, column=0, padx=20)
testType_cb['values'] = testTypes
testType_cb['state'] = 'disabled'
testType_cb.current(0)

selected_test = StringVar()
test_cb = ttk.Combobox(textvariable=selected_test)
test_cb.grid(row=4, column=3, padx=20)
test_cb['values'] = test
test_cb['state'] = 'disabled'
test_cb.current(0)


def run_test():
    if testType_cb.get() == 'Teste específico':
        state = test_cb['state']
        if str(state) == 'disabled':
            test_cb['state'] = 'enabled'
            if environment_cb.get() == 'Homologação' or environment_cb.get() == 'Pré-produção':
                for i in range(totalTests):
                    test.append('CT-' + str(i+1))

                test_cb['values'] = test
                test_cb.current(0)
            else:
                for i in range(totalTests):
                    forbidden = False
                    if str(test[len(test)-1]) != str('CT-' + str(i+1)):
                        for j in forbiddenTestsInProduction:
                            current_number = i + 1
                            if current_number != j:
                                print('Teste permitido ?')
                            else:
                                forbidden = True

                        if forbidden:
                            print('Teste proibido em produção')
                        else:
                            test.append('CT-' + str(i + 1))


                test_cb['values'] = test
                test_cb.current(0)
        elif test_cb.current() == 0:
            tkinter.messagebox.showinfo(title='Campo obrigatório', message='Selecione o teste')
        else:
            subprocess.call([r'C:\Automação\Portal_Cliente_PF\BatFiles\ExecutionByTestCases\execute'+str(test_cb.get())+'.bat'])
    elif testType_cb.get() == 'Regressivo Full':
        subprocess.call([r'C:\Automação\Portal_Cliente_PF\BatFiles\executeRegressivoFull.bat'])
    elif testType_cb.get() == 'Regressivo Odonto':
        subprocess.call([r'C:\Automação\Portal_Cliente_PF\BatFiles\executeRegressivoOdonto.bat'])
    elif testType_cb.get() == 'Regressivo Saúde':
        subprocess.call([r'C:\Automação\Portal_Cliente_PF\BatFiles\executeRegressivoSaude.bat'])
    elif testType_cb.get() == 'Regressivo Vida':
        subprocess.call([r'C:\Automação\Portal_Cliente_PF\BatFiles\executeRegressivoVida.bat'])
    elif testType_cb.get() == 'Regressivo RE':
        subprocess.call([r'C:\Automação\Portal_Cliente_PF\BatFiles\executeRegressivoRE.bat'])
    elif testType_cb.get() == 'Regressivo Previdência':
        subprocess.call([r'C:\Automação\Portal_Cliente_PF\BatFiles\executeRegressivoPrev.bat'])
    elif testType_cb.get() == 'Smoke':
        subprocess.call([r'C:\Automação\Portal_Cliente_PF\BatFiles\executeSmoke.bat'])
    elif testType_cb.get() == 'Smoke Odonto':
        subprocess.call([r'C:\Automação\Portal_Cliente_PF\BatFiles\executeSmokeOdonto.bat'])
    elif testType_cb.get() == 'Smoke Saúde':
        subprocess.call([r'C:\Automação\Portal_Cliente_PF\BatFiles\executeSmokeSaude.bat'])
    elif testType_cb.get() == 'Smoke Vida':
        subprocess.call([r'C:\Automação\Portal_Cliente_PF\BatFiles\executeSmokeVida.bat'])
    elif testType_cb.get() == 'Smoke RE':
        subprocess.call([r'C:\Automação\Portal_Cliente_PF\BatFiles\executeSmokeRE.bat'])
    elif testType_cb.get() == 'Smoke Previdência':
        subprocess.call([r'C:\Automação\Portal_Cliente_PF\BatFiles\executeSmokePrev.bat'])


runButton = ttk.Button(text="Executar", command=run_test, width=20)
runButton['state'] = 'disabled'
runButton.grid(row=5, column=0, padx=20, pady=20)


def env_changed():
    validate(environment_cb, pathField)


def validate(env_cb, path_fd):
    if env_cb.get() == ' ' and path_fd.get() != '':
        tkinter.messagebox.showinfo(title='Campo obrigatório', message='Informe o ambiente')
    elif path_fd.get() == '' and env_cb.get() != ' ':
        tkinter.messagebox.showinfo(title='Campo obrigatório', message='Infome onde as evidências devem ser salvas')
    elif path_fd.get() == '' and env_cb.get() == ' ':
        tkinter.messagebox.showinfo(title='Campo obrigatório', message='informe o ambiente e o local das evidências')
    else:
        environment_cb['state'] = 'disabled'
        definitionButton['state'] = 'disabled'
        pathField['state'] = 'disabled'
        os.remove('C:/Automação/Portal_Cliente_PF/Data/base.xlsx')
        workbook = xlsxwriter.Workbook('C:/Automação/Portal_Cliente_PF/Data/base.xlsx')
        worksheet = workbook.add_worksheet()

        testType_cb['state'] = 'enabled'
        runButton['state'] = 'enabled'
        clearButton['state'] = 'enabled'

        if environment_cb.get() == 'Homologação':
            env = 'https://homologacao-www.segurosunimed.com.br/'
            worksheet.write('A1', 'URL')
            worksheet.write('B1', env)
            worksheet.write('A2', 'evidencesPath')
            worksheet.write('B2', str(pathField.get()).replace('\\', '/'))
            testTypes.append('Regressivo Full')
            testTypes.append('Regressivo Odonto')
            testTypes.append('Regressivo Saúde')
            testTypes.append('Regressivo Vida')
            testTypes.append('Regressivo RE')
            testTypes.append('Regressivo Previdência')
            testTypes.append('Smoke')
            testTypes.append('Smoke Odonto')
            testTypes.append('Smoke Saúde')
            testTypes.append('Smoke Vida')
            testTypes.append('Smoke RE')
            testTypes.append('Smoke Previdência')
            testTypes.append('Teste específico')
            testType_cb['values'] = testTypes
        elif environment_cb.get() == 'Pré-produção':
            env = 'https://preproducao-www.segurosunimed.com.br/'
            worksheet.write('A1', 'URL')
            worksheet.write('B1', env)
            worksheet.write('A2', 'evidencesPath')
            worksheet.write('B2', str(pathField.get()).replace('\\', '/'))
            testTypes.append('Regressivo Full')
            testTypes.append('Regressivo Odonto')
            testTypes.append('Regressivo Saúde')
            testTypes.append('Regressivo Vida')
            testTypes.append('Regressivo RE')
            testTypes.append('Regressivo Previdência')
            testTypes.append('Smoke')
            testTypes.append('Smoke Odonto')
            testTypes.append('Smoke Saúde')
            testTypes.append('Smoke Vida')
            testTypes.append('Smoke RE')
            testTypes.append('Smoke Previdência')
            testTypes.append('Teste específico')
            testType_cb['values'] = testTypes
        else:
            env = 'https://www.segurosunimed.com.br/'
            worksheet.write('A1', 'URL')
            worksheet.write('B1', env)
            worksheet.write('A2', 'evidencesPath')
            worksheet.write('B2', str(pathField.get()).replace('\\', '/'))
            testTypes.append('Smoke')
            testTypes.append('Smoke Odonto')
            testTypes.append('Smoke Saúde')
            testTypes.append('Smoke Vida')
            testTypes.append('Smoke RE')
            testTypes.append('Smoke Previdência')
            testTypes.append('Teste específico')
            testType_cb['values'] = testTypes
        workbook.close()


def reset():
    testType_cb['state'] = 'disabled'
    testTypes.clear()
    testTypes.append(' ')
    testType_cb.current(0)
    test_cb['state'] = 'disabled'
    test_cb.current(0)
    runButton['state'] = 'disabled'
    clearButton['state'] = 'disabled'
    environment_cb['state'] = 'enabled'
    environment_cb.current(0)
    definitionButton['state'] = 'enabled'
    pathField['state'] = 'enabled'
    pathField.delete(0, 'end')


definitionButton = ttk.Button(text="Definir", command=env_changed, width=20)
definitionButton.grid(row=2, column=0, padx=20, pady=20)

testTypeLabel = ttk.Label(text='Informe o tipo de teste:')
testTypeLabel.grid(row=3, column=0, padx=20)

testLabel = ttk.Label(text='Selecione o teste:')
testLabel.grid(row=3, column=3, padx=20)

clearButton = ttk.Button(text='Limpar campos', command=reset, width=20)
clearButton.grid(row=5, column=3, padx=20)
clearButton['state'] = 'disabled'

root.mainloop()
