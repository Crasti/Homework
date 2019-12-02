"""Пользователь вводит данные о количестве предприятий, их наименования и прибыль за 4 квартала (т.е. 4 отдельных
числа) для каждого предприятия.. Программа должна определить среднюю прибыль (за год для всех предприятий) и вывести
наименования предприятий, чья прибыль выше среднего и отдельно вывести наименования предприятий, чья прибыль ниже
среднего. """

from collections import namedtuple


class Company(object):
    def __init__(self, num_of_comp, name, q1, q2, q3, q4):
        self.num_of_comp = num_of_comp
        self.name = name
        self.q1 = q1
        self.q2 = q2
        self.q3 = q3
        self.q4 = q4

    def company(self):
        company_dict = namedtuple('company', 'name, q1, q2, q3, q4')
        for i in range(self.num_of_comp):
            company = company_dict(
                name=self.name,
                q1=self.q1,
                q2=self.q2,
                q3=self.q3,
                q4=self.q4)
        return Company.average_cost(company), self.num_of_comp

    def average_cost(self, company, num_of_comp):
        average = int(sum(company.values()) / num_of_comp)
        return Company.print_rez(average, company)

    def print_rez(self, average, company):
        print(f'Средняя прибыль компаний: {average}')
        print(f"Прибыль ниже среднего: {[key for key, val in company.items() if val < average]}")
        print(f"Прибыль выше среднего: {[key for key, val in company.items() if val > average]}")


num_of_comp = int(input('Введите количество компаний: '))

for j in range(num_of_comp):
    company = Company(
        num_of_comp,
        name=input('Введите название компании: '),
        q1=int(input('Прибыль за 1 квартал: ')),
        q2=int(input('Прибыль за 2 квартал: ')),
        q3=int(input('Прибыль за 3 квартал: ')),
        q4=int(input('Прибыль за 4 квартал: '))
    )
    company.company()
