import io
from datetime import datetime, timedelta


# A função removedateseparators remove separadores das datas mantendo apenas os números
# Observação: a data deve ser convertida para o formato %d.%m.%Y antes de chamar essa função
def remove_date_separators(value):
    string_informed = value
    only_numbers = string_informed[0:2]
    only_numbers += string_informed[3:5]
    only_numbers += string_informed[6:10]
    return only_numbers


def return_past_date(number_of_days):

    past_date = datetime.today() - timedelta(days=int(number_of_days))

    past_date = str(past_date)
    date_to_be_formatted = ''
    formatted_date = ''

    for i in range(0, 10):
        date_to_be_formatted += past_date[i]

    formatted_date = datetime.strptime(date_to_be_formatted, "%Y-%m-%d").strftime("%d-%m-%Y")

    return formatted_date


def return_future_date(number_of_days):

    past_date = datetime.today() + timedelta(days=int(number_of_days))

    past_date = str(past_date)
    date_to_be_formatted = ''
    formatted_date = ''

    for i in range(0, 10):
        date_to_be_formatted += past_date[i]

    formatted_date = datetime.strptime(date_to_be_formatted, "%Y-%m-%d").strftime("%d-%m-%Y")

    return formatted_date


# Substitui espaços por '_' e ':' por '_'
def format_data_for_screenshot(value):
    new_value = value.replace(" ","_")
    new_value = new_value.replace(":","_")
    return new_value


# Retorna apenas o número do cartão do beneficiário ao receber o seguinte exemplo: Cartão · 0 994 7433 53339100-3
def return_card_number(value):
    newValue = value[11:14]
    newValue += value[15:19]
    newValue += value[20:28]
    newValue += value[29]

    return newValue


# Salva o número do protocolo em um arquivo de texto
def save_protocol_number(folderpath, dateandtime, protocolnumber):
    new_file = open(folderpath+'/'+'protocologerado'+dateandtime+'.txt', 'a+')
    new_file.write("Protocolo: "+protocolnumber)
    new_file.close()
