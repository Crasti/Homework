"""Написать программу сложения и умножения двух шестнадцатеричных чисел. При этом каждое число представляется как
массив, элементы которого это цифры числа. Например, пользователь ввёл A2 и C4F. Сохранить их как [‘A’, ‘2’] и [‘C’,
‘4’, ‘F’] соответственно. Сумма чисел из примера: [‘C’, ‘F’, ‘1’], произведение - [‘7’, ‘C’, ‘9’, ‘F’, ‘E’] """

from collections import deque


def hex_calc(x, y):
    x = ''.join([el for el in x])
    y = ''.join([el for el in y])
    summ = hex((int(float.fromhex(x) + float.fromhex(y))))
    mult = hex((int(float.fromhex(x) * float.fromhex(y))))
    print(f'Сумма двух чисел: {summ}')
    print(f'Произведение двух чисел: {mult}')


hex_calc(deque(input('Введите первое число: ')), deque(input('Введите второе число: ')))
