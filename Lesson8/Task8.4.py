"""
Начните работу над проектом «Склад оргтехники». Создайте класс, описывающий склад. А также класс «Оргтехника», который
будет базовым для классов-наследников. Эти классы — конкретные типы оргтехники (принтер, сканер, ксерокс). В базовом
классе определить параметры, общие для приведенных типов. В классах-наследниках реализовать параметры, уникальные для
каждого типа оргтехники.
"""


class Sklad:
    pass


class OfficeEquipment:
    def __init__(self, firm, warranty):
        self.firm = firm
        self.warranty = warranty


class Printer(OfficeEquipment):
    def __init__(self, firm, warranty, dpi, color=False):
        super().__init__(firm, warranty)
        self.dpi = dpi
        self.color = color


class Scaner(OfficeEquipment):
    def __init__(self, firm, warranty, dpi, resolution):
        super().__init__(firm, warranty)
        self.dpi = dpi
        self.resolution = resolution


class Xerox(OfficeEquipment):
    def __init__(self, firm, warranty, speed):
        super().__init__(firm, warranty)
        self.speed = speed
