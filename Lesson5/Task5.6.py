"""
Необходимо создать (не программно) текстовый файл, где каждая строка описывает учебный предмет и наличие лекционных,
практических и лабораторных занятий по этому предмету и их количество. Важно, чтобы для каждого предмета не
обязательно были все типы занятий. Сформировать словарь, содержащий название предмета и общее количество
занятий по нему. Вывести словарь на экран.
"""

try:
    with open("Task6.txt") as task_6:
        finaly_dict = {}
        for line in task_6.readlines():
            key = line.split()[0]
            value = 0
            for el in line.split():
                if el.isdigit():
                    value += int(el)
            finaly_dict[key] = value
        print(finaly_dict)
except Exception as ex:
    print(f"{ex} omg, something wrong!")
