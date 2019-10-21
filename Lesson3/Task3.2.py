"""Реализовать функцию, принимающую несколько параметров, описывающих
данные пользователя: имя, фамилия, год рождения, город проживания, email,
телефон. Функция должна принимать параметры как именованные аргументы.
Реализовать вывод данных о пользователе одной строкой."""


def personal_info(**kwargs):
    return kwargs


print(personal_info(name=input("Enter your name: "), surname=input("Enter your surname: "),
      birthday=input("Enter your birthday: "), city=input("Enter your city: "), email=input("Enter your email: "),
      phone_number=input("Enter your phone number: ")))
