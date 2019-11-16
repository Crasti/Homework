"""
Продолжить работу над первым заданием. Разработать методы, отвечающие за приём оргтехники на склад и передачу в
определенное подразделение компании. Для хранения данных о наименовании и количестве единиц оргтехники, а также других
данных, можно использовать любую подходящую структуру, например словарь.
"""


class Sklad:
    sklad = {"printer": {}, "scaner": {}, "xerox": {}}
    otdel = {"IT": {"printer": {}, "scaner": {}, "xerox": {}},
             "accounting": {"printer": {}, "scaner": {}, "xerox": {}},
             "engineers": {"printer": {}, "scaner": {}, "xerox": {}}}

    @staticmethod
    def sklad_in(techniks):
        Sklad.sklad[techniks["type"]][techniks["count"]] = techniks["object"]
        return Sklad.sklad

    @staticmethod
    def sklad_out(depart, techniks, number):
        Sklad.otdel[depart][techniks][number] = Sklad.sklad[techniks].pop(number)  # Выдаем технику и удаляем со склада
        return Sklad.otdel


class OfficeEquipment:
    def __init__(self, firm, warranty=True):
        self.firm = firm
        self.warranty = warranty


class Printer(OfficeEquipment):
    count = 0

    def __init__(self, firm, warranty, dpi, type_eq="printer", color=False):
        super().__init__(firm, warranty)
        self.dpi = dpi
        self.color = color
        self.type_eq = type_eq
        Printer.count += 1

    def printer(self):
        exempl = {"type": self.type_eq, "count": self.count,
                  "object": {"firm": self.firm, "warranty": self.warranty, "dpi": self.dpi, "color": self.color}}
        return Sklad.sklad_in(exempl)


class Scaner(OfficeEquipment):
    count = 0

    def __init__(self, firm, warranty, dpi, resolution, type_eq='scaner'):
        super().__init__(firm, warranty)
        self.dpi = dpi
        self.resolution = resolution
        self.type_eq = type_eq
        Scaner.count += 1

    def scaner(self):
        exempl = {"type": self.type_eq, "count": self.count,
                  "object": {"firm": self.firm, "warranty": self.warranty,
                             "dpi": self.dpi, "resolution": self.resolution}}
        return Sklad.sklad_in(exempl)


class Xerox(OfficeEquipment):
    name = "xerox"
    count = 0

    def __init__(self, firm, warranty, speed, type_eq='xerox'):
        super().__init__(firm, warranty)
        self.speed = speed
        self.type_eq = type_eq
        Xerox.count += 1

    def xerox(self):
        exempl = {"type": self.type_eq, "count": self.count, "object":
            {"firm": self.firm, "warranty": self.warranty, "speed": self.speed}}
        return Sklad.sklad_in(exempl)


# Create printers and insert in to sklad
printer1 = Printer("Samsung", False, 320).printer()
printer2 = Printer("HP", True, 320).printer()
printer3 = Printer("HP", True, 340).printer()

# Create scaners and insert in to sklad
scaner1 = Scaner("HP", True, 320, "3200x3200").scaner()
scaner2 = Scaner("Samsung", False, 240, "2400x2400").scaner()

# Create xerox and insert in to sklad
xerox1 = Xerox("Xerox", True, 32).xerox()

print("На складе сейчас: \n", Sklad.sklad, end="\n\n")

# moving equipment to the department IT
Sklad.sklad_out("IT", "printer", 1)
Sklad.sklad_out("IT", "printer", 2)

# moving equipment to the department engineers
Sklad.sklad_out("engineers", "scaner", 1)

# information output about the issued equipment
print("Выдано в отделы: \n", Sklad.otdel, end="\n\n")

# printing stock in stock
print("Остатки на складе: \n", Sklad.sklad, end="\n\n")

print("остаток принтеров на складе: \n", Sklad.sklad["printer"])
