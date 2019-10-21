"""
Реализовать два небольших скрипта:
а) бесконечный итератор, генерирующий целые числа, начиная с указанного,
б) бесконечный итератор, повторяющий элементы некоторого списка, определенного заранее.
Подсказка: использовать функцию count() и cycle() модуля itertools.
"""

from itertools import count
from itertools import cycle

# Часть задания А
for el in count(int(input("Enter start integer: "))):
    print(el)

# Часть задания Б
string = "String"
iterat = cycle(string)
print(next(iterat))
print(next(iterat))
print(next(iterat))
print(next(iterat))
