"""В массиве найти максимальный отрицательный элемент.
Вывести на экран его значение и позицию в массиве"""

from random import randint

massive = [randint(-10, 4) for j in range(10)]
print(f'Исходный массив\n{massive}')
print(f'максимальный отрицательный элемент: {max(el for el in massive if el < 0)}, '
      f'его позиция: {[idx for idx, num in enumerate(massive) if num == max(el for el in massive if el < 0)]}')
