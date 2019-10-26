"""
Создать (программно) текстовый файл, записать в него программно набор чисел, разделенных
пробелами. Программа должна подсчитывать сумму чисел в файле и выводить ее на экран.
"""

from functools import reduce
from random import randint

try:
    summ = 0
    with open("Task5.txt", "w+") as task_5:
        list_1 = (randint(1, 100) for _ in range(15))
        for piece in list_1:
            print(piece, file=task_5, end=" ")
        task_5.seek(0)
        list_2 = task_5.read()
        for el in list_2.split():
            summ += int(el)
        print(f"The sum of all element in file is: {summ}")
except Exception as ex:
    print(f"{ex} omg, something wrong!")
