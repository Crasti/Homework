"""
Создать класс TrafficLight (светофор) и определить у него один атрибут color (цвет) и метод running (запуск).
Атрибут реализовать как приватный. В рамках метода реализовать переключение светофора в режимы: красный, желтый,
зеленый. Время перехода между режимами должно составлять 7 и 2 секунды. Проверить работу примера, создав экземпляр
и вызвав описанный метод.
"""
from time import sleep


class TrafficLight:
    __color = "Черный"

    def running(self):
        while True:
            print("Trafficlight is red now")
            sleep(7)
            print("Trafficlight is yellow now")
            sleep(2)
            print("Trafficlight is green now")
            sleep(7)
            print("Trafficlight is yellow now")
            sleep(2)


trafficlight = TrafficLight()
trafficlight.running()
