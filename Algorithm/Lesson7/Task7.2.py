"""Отсортируйте по убыванию методом "пузырька" одномерный целочисленный массив, заданный случайными числами на
промежутке [-100; 100). Выведите на экран исходный и отсортированный массивы. Сортировка должна быть реализована в
виде функции. По возможности доработайте алгоритм (сделайте его умнее). """

from random import randint


def bubble(massive):
    n = 1
    while n < len(massive):
        counter = True
        for i in range(len(massive) - n):
            if massive[i] > massive[i + 1]:
                counter = False
                massive[i], massive[i + 1] = massive[i + 1], massive[i]
        if counter:
            break
        n += 1
    return massive


massive = [randint(-100, 100) for _ in range(25)]
print(f'Исходный массив:\n {massive}')
print(f'Отсортированный массив:\n {bubble(massive)}')
