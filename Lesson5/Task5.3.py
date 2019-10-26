"""
Создать текстовый файл (не программно), построчно записать фамилии сотрудников и
величину их окладов. Определить, кто из сотрудников имеет оклад менее 20 тыс.
вывести фамилии этих сотрудников. Выполнить подсчет средней величины дохода сотрудников.
"""
try:
    with open("Task3.txt") as task_3:
        min_zp = []
        summ = 0
        count = 1
        for line in task_3.readlines():
            summ += int(line.split()[1])
            if int(line.split()[1]) < 20000:
                min_zp += [line.split()[0]]
            count += 1
        print(f"Сотрудники, чей оклад меньше 20000 - {min_zp}")
        print(f"Средний доход сотрудников равен - {summ / count:0.2f}")
except Exception as ex:
    print(f"{ex} omg, something wrong!")
