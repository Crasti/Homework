"""
Вводятся три разных числа. Найти, какое из них
является средним (больше одного, но меньше другого).
"""

num1, num2, num3 = map(int, input('Введите три числа через пробел: ').split())
if num1 < num2 < num3 or num3 < num2 < num1:
    print(f'Среднее число - {num2}')
elif num2 < num1 < num3 or num3 < num1 < num2:
    print(f'Среднее число - {num1}')
else:
    print(f'Среднее число - {num1}')
