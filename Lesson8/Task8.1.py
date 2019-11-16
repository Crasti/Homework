"""
Реализовать класс «Дата», функция-конструктор которого должна принимать дату в виде строки формата «день-месяц-год».
В рамках класса реализовать два метода. Первый, с декоратором @classmethod, должен извлекать число, месяц,
год и преобразовывать их тип к типу «Число». Второй, с декоратором @staticmethod, должен проводить валидацию числа,
месяца и года (например, месяц — от 1 до 12). Проверить работу полученной структуры на реальных данных.
"""

date_dict = {1: 31, 2: 28, 3: 31, 4: 30, 5: 31, 6: 30, 7: 31, 8: 31, 9: 30, 10: 31, 11: 30, 12: 31}


class Date:
    def __init__(self, data):
        self.data = data

    @classmethod
    def convertation(cls, data):
        date1 = tuple(map(int, data.split('-')))
        return date1

    @staticmethod
    def validation(date):
        if date[2] <= 2019:
            if 0 < date[1] < 13:
                if 0 < date[0] <= date_dict[date[1]]:
                    print('This date is correct!')
                else:
                    print('In this month cannot be this number of days')
            else:
                print('Month can be in the range of 1 to 12')
        else:
            print('Year cannot be more than 2019')


def main():
    while True:
        try:
            date1 = Date.convertation(str(input('Enter the date like 01-02-1999: ')))
            Date.validation(date1)
            break
        except ValueError as v:
            print(f'{v} wrong data!')


if __name__ == "__main__":
    main()
