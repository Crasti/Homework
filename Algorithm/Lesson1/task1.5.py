"""
Пользователь вводит две буквы. Определить, на каких местах
алфавита они стоят, и сколько между ними находится букв.
"""

letter1, letter2 = ord(input('Введите первую букву: ')), ord(input('Введите вторую букву: '))
if letter1 == letter2:
    print(f'Вы ввели одинаковые буквы, позиция буквы - {letter1 - 96}')
elif letter1 > letter2:
    print(f"Первая буква на {letter1 - 96} месте")
    print(f"Вторая буква на {letter2 - 96} месте")
    print(f"Между ними находится букв - {letter1 - letter2 - 1}")
else:
    print(f"Первая буква на {letter1 - 96} месте")
    print(f"Вторая буква на {letter2 - 96} месте")
    print(f"Между ними находится букв - {letter2 - letter1 - 1} букв")
