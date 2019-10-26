"""
Создать программно файл в текстовом формате, записать в него построчно данные,
вводимые пользователем. Об окончании ввода данных свидетельствует пустая строка.
"""

try:
    with open("Task1.txt", "w") as task_1:
        need = input("Enter the data: ")
        while need != "":
            need += "\n"
            task_1.writelines(need)
            need = input("Enter the data: ")
except Exception as ex:
    print(f"{ex} - Something go wrong, OMG!")
