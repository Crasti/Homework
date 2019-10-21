"""
Представлен список чисел. Необходимо вывести элементы исходного списка, значения которых больше предыдущего элемента.
Подсказка: элементы, удовлетворяющие условию, оформить в виде списка. Для формирования списка использовать генератор.
"""


from random import randint


my_list = [randint(1, 100) for _ in range(15)]
print(f"Source list:\n {my_list}")
new_list = [el for el in my_list[1:] if my_list[my_list.index(el)] > my_list[my_list.index(el) - 1]]
print(f"Result list:\n {new_list}")
