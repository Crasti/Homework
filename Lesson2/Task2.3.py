"""Пользователь вводит месяц в виде целого числа от 1 до 12. Сообщить к какому времени
года относится месяц (зима, весна, лето, осень). Напишите решения через list и через dict."""

"""Вариант List"""
print("Вариант List", end="\n\n")

month = int(input("Введите месяц в виде целого числа от 1 до 12: "))
times = ['Зима', 'Весна', 'Лето', 'Осень']
if 0 < month < 13:
    if 1 <= month <= 2 or month == 12:
        print(f"Cнег идет, это значит за окном {times[0]}")
    elif 3 <= month <= 5:
        print(f"Сейчас определенно {times[1]}")
    elif 6 <= month <= 8:
        print(f"По-моему на улице {times[2]}")
    else:
        print(f"Кажется сейчас {times[3]}")
else:
    print("На нашей планете такого месяца не бывает, вы вообще откуда будете?")

"""Вариант Dict"""
print("Вариант Dict", end="\n\n")

month = int(input("Введите месяц в виде целого числа от 1 до 12: "))
times = {12: "зима", 1: "зима", 2: "зима", 3: "весна", 4: "весна", 5: "весна", 6: "лето",
         7: "лето", 8: "лето", 9: "осень", 10: "осень", 11: "осень"}
if 1 <= month <= 12:
    print(f"Судя по всему сейчас на улице {times.get(month)}")
else:
    print("На нашей планете такого месяца не бывает, вы вообще откуда будете?")