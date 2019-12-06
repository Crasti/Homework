"""Отсортируйте по возрастанию методом слияния одномерный вещественный массив, заданный случайными числами на
промежутке [0; 50). Выведите на экран исходный и отсортированный массивы. """

from random import uniform


def merge(massive):
    if len(massive) > 1:
        center = len(massive) // 2
        left = massive[:center]
        right = massive[center:]
        merge(left)
        merge(right)
        i, j, k = 0, 0, 0

        while i < len(left) and j < len(right):
            if left[i] < right[j]:
                massive[k] = left[i]
                i += 1
            else:
                massive[k] = right[j]
                j += 1
            k += 1

        while i < len(left):
            massive[k] = left[i]
            i += 1
            k += 1

        while j < len(right):
            massive[k] = right[j]
            j += 1
            k += 1
        return massive


massive = [round(uniform(0, 50), 2) for _ in range(15)]
print(f'Исходный массив:\n {massive}')
print(f'Отсортированный массив:\n {merge(massive)}')
