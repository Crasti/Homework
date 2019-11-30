"""В одномерном массиве целых чисел определить два наименьших элемента.
Они могут быть как равны между собой (оба являться минимальными), так и различаться."""

from random import randint

massive = [randint(0, 100) for j in range(10)]


def minim(n, mass):  # n - кол-во минимальных эл-тов для нахождения(print специально для двух)
    while n != 0:
        minimum = 101  # Хранение минимального числа, т.к. randint(0, 100) - присвоил 101
        for i in range(len(mass)):
            if mass[i] < minimum:
                minimum = mass[i]
        print(f'{n} минимальных элемента - {minimum}, ' if n > 1 else minimum, end='')
        mass.remove(minimum)
        n -= 1
        return minim(n, mass)


print(f'Исходный массив\n {massive}')
minim(2, massive)
