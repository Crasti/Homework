"""
Реализовать класс Stationery (канцелярская принадлежность). Определить в нем атрибут title (название)
и метод draw (отрисовка). Метод выводит сообщение “Запуск отрисовки.” Создать три дочерних класса Pen (ручка),
Pencil (карандаш), Handle (маркер). В каждом из классов реализовать переопределение метода draw. Для каждого
из классов методы должен выводить уникальное сообщение. Создать экземпляры классов и проверить, что выведет
описанный метод для каждого экземпляра.
"""


class Stationery:
    title = "Stationery"

    def draw(self):
        print("Start to draw...")


class Pen(Stationery):
    def draw(self):
        print("Start draw with pen")


class Pencil(Stationery):
    def draw(self):
        print("Start draw with pencil")


class Handle(Stationery):
    def draw(self):
        print("Start draw with handle")


stationery = Stationery()
pen = Pen()
pencil = Pencil()
handle = Handle()
stationery.draw()
pen.draw()
pencil.draw()
handle.draw()
