"""В программе генерируется случайное целое число от 0 до 100. Пользователь должен его отгадать не более чем за 10
попыток. После каждой неудачной попытки должно сообщаться больше или меньше введенное пользователем число, чем то,
что загадано. Если за 10 попыток число не отгадано, то вывести загаданное число """

from random import randint


def game():
    rand = randint(0, 100)
    print('Я загадал число от 0 до 100, попробуй отгадать его не более, чем за 10 попыток!')
    count1 = 10
    while count1 != 0:
        while True:
            try:
                num = int(input('Мое число это? '))
            except ValueError:
                print('Пожалуйтста, введите именно целое число!')
            else:
                break
        if rand == num:
            print(f"Поздравляю, именно {rand} я и загадал!")
            break
        else:
            count1 -= 1
            print('Нет, мое число больше!' if num < rand else 'Мое число несколько меньше!')
            print(f'Осталось попыток: {count1}' if count1 > 0 else 'Попытки кончились ;(')
            continue
    print(f'К сожалению вы не угадали, моим числом было: {rand}' if count1 == 0 else 'Спасибо за игру!')


game()
