"""
Создать текстовый файл (не программно), сохранить в нем несколько строк,
выполнить подсчет количества строк, количества слов в каждой строке.
"""

try:
    with open("Task2.txt") as task_2:
        num = 1
        for line in task_2.readlines():
            print(f"Количество слов в строке №{num} -- {len(line.split())}")
            num += 1
        task_2.seek(0)
        print(f"Всего строк в файле - {len(task_2.readlines())}")

except Exception as ex:
    print(f"{ex} omg, something wrong!")
