"""Найти сумму n элементов следующего ряда чисел: 1 -0.5 0.25 -0.125 ...Количество элементов (n) вводится с
клавиатуры """


def n_elem(n, summ_n, step):
    if n == 0:
        return summ_n
    while n >= 0:
        summ_n += step
        return n_elem(n - 1, summ_n, step / -2)


print(n_elem(int(input('Введите количество элементов: ')), 0,  1))
