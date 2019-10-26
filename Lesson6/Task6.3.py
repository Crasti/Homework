"""
Реализовать базовый класс Worker (работник), в котором определить атрибуты: name, surname, position (должность),
income (доход). Последний атрибут должен быть защищенным и ссылаться на словарь, содержащий элементы: оклад и премия,
например, {"profit": profit, "bonus": bonus}. Создать класс Position (должность) на базе класса Worker.
В классе Position реализовать методы получения полного имени сотрудника (get_full_name) и дохода с учетом премии
(get_full_profit). Проверить работу примера на реальных данных (создать экземпляры класса Position, передать данные,
проверить значения атрибутов, вызвать методы экземпляров).
"""


class Worker:
    def __init__(self, name, surname, position, _income):
        self.name = name
        self.surname = surname
        self.position = position
        self._income = _income


class Position(Worker):
    def get_full_name(self):
        print(f"Full name is: {self.name + ' ' + self.surname}")

    def get_full_profit(self):
        print(f"Full profit is: {self._income['profit'] * self._income['bonus']:0.2f}")


def main():
    while True:
        try:

            worker = Position(input('Enter name: '), input('Enter surname: '), input('Enter position: '),
                              {"profit": int(input('Enter profit: ')),
                               "bonus": float(input('Enter bonus like 1.3 or etc: '))})
            worker.get_full_name()
            worker.get_full_profit()
            break
        except ValueError as v:
            print(f'{v} wrong data!')


if __name__ == "__main__":
    main()
