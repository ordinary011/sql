# 1 Вибрати усіх клієнтів, чиє імя має менше ніж 6 символів
SELECT * FROM bank.client WHERE LENGTH(FirstName) < 6;

# 2 Вибрати львівські відділення банку
SELECT * FROM bank.department WHERE DepartmentCity = 'Lviv';

# 3 Вибрати клієнтів з вищою освітою та посортувати по прізвищу
SELECT * FROM bank.client WHERE Education = 'high' ORDER BY LENGTH(LastName);

# 4 Виконати сортування у зворотньому порядку над таблицею application і вивести 5 останніх елементів
SELECT * FROM bank.application ORDER BY Sum DESC LIMIT 5;

# 5 Вивести усіх клієнтів, чиє прізвище закінчується на K чи VA
SELECT * FROM bank.client WHERE LastName LIKE '%va' OR LastName LIKE '%k';

# 6 Вивести клієнтів банку, які обслуговуються київськими відділеннями
SELECT * FROM
    bank.client cl
        INNER JOIN
    bank.department dp ON cl.Department_idDepartment = dp.idDepartment
WHERE
    dp.DepartmentCity = 'Kyiv';

# 7 Вивести імена клієнтів та їхні номера паспорту
SELECT FirstName, LastName, Passport FROM bank.client;

#8 Вивести дані про клієнтів, які мають кредит більше ніж на 5000 тисяч гривень
SELECT * FROM
    bank.client cl
        INNER JOIN
    bank.application ap ON ap.Client_idClient = cl.idClient
WHERE
    ap.CreditState = 'Not returned'
        AND ap.sum > 5000;

# 9 Порахувати кількість клієнтів лише львівських відділень
SELECT 
    COUNT(*)
FROM
    bank.client cl
        INNER JOIN
    bank.department dp ON cl.Department_idDepartment = dp.idDepartment
WHERE
    dp.DepartmentCity = 'Lviv';

# 10 Знайти кредити, які мають найбільшу суму для кожного клієнта окремо
SELECT 
    cl.*, MAX(Sum)
FROM
    bank.client cl
        INNER JOIN
    bank.application apl ON cl.idClient = apl.Client_idClient
GROUP BY cl.idClient;

# 11 Визначити кількість заявок на кредит для кожного клієнта
SELECT 
    cl.*, count(apl.Client_idClient) AS amount_of_applications
FROM
    bank.client cl
        INNER JOIN
    bank.application apl ON cl.idClient = apl.Client_idClient
GROUP BY apl.Client_idClient;

# 12 Визначити найбільший та найменший кредити
SELECT 
    MAX(Sum) the_greater_credit, MIN(Sum) the_lowest_credit
FROM
    bank.application;

# 13 Порахувати кількість кредитів для клієнтів,які мають вищу освіту
SELECT 
    COUNT(apl.Client_idClient) AS amount_of_credits
FROM
    bank.client cl
        INNER JOIN
    bank.application apl ON cl.idClient = apl.Client_idClient
WHERE
    cl.Education = 'high';

# 14 Вивести дані про клієнта, в якого середня сума кредитів найвища
SELECT 
    cl.*, AVG(apl.Sum) avg
FROM
    bank.client cl
        INNER JOIN
    bank.application apl ON cl.idClient = apl.Client_idClient
GROUP BY apl.Client_idClient
ORDER BY avg DESC
LIMIT 1;

# 15 Вивести відділення, яке видало в кредити найбільше грошей
SELECT 
    SUM(apl.Sum) total, dp.idDepartment, dp.DepartmentCity
FROM
    bank.department dp
        INNER JOIN
    bank.client cl ON cl.Department_idDepartment = dp.idDepartment
        INNER JOIN
    bank.application apl ON apl.Client_idClient = cl.idClient
GROUP BY dp.idDepartment
ORDER BY total DESC
LIMIT 1;

# 16 Вивести відділення, яке видало найбільший кредит
SELECT 
    apl.Sum, dp.idDepartment, dp.DepartmentCity
