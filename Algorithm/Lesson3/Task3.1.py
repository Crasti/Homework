"""В диапазоне натуральных чисел от 2 до 99 определить,
сколько из них кратны каждому из чисел в диапазоне от 2 до 9"""

for i in range(2, 10):
    rez = 0
    for j in range(2, 100):
        if j % i == 0:
            rez += 1
    print(f'{i} кратно {rez} числам')
