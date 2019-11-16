"""
Написать программу, которая генерирует в указанных пользователем границах
●	случайное целое число,
●	случайное вещественное число,
●	случайный символ.
Для каждого из трех случаев пользователь задает свои границы диапазона.
Например, если надо получить случайный символ от 'a' до 'f',
то вводятся эти символы. Программа должна вывести на экран любой
символ алфавита от 'a' до 'f' включительно.
"""

from ast import literal_eval
from random import random

border1, border2 = map(str, input('Введите границы для генерации через пробел: ').split())
try:
    border1 = literal_eval(border1)
except Exception:
    print(f'Случайный символ в этих границах: '
          f'{chr(int(random() * (ord(border2) - ord(border1) + 1) + ord(border1)))}')
else:
    if type(border1) == int:
        print(f'Случайное число в этих границах: '
              f'{int(random() * (int(border2) - int(border1) + 1) + int(border1))}')
    elif type(border1) == float:
        print(f'Случайное вещественное число в этих границах: '
              f'{(random() * (float(border2) - float(border1)) + float(border1)):.2f}')
