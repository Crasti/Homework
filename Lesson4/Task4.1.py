"""
Реализовать скрипт, в котором должна быть предусмотрена функция расчета заработной платы сотрудника.
В расчете необходимо использовать формулу: (выработка в часах*ставка в час) + премия. Для выполнения
расчета для конкретных значений необходимо запускать скрипт с параметрами.
"""

from sys import argv


def wage(*args):
    wage = int(h_work) * int(h_cost) + int(h_work) * int(h_cost) * float(award)
    return wage


script_name, h_work, h_cost, award = argv
print(wage(h_work, h_cost, award))
