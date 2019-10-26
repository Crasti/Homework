"""
Опишите несколько классов: TownCar, SportCar, WorkCar, PoliceCar. У каждого класса должны быть следующие атрибуты:
speed, color, name, is_police (булево). А также несколько методов: go, stop, turn(direction), которые должны сообщать,
что машина поехала, остановилась, повернула (куда).
"""


class Car:

    def go(self, name):
        print(f"The car {name} starts to move")

    def stop(self, name):
        print(f"The car {name} stopped")

    def turn(self, name, direction):
        print(f"The car {name} turn {direction}")


class TownCar(Car):
    speed = 180
    color = "white"
    name = "vaz"
    is_police = False


class SportCar(Car):
    speed = 360
    color = "red"
    name = "porshe"
    is_police = False


class WorkCar(Car):
    speed = 140
    color = "blue"
    name = "maz"
    is_police = False


class PoliceCar(Car):
    speed = 260
    color = "black"
    name = "lamborghini"
    is_police = True


town_car = TownCar()
sport_car = SportCar()
work_car = WorkCar()
police_car = PoliceCar()

town_car.go(TownCar.name)
sport_car.stop(SportCar.name)
work_car.turn(WorkCar.name, "Left")
