"""Создать пользовательский класс данных (или использовать) один из классов,
реализованных в курсе Python.Основы. Реализовать класс с применением слотов
и обычным способом. Для объекта обычного класса проверить отображение словаря
атрибутов. Сравнить, сколько выделяется памяти для хранения атрибутов обоих
классов."""


from pympler import asizeof

"""--------Со слотами--------"""


class Clother:
    __slots__ = ('name', 'type1', 'var', '__tissue_consumption')

    def __init__(self, name, type1, var):
        self.name = name
        self.var = var
        self.type1 = type1
        self.tissue_consumption = 0

    @property
    def tissue_consumption(self):
        return self.__tissue_consumption

    @tissue_consumption.setter
    def tissue_consumption(self, __tissue_consumption):
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
print('--------Со слотами--------')
print(asizeof.asizeof(coat))
print(asizeof.asizeof(costume))

"""--------Без слотов--------"""


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
print('--------Без слотов--------')
print(asizeof.asizeof(coat))
print(asizeof.asizeof(costume))

"""
--------Со слотами--------
240
240

--------Без слотов--------
584
584

Вывод: в данном примере использование слотов сокращает объем памяти, выделяемый для объекта
более, чем в два раза!

"""