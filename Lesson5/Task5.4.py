"""
Создать (не программно) текстовый файл со следующим содержимым:
One — 1
Two — 2
Three — 3
Four — 4
Необходимо написать программу, открывающую файл на чтение и считывающую построчно данные. При этом английские
числительные должны заменяться на русские. Новый блок строк должен записываться в новый текстовый файл.
"""

try:
    with open("Task4.txt", "r+") as task_4:
        repl_dict = {"One": "Один", "Two": "Два", "Three": "Три", "Four": "Четыре"}
        for line in task_4.readlines():
            with open("Task4_new.txt", "a") as task4_new:
                print((line.replace(line.split()[0], str(repl_dict.get(line.split()[0])))), file=task4_new, end="")
except Exception as ex:
    print(f"{ex} omg, something wrong!")
