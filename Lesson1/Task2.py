"""Пользователь вводит время в секундах. Переведите время в часы,
минуты и секунды и выведите в формате чч:мм:сс. Используйте форматирование строк."""

full_second = int(input("Введите количество секунд: "))
second = full_second % 60
minute = full_second // 60 % 60
hour = full_second // 3600
if hour < 10:
    if minute < 10:
        if second < 10:
            print(f"0{hour}:0{minute}:0{second}")
        else:
            print(f"0{hour}:0{minute}:{second}")
    else:
        print(f"0{hour}:{minute}:{second}")
else:
    print(f"{hour}:{minute}:{second}")
