import os
from testdata import get_evidences_path

projectFolder = get_evidences_path()


def create_folder(segment, folder_name):
    segment_folder = os.path.isdir(projectFolder + '//' + segment)  # verifica se a pasta do segmento já foi criada
    complete_path = os.path.isdir(projectFolder + '//' + segment + '//' + folder_name) # Verifica se a pasta do CT já foi criada

    if not segment_folder:
        folder = projectFolder + '//' + segment + '//' + folder_name
        os.makedirs(folder)
    elif not complete_path:
        folder = projectFolder + '//' + segment + '//' + folder_name
        os.mkdir(folder)
    else:
        print("Pasta já criada")


def return_folder_path(segment, folder_name):
    folder_exists = os.path.isdir(projectFolder + '//' + segment + '//' + folder_name)  # verifica se a pasta informada existe
    folder_path = ''

    if folder_exists:
        folder_path = projectFolder + '//' + segment + '//' + folder_name
    else:
        print("A pasta do caso de teste informada não existe")

    return folder_path
