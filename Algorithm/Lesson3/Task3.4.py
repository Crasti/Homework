"""Определить, какое число в массиве встречается чаще всего"""

from random import randint

massive = [randint(0, 6) for j in range(10)]
rez = {}
for i in massive:                            # Не учитывает возможность одинакового кол-ва вхождений нескольких чисел
    if i not in rez.values():
        rez[massive.count(i)] = i
print(massive)
print(f'{rez[max(rez.keys())]} встречается чаще всего, а именно раз - {max(rez.keys())}')
