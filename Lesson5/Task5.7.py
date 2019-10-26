"""
Создать (не программно) текстовый файл, в котором каждая строка должна содержать данные о фирме: название, форма
собственности, выручка, издержки. Необходимо вычислить прибыль каждой компании и среднюю прибыль. Реализовать список,
содержащий словарь (название фирмы и прибыль) и словарь с одним элементом (средняя прибыль). Добавить в первый словарь
еще один элемент, содержащий результат вычисления отношения прибыли к убыткам. Итоговый список сохранить в файл.
"""

try:
    with open("Task7.txt") as task_7:
        dict1 = {}
        dict2 = {}
        average = 0
        counter = 0
        task7 = task_7.read().split("\n")
        for el in task7:
            key = el.split()[0]
            value = [int(el.split()[-2]) - int(el.split()[-1]), round(int(el.split()[-2]) / int(el.split()[-1]), 2)]
            average += int(el.split()[-2]) - int(el.split()[-1])
            counter += 1
            dict1[key] = value
        dict2["Средняя прибыль"] = round((average / counter), 2)
        print(dict1)
        print(dict2)
        with open("Task7_new.txt", "a") as task7_new:
            print(dict1, "\n", dict2, file=task7_new)
#            task7_new.writelines(str(dict1))
#            task7_new.writelines(str(dict2))
except Exception as ex:
    print(f"{ex} omg, something wrong!")
