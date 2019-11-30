"""Проанализировать скорость и сложность одного любого алгоритма,
разработанных в рамках домашнего задания первых трех уроков.
Примечание: попробуйте написать несколько реализаций алгоритма и сравнить их."""

from timeit import Timer


def kratn_for():
    for i in range(2, 10):
        rez = 0
        for j in range(2, 100):
            if j % i == 0:
                rez += 1
        return f'{i} кратно {rez} числам'


def kratn_req(n=2):
    while n != 10:
        rez = 0
        for j in range(2, 100):
            if j % n == 0:
                rez += 1
#        print(f'{n} кратно {rez} числам')
        n += 1
        return kratn_req(n)


def kratn_gen(n=2):
    rez = 0
    while n < 10:
        a = [rez + 1 for j in range(2, 100) if j % n == 0]
#        print(f'{n} кратно {sum(a)} числам')
        n += 1


test_1 = Timer("kratn_for()", "from __main__ import kratn_for")
print(f"Цикл: {test_1.timeit(number=1000)}")
test_2 = Timer("kratn_req(2)", "from __main__ import kratn_req")
print(f"Рекурсия: {test_2.timeit(number=1000)}")
test_3 = Timer("kratn_gen(2)", "from __main__ import kratn_gen")
print(f"Генератор: {test_3.timeit(number=1000)}")


"""
Цикл: 0.007751324999844655
Рекурсия: 0.05625682800018694
Генератор: 0.05862090199843806

Цикл на первом месте по скорости выполнения, сложность этого кода О(n^2), т.к. есть два вложенных цикла.
На втором месте генератор
На последнем ожидаемо рекурсия. 
"""