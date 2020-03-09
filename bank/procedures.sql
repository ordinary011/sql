

USE bank;

CREATE PROCEDURE spAllClients()
BEGIN
SELECT * FROM client;
END;



CREATE PROCEDURE spALLLenLess6()
BEGIN
select * from `bank`.`client` where  length(firstname) < 6;
END;


CREATE PROCEDURE ClientsInLviv()
BEGIN
select * from department where DepartmentCity = 'Lviv';
END;



CREATE PROCEDURE cityWithTheHighestCredits(IN $id INT)
BEGIN
SELECT DepartmentCity FROM bank.client
                             JOIN bank.application ON client.idClient = application.Client_idClient
                             JOIN bank.department ON client.Department_idDepartment = department.idDepartment
WHERE Client_idClient = $id
GROUP BY idClient
ORDER BY sum DESC LIMIT 1;
END;





CALL cityWithTheHighestCredits(4)
CALL cityWithTheHighestCredits(10)
CALL cityWithTheHighestCredits(177)







SELECT * FROM bank.client
JOIN bank.application ON client.idClient = application.Client_idClient;


SELECT idClient, FirstName, lastName, sum(Sum) total FROM bank.client
JOIN bank.application ON client.idClient = application.Client_idClient
GROUP BY idClient
ORDER BY total DESC;









