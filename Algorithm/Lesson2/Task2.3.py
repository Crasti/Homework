"""Сформировать из введенного числа обратное по порядку входящих в него цифр и вывести на экран. Например,
если введено число 3486, то надо вывести число 6843 """


def reverse(num1):
    rez = ''
    n = len(str(num1))
    while n > 0:
        rez += str(num1 % 10)
        num1 = int(num1 / 10)
        n -= 1
    return f'Ваше число наоборот - {rez}'


print(reverse(int(input('Введите целое число: '))))
