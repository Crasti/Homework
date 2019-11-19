"""Среди натуральных чисел, которые были введены, найти наибольшее по сумме цифр. Вывести на экран это число и сумму
его цифр """


def summa(*args):
    summ = 0
    maxi = 0
    for i in args:
        for elem in i:
            a = 0
            b = int(elem)
            for _ in range(len(elem)):
                a += b % 10
                b = int(b / 10)
            if a > summ:
                summ = a
                maxi = elem
    return f'Наибольшее число по сумме цифр - {maxi}, сумма его цифр: {summ}'


print(summa(input('Введите несколько натуральных чисел: ').split()))
