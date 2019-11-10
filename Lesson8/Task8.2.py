"""
Создайте собственный класс-исключение, обрабатывающий ситуацию деления на нуль. Проверьте его работу на данных,
вводимых пользователем. При вводе пользователем нуля в качестве делителя программа должна корректно обработать
эту ситуацию и не завершиться с ошибкой.
"""


class ExDivisionByZerro(Exception):
    def __init__(self, txt):
        self.txt = txt


dividend, divider = input('Enter dividend: '), input('Enter divider: ')
try:
    if int(divider) == 0:
        raise ExDivisionByZerro("Cannot be divided by zero!")
    rez = int(dividend) / int(divider)
except ValueError:
    print('At least one of the numbers is not quite a number!')
except ExDivisionByZerro as ex:
    print(ex)
else:
    print(f'Division result is: {rez}')
