"""В массиве случайных целых чисел поменять
местами минимальный и максимальный элементы."""

from random import randint

massive = [randint(0, 100) for j in range(10)]
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
massive[max_index], massive[min_index] = massive[min_index], massive[max_index]
print(f'максимальное число в массиве - {maxim}, минимальное - {minim}')
print(f'Измененный массив\n {massive}')
