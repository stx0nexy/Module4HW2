--------------------------�������----------------------------

----------------------������� �1-----------------------------
--������� ��� ���������� �� ������� Sales.Customer 
-------------------------------------------------------------
SELECT * 
FROM Sales.Customer

GO

----------------------������� �2-----------------------------
--������� ��� ���������� �� ������� Sales.Store ��������������� 
--�� Name � ���������� �������
-------------------------------------------------------------
SELECT * 
FROM Sales.Store 
ORDER BY Name

GO

----------------------������� �3-----------------------------
--������� �� ������� HumanResources.Employee ��� ����������
--� ������ �����������, ������� �������� ����� 1989-09-28
-------------------------------------------------------------
SELECT TOP 10 *
FROM HumanResources.Employee
WHERE BirthDate>'1989-09-28'

GO

----------------------������� �4-----------------------------
--������� �� ������� HumanResources.Employee �����������
--� ������� ��������� ������ LoginID �������� 0.
--������� ������ NationalIDNumber, LoginID, JobTitle.
--������ ������ ���� ������������� �� JobTitle �� ��������
-------------------------------------------------------------
SELECT LoginID, NationalIDNumber, JobTitle
FROM HumanResources.Employee
WHERE LoginID LIKE '%0'
ORDER BY JobTitle DESC

GO

----------------------������� �5-----------------------------
--������� �� ������� Person.Person ��� ���������� � �������, ������� ���� 
--��������� � 2008 ���� (ModifiedDate) � MiddleName ��������
--�������� � Title �� �������� �������� 
-------------------------------------------------------------
SELECT *
FROM Person.Person
WHERE ModifiedDate LIKE '%2008%' 
AND MiddleName IS NOT NULL 
AND Title IS NULL

GO

----------------------������� �6-----------------------------
--������� �������� ������ (HumanResources.Department.Name) ��� ����������
--� ������� ���� ����������
--������������ ������� HumanResources.EmployeeDepartmentHistory � HumanResources.Department
-------------------------------------------------------------
SELECT DISTINCT Name
FROM HumanResources.EmployeeDepartmentHistory, HumanResources.Department
WHERE Department.DepartmentID IS NOT NULL

GO

----------------------������� �7-----------------------------
--������������ ������ �� ������� Sales.SalesPerson �� TerritoryID
--� ������� ����� CommissionPct, ���� ��� ������ 0
-------------------------------------------------------------
SELECT TerritoryID, SUM(CommissionPct) AS ComissionSum
FROM Sales.SalesPerson
WHERE CommissionPct > 0
GROUP BY TerritoryID

GO

----------------------������� �8-----------------------------
--������� ��� ���������� � ����������� (HumanResources.Employee) 
--������� ����� ����� ������� ���-�� 
--������� (HumanResources.Employee.VacationHours)
-------------------------------------------------------------
SELECT *
FROM HumanResources.Employee
WHERE VacationHours =
(SELECT MAX(VacationHours)
FROM HumanResources.Employee)

GO

----------------------������� �9-----------------------------
--������� ��� ���������� � ����������� (HumanResources.Employee) 
--������� ����� ������� (HumanResources.Employee.JobTitle)
--'Sales Representative' ��� 'Network Administrator' ��� 'Network Manager'
-------------------------------------------------------------
SELECT *
FROM HumanResources.Employee
WHERE JobTitle='Sales Representative'
OR JobTitle='Network Administrator'
OR JobTitle='Network Manager'

GO

----------------------������� �10-----------------------------
--������� ��� ���������� � ����������� (HumanResources.Employee) � 
--�� ������� (Purchasing.PurchaseOrderHeader). ���� � ���������� ���
--������� �� ������ ���� ������� ����!!!
-------------------------------------------------------------
SELECT *
FROM HumanResources.Employee AS Employee
LEFT JOIN Purchasing.PurchaseOrderHeader AS PurchaseOrderHead
ON Employee.BusinessEntityID = PurchaseOrderHead.EmployeeID

GO