"""Вывести на экран коды и символы таблицы ASCII, начиная с символа под номером 32 и заканчивая 127-м включительно.
Вывод выполнить в табличной форме: по десять пар "код-символ" в каждой строке """


def ascii_code(start, stop=127):
    for i in range(10):
        if start > stop:
            break
        else:
            print(f'{start}-->{chr(start)}  ', end="")
            start += 1
    if start <= stop:
        print()
        return ascii_code(start)
    else:
        return '\nПрограмма завершена'


print(ascii_code(32))
