import json
import jsonpath


def read_locators_from_json(locator_name):
    with open("C:/Automação/Portal_Cliente_PF/JsonFiles/elements.json", encoding='utf-8') as f:
        response = json.loads(f.read())
    value = jsonpath.jsonpath(response, locator_name)
    return value[0]
