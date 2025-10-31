select * from Employees;

-- VANESSA CEZAR DO NASCIMENTO | 24/10/2025 | EXERCICIOS DE VIEWS

/*Exercicio 1 - Crie uma view que liste todos os funcionarios que não são chefes*/
GO
CREATE VIEW vw_FuncionarioNaoChefes AS
SELECT 
    E.EmployeeID,
    E.FirstName,
    E.LastName,
    E.Title,
    E.ReportsTo
FROM Employees AS E
WHERE E.EmployeeID NOT IN (
    SELECT DISTINCT ReportsTo
    FROM Employees
    WHERE ReportsTo IS NOT NULL
    );

go
select * from vw_FuncionarioNaoChefes

/* Exercicio 2 - Faça uma view que liste a quantidade de vendas que cada produto (o quanto cada produto foi vendido)*/

GO
CREATE VIEW vw_quantidadeVendida as
SELECT P.ProductID, P.ProductName, SUM(OD.Quantity) AS Qtd_vendida
FROM [Order Details] AS OD, Products AS P
WHERE OD.ProductID = P.ProductID
GROUP BY P.ProductID, p.ProductName;

go 
select * from vw_quantidadeVendida order by ProductID;

/* exercicio 3 - Faça uma view que liste todos os territorios e quantos vendedores estão vinculados a ele*/
go
CREATE VIEW vw_quantidadeVendedoresTerritorio as
SELECT T.TerritoryDescription, T.TerritoryID, SUM(ET.EmployeeID) AS qtd_vendedores
FROM Territories AS T
INNER JOIN EmployeeTerritories AS ET
ON ET.TerritoryID = T.TerritoryID
GROUP BY T.TerritoryDescription, T.TerritoryID;

go 
select * from vw_quantidadeVendedoresTerritorio order by TerritoryDescription;


/*exercicio 4 - Faça uma view que retorne o nome do cliente da venda de maior valor */
GO
CREATE VIEW vw_vendaMaiorValor as
SELECT c.CompanyName AS NomeCliente, o.OrderID, SUM((od.Quantity * od.UnitPrice) - od.Discount) AS valor_total
FROM [Order Details] AS od
JOIN Orders AS o
ON od.OrderID = o.OrderID
JOIN Customers AS c 
ON o.CustomerID = c.CustomerID
GROUP BY c.CompanyName, o.OrderID
HAVING SUM((od.Quantity * od.UnitPrice) - od.Discount) = (
    SELECT MAX(valor_total)
    FROM (
        SELECT od2.OrderID,SUM((od2.Quantity * od2.UnitPrice) - od2.Discount) AS valor_total
        FROM [Order Details] AS od2
        GROUP BY od2.OrderID
    ) AS totais
);

go
select * from vw_vendaMaiorValor;

/*exercicio 5 - Faça uma view que liste os vendedores ordenados pela lucratividade*/
GO
CREATE VIEW vw_lucratividadeVendedores as
SELECT E.FirstName, E.LastName, O.EmployeeID, O.OrderID,  SUM((od.Quantity * od.UnitPrice) - od.Discount) AS valor_total
FROM [Order Details] AS OD
INNER JOIN Orders AS O
ON O.OrderID = OD.OrderID
INNER JOIN Employees AS E
ON E.EmployeeID = O.EmployeeID
GROUP BY 
    O.OrderID,O.EmployeeID, E.FirstName, E.LastName

go
select * from vw_lucratividadeVendedores ORDER BY valor_total DESC;


/*exercicio 6 - Faça uma view que retorne os produtos, seu fornecedores, sua categoria, seu preço e a informação de ele estar descontinuado ou não, para aqueles que possuem estoque*/
go
CREATE VIEW vw_produtos as 
select p.ProductID, p.ProductName, s.CompanyName as fornecedor,
       c.CategoryName as categoria, p.UnitPrice as preço,
       CASE WHEN p.Discontinued = 1 then 'sim' else 'não' end as descontinuado
from Products as p
inner join Suppliers as s
on s.SupplierID = p.SupplierID
inner join Categories as c
on c.CategoryID = p.CategoryID
where p.UnitsInStock > 0;

select * from vw_produtos order by ProductName

