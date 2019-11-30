"""В одномерном массиве найти сумму элементов, находящихся между минимальным и максимальным элементами.
Сами минимальный и максимальный элементы в сумму не включать. """

from random import randint

massive = list(set([randint(0, 100) for j in range(10)]))  # set чтобы не было повторяющихся
maxim = 0                                       # Хранение максимального числа
max_index = 0                                   # Хранение индекса максимального числа
minim = 101                                     # Хранение минимального числа, т.к. randint(0, 100) - присвоил 101
min_index = 0                                   # Хранение индекса минимального числа
print(f'Исходный массив\n {massive}')
for i in range(len(massive)):
    if massive[i] > maxim:
        maxim = massive[i]
        max_index = i
    elif massive[i] < minim:
        minim = massive[i]
        min_index = i
print(f'Сумма чисел между минимальным {minim} и максимальным {maxim}:')
print(sum(massive[el] for el in range(min_index + 1, max_index)) if min_index < max_index
      else sum(massive[el] for el in range(max_index + 1, min_index)))
