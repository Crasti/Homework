"""Для списка реализовать обмен значений соседних элементов, т.е. Значениями обмениваются элементы
с индексами 0 и 1, 2 и 3 и т.д. При нечетном количестве элементов последний сохранить на своем месте.
 Для заполнения списка элементов необходимо использовать функцию input()."""

exchange_list = list(input("Введите список значений через пробел: ").split(" "))
for elem in range(0, len(exchange_list) - 1, 2):
    exchange_list[elem], exchange_list[elem + 1] = exchange_list[elem + 1], exchange_list[elem]
print(exchange_list)