FROM
    bank.department dp
        INNER JOIN
    bank.client cl ON cl.Department_idDepartment = dp.idDepartment
        INNER JOIN
    bank.application apl ON apl.Client_idClient = cl.idClient
ORDER BY apl.Sum DESC
LIMIT 1;

# 17 Знайти львівські відділення, які видали кредитів на загальну суму більше ніж 5000
SELECT 
    SUM(apl.Sum) total, dp.idDepartment, dp.DepartmentCity
FROM
    bank.department dp
        INNER JOIN
    bank.client cl ON cl.Department_idDepartment = dp.idDepartment
        INNER JOIN
    bank.application apl ON apl.Client_idClient = cl.idClient
WHERE dp.DepartmentCity = 'Lviv'
GROUP BY dp.idDepartment
HAVING total > 5000;

# 18 Знайти клієнтів, які повністю погасили кредити на суму більше ніж 5000
SELECT 
    cl.*, apl.CreditState
FROM
    bank.client cl
        INNER JOIN
    bank.application apl ON cl.idClient = apl.Client_idClient
WHERE
    apl.CreditState = 'Returned'
        AND apl.Sum > 5000;


# 19 Знайти максимальний неповернений кредит
SELECT 
    Sum, CreditState
FROM
    bank.application
ORDER BY Sum DESC
LIMIT 1;


# 20 Знайти клієнта, сума кредиту якого найменша
SELECT 
    cl.*, SUM(apl.Sum) total
FROM
    bank.client cl
        INNER JOIN
    bank.application apl ON cl.idClient = apl.Client_idClient
GROUP BY cl.idClient
ORDER BY total DESC
LIMIT 1;


# 21 Знайти кредити, сума яких більша за середнє значення усіх кредитів
SELECT 
    cl.*, SUM(apl.Sum) total
FROM
    bank.client cl
        INNER JOIN
    bank.application apl ON cl.idClient = apl.Client_idClient
GROUP BY cl.idClient
HAVING total > AVG(apl.Sum);


# 22 місто чувака який набрав найбільше кредитів
SELECT 
    cl.city, COUNT(apl.idApplication) count_of_credits
FROM
    bank.client cl
        INNER JOIN
    bank.application apl ON cl.idClient = apl.Client_idClient
GROUP BY apl.Client_idClient
ORDER BY count_of_credits DESC
LIMIT 1;


# 23 Знайти клієнтів, які є з того самого міста, що і клієнт, який взяв найбільшу кількість кредитів
SELECT * FROM
    bank.client
WHERE
    City = (SELECT 
            cl.city
        FROM
            bank.client cl
                INNER JOIN
            bank.application apl ON cl.idClient = apl.Client_idClient
        GROUP BY apl.Client_idClient
        HAVING COUNT(apl.idApplication)
        ORDER BY COUNT(apl.idApplication) DESC
        LIMIT 1);

# 24 Усім клієнтам, які мають вищу освіту, встановити усі їхні кредити у розмірі 6000 грн
UPDATE bank.application apl
INNER JOIN bank.client cl
ON cl.idClient = apl.Client_idClient
SET apl.Sum = 6000
WHERE cl.Education = 'high';


# 25 Усіх клієнтів київських відділень пересилити до Києва
UPDATE bank.client cl
INNER JOIN bank.department dp
ON cl.Department_idDepartment = dp.idDepartment
SET cl.City = 'Kyiv'
WHERE dp.DepartmentCity = 'Kyiv';


# 26 Видалити усі кредити, які є повернені
DELETE FROM bank.application apl WHERE apl.CreditState = 'Returned';


# 27 Видалити кредити клієнтів, в яких друга літера прізвища є голосною
# vowels in English => A, E, I, O, U
DELETE apl FROM bank.application apl
        INNER JOIN
    bank.client cl ON cl.idClient = apl.Client_idClient 
WHERE
    cl.LastName REGEXP '^.[aeyuio]+';


