"""Пользователь вводит данные о количестве предприятий, их наименования и прибыль за 4 квартала (т.е. 4 отдельных
числа) для каждого предприятия.. Программа должна определить среднюю прибыль (за год для всех предприятий) и вывести
наименования предприятий, чья прибыль выше среднего и отдельно вывести наименования предприятий, чья прибыль ниже
среднего. """

from collections import namedtuple


def company_list(num_of_comp):
    rezult_massive = {}
    company_dict = namedtuple('company', 'name, q1, q2, q3, q4')
    for i in range(num_of_comp):
        company = company_dict(
            name=input('Введите название компании: '),
            q1=int(input('Прибыль за 1 квартал: ')),
            q2=int(input('Прибыль за 2 квартал: ')),
            q3=int(input('Прибыль за 3 квартал: ')),
            q4=int(input('Прибыль за 4 квартал: ')))
        rezult_massive[company.name] = int((company.q1 + company.q2 + company.q3 + company.q4) / 4)
#        print(company)
#    print(rezult_massive)
    average = int(sum(el for el in rezult_massive.values()) / num_of_comp)
    print(f'Средняя прибыль компаний: {average}')
    print(f"Прибыль ниже среднего: {[key for key, val in rezult_massive.items() if val < average]}")
    print(f"Прибыль выше среднего: {[key for key, val in rezult_massive.items() if val > average]}")


company_list(int(input('Введите количество компаний: ')))
