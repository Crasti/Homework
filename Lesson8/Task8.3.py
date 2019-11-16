"""
Создайте собственный класс-исключение, который должен проверять содержимое списка на отсутствие элементов типа строка
и булево. Проверить работу исключения на реальном примере. Необходимо запрашивать у пользователя данные и заполнять
список. Класс-исключение должен контролировать типы данных элементов списка.
"""

from ast import literal_eval


class CheckSome(Exception):
    def __init__(self, txt):
        self.txt = txt


def get_type(input_data):
    try:
        return type(literal_eval(input_data))
    except (ValueError, SyntaxError):
        return str


data1 = ''
data = []
bad_data1 = 'True'
bad_data2 = 'abc'
while True:
    try:
        data1 = input('Enter data, or "end" for exit: ')
        if data1 == 'end':
            break
        elif get_type(data1) == get_type(bad_data1):
            raise CheckSome('\nDon\'t enter bool data!\n')
        elif get_type(data1) == get_type(bad_data2):
            raise CheckSome('\nDon\'t enter str data!\n')
        else:
            data.append(data1)
    except CheckSome as check:
        print(check)
    except Exception as e:
        print(e)
print(data)
