"""Подсчитать, сколько было выделено памяти под переменные в ранее разработанных программах в рамках первых трех
уроков. Проанализировать результат и определить программы с наиболее эффективным использованием памяти """

from memory_profiler import profile
import sys


@profile(precision=4)
def prime(num):
    i = 1
    massive = [2]
    while len(massive) < num:
        i += 2
        massive.append(i)
        for el in massive[0:-1]:
            if i % el == 0:
                massive.pop(-1)
                break
    return f'{num} по счету простое число: {massive[-1]}'


@profile(precision=4)
def prime_erato(num):
    mass = [i for i in range(100000)]
    mass[1] = 0
    for el in mass:
        if el > 1:
            for j in range(el * 2, len(mass), el):
                mass[j] = 0
    massive = [e for e in mass if e != 0]
    return f'{num} по счету простое число: {massive[num - 1]}'


print('Python %s on %s' % (sys.version, sys.platform))

if __name__ == "__main__":
    prime(1000)
    prime_erato(1000)


"""
print('Python %s on %s' % (sys.version, sys.platform))
Python 3.6.9 (default, Nov  7 2019, 10:44:02) 
[GCC 8.3.0] on linux


Line #    Mem usage    Increment   Line Contents
================================================
     8  29.2812 MiB  29.2812 MiB   @profile(precision=4)
     9                             def prime(num):
    10  29.2812 MiB   0.0000 MiB       i = 1
    11  29.2812 MiB   0.0000 MiB       massive = [2]
    12  29.2812 MiB   0.0000 MiB       while len(massive) < num:
    13  29.2812 MiB   0.0000 MiB           i += 2
    14  29.2812 MiB   0.0000 MiB           massive.append(i)
    15  29.2812 MiB   0.0000 MiB           for el in massive[0:-1]:
    16  29.2812 MiB   0.0000 MiB               if i % el == 0:
    17  29.2812 MiB   0.0000 MiB                   massive.pop(-1)
    18  29.2812 MiB   0.0000 MiB                   break
    19  29.2812 MiB   0.0000 MiB       return f'{num} по счету простое число: {massive[-1]}'
Filename: /home/roman/Homework/Algorithm/Lesson6/Task6.1.py
Line #    Mem usage    Increment   Line Contents
================================================
    22  29.2812 MiB  29.2812 MiB   @profile(precision=4)
    23                             def prime_erato(num):
    24  32.9023 MiB   0.2539 MiB       mass = [i for i in range(100000)]
    25  32.9023 MiB   0.0000 MiB       mass[1] = 0
    26  32.9023 MiB   0.0000 MiB       for el in mass:
    27  32.9023 MiB   0.0000 MiB           if el > 1:
    28  32.9023 MiB   0.0000 MiB               for j in range(el * 2, len(mass), el):
    29  32.9023 MiB   0.0000 MiB                   mass[j] = 0
    30  32.9023 MiB   0.0000 MiB       massive = [e for e in mass if e != 0]
    31  32.9023 MiB   0.0000 MiB       return f'{num} по счету простое число: {massive[num - 1]}'

В данном коде нет проблем с расходованием памяти, единственный видимый расход - 
генерация чисел от 0 до 100000 в эратосфене.


"""
