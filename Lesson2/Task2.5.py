"""Реализовать структуру «Рейтинг», представляющую собой не возрастающий набор натуральных чисел.
У пользователя необходимо запрашивать новый элемент рейтинга. Если в рейтинге существуют элементы
с одинаковыми значениями, то новый элемент с тем же значением должен разместиться после них."""

elem = int(input("Введите натуральное число: "))
rating = [7, 5, 3, 3, 2]
if elem <= rating[-1]:
    rating.append(elem)
elif elem > rating[0]:
    rating.insert(0, elem)
else:
    for i in range(1, len(rating) - 2):
        if elem > rating[i]:
            rating.insert(i, elem)
            break
print(rating)
