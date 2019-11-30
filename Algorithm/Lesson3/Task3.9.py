"""Найти максимальный элемент среди минимальных элементов столбцов матрицы."""

from random import randint

massive = [[randint(10, 99) for i in range(4)] for j in range(4)]
stolb = []  # Переменная для хранения эл-тов столбца
rez = []    # Переменная для коллекта мин эл-тов столбца
for i in range(4):
    for j in range(4):
        stolb.append(massive[j][i])
    rez.append(min(stolb))
    stolb = []
for i in massive:  # Вывод матрицы для наглядности
    print(i)
print(f'Максимальный элемент среди минимальных в столбцах: {max(rez)}')
