"""
Реализовать проект расчета суммарного расхода ткани на производство одежды. Основная сущность (класс) этого проекта —
одежда, которая может иметь определенное название. К типам одежды в этом проекте относятся пальто и костюм. У этих
типов одежды существуют параметры: размер (для пальто) и рост (для костюма). Это могут быть обычные числа: V и H,
соответственно.
Для определения расхода ткани по каждому типу одежды использовать формулы: для пальто (V/6.5 + 0.5),
для костюма (2*H + 0.3). Проверить работу этих методов на реальных данных.
Реализовать общий подсчет расхода ткани. Проверить на практике полученные на этом уроке знания: реализовать
абстрактные классы для основных классов проекта, проверить на практике работу декоратора @property.
"""


class Clother:
    def __init__(self, name, type1, var):
        self.name = name
        self.var = var
        self.type1 = type1
        self.tissue_consumption = 0

    @property
    def tissue_consumption(self):
        return self.__tissue_consumption

    @tissue_consumption.setter
    def tissue_consumption(self, tissue_consumption):
        if self.type1 == "Coat":
            self.__tissue_consumption = self.var / 6.5 + 0.5
        else:
            self.__tissue_consumption = self.var * 2 + 0.3

    def get_tissue_consumption(self):
        return f"Fabric costs for {self.type1} '{self.name}' is {self.tissue_consumption:0.2f}"


coat = Clother("Super", "Coat", 52)
costume = Clother("Troyka", "Costume", 170)
print(coat.get_tissue_consumption())
print(costume.get_tissue_consumption())
