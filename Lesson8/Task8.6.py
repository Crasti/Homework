"""
Продолжить работу над вторым заданием. Реализуйте механизм валидации вводимых пользователем данных. Например, для
указания количества принтеров, отправленных на склад, нельзя использовать строковый тип данных.
Подсказка: постарайтесь по возможности реализовать в проекте «Склад оргтехники» максимум возможностей,
изученных на уроках по ООП.
"""


# Для корректной работы данного примера, если не изменять данные внизу, необходимо создать как минимум
# 2 принтера и один сканер (они передаются внизу в отделы)!


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

    def __init__(self, firm, warranty, dpi, color=False, type_eq="printer"):
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


def main():
    while True:
        object = input("Что вы хотите добавить? (printer, scaner, xerox), для завершения 'exit: ")
        if object == "exit":
            break
        elif object == "printer" or object == "scaner" or object == "xerox":
            try:
                while True:
                    for i in range(int(input("Сколько единиц вы хотите внести? "))):
                        if object == "printer":
                            Printer(input("Введите фирму: (Например Samsung)"),
                                    bool(input("Принтер на гарантии? (True or False)")),
                                    input("Введите dpi принтера (Например 320):"),
                                    bool(input("Принтер цветной? (True or False)"))).printer()
                        elif object == "scaner":
                            Scaner(input("Введите фирму: (Например Samsung)"),
                                   bool(input("Сканер на гарантии? (True or False)")),
                                   input("Введите dpi сканера (например 320):"),
                                   (input("Введите разрешение сканера (например 3200х3200)"))).scaner()
                        elif object == "xerox":
                            Xerox(input("Введите фирму: (Например Samsung)"),
                                  bool(input("Ксерокс на гарантии? (True or False)")),
                                  input("Введите кол-во копий в мин (например 15):")).xerox()
                    break
            except ValueError:
                print("Количество техники необходимо указывать целым числом!")
        else:
            print("Это оборудование не предусмотрено для добавления")


if __name__ == "__main__":
    main()

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
