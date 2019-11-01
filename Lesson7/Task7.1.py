"""
Реализовать класс Matrix (матрица). Обеспечить перегрузку конструктора класса (метод __init__()), который должен
принимать данные (список списков) для формирования матрицы.
Подсказка: матрица — система некоторых математических величин, расположенных в виде прямоугольной схемы.
Следующий шаг — реализовать перегрузку метода __str__() для вывода матрицы в привычном виде.
Далее реализовать перегрузку метода __add__() для реализации операции сложения двух объектов класса Matrix
(двух матриц). Результатом сложения должна быть новая матрица.
Подсказка: сложение элементов матриц выполнять поэлементно — первый элемент первой строки первой матрицы складываем с
первым элементом первой строки второй матрицы и т.д.
"""


class Matrix(object):
    def __init__(self, matrix):
        self.matrix = matrix

    def __str__(self):
        return str('\n'.join(['\t'.join([str(i) for i in j]) for j in self.matrix]))

    def __add__(self, other):
        return Matrix([self.matrix[i][j] + other.matrix[i][j] for i in range(len(self.matrix))]
                      for j in range(len(self.matrix[0])))


stroki = int(input("Введите количество строк и столбцов матрицы: "))
stolbci = stroki

matrix1 = Matrix([[i * j for j in range(stroki)] for i in range(stolbci)])
matrix2 = Matrix([[i + j for j in range(stroki)] for i in range(stolbci)])

print('First matrix:\n', matrix1, end='\n\n')
print('Second matrix:\n', matrix2, end='\n\n')
print('Summ of first and second matrix:\n', matrix1 + matrix2)
