## Customer Analysis ##
## Top 5 customers who have spent the most on vehicle repairs and parts ##
SELECT Name, SUM(Total) AS TotalSpent
FROM customer
join invoice
on invoice.CustomerID=customer.CustomerID 
Group by Name
Order by TotalSpent Desc;

## Average spending of customers on repairs and parts ##
SELECT AVG(Total) AS AvgSpending
FROM invoice;

## Frequency of customer visits and identifying patterns ##
SELECT OwnerName, COUNT(InvoiceID) AS Visit_Count
FROM vehicle
join job
on job.VehicleID=vehicle.VehicleID
GROUP BY OwnerName
ORDER BY Visit_Count DESC;

       ## Vehicle Analysis ##
### Average Milage of vehicle serviced ###
SELECT AVG(Mileage) AS Avg_Mileage
FROM Vehicle;

## Most common vehicle makes and models brought in for service ##
SELECT Make, Model, COUNT(JobID) AS Total_service_time
FROM job
Right join vehicle
on job.VehicleID=Vehicle.VehicleID
GROUP BY Make, Model
ORDER BY Total_service-time DESC;

## Distribution of vehicle ages and trends in service requirements based on vehicle age ##
SELECT Make, Model,(2024-Year) as Age, Description
FROM Vehicle
Right Join job 
on vehicle.vehicleid=job.vehicleid;



      
      #Job Performance Analysis#
## Most common types of jobs performed and their frequency##

SELECT Description, COUNT(JobID) AS Frequency
FROM Job
GROUP BY Description
ORDER BY Frequency DESC;

## Total revenue generated from each type of job ##
SELECT Description, SUM(Amount) AS TotalRevenue
FROM Job
GROUP BY Description
ORDER BY TotalRevenue DESC;

## Jobs with the highest and lowest average costs ##
SELECT Description, AVG(Amount) AS AvgCost
FROM Job
GROUP BY Description
ORDER BY AvgCost DESC;

    ## Part Usage Analysis ##
   ## Top 5 most frequently used parts and their total usage ##
   SELECT PartName, SUM(Quantity) AS TotalUsage
FROM Parts
GROUP BY PartName
ORDER BY TotalUsage DESC
LIMIT 5;

## Average cost of parts used in repairs ##
SELECT AVG(UnitPrice) AS AvgCost
FROM Parts;

 ## Total revenue generated from parts sales ##
 SELECT SUM(Amount) AS TotalRevenue
FROM Parts;

## Financial Analysis #
 ## Total revenue generated from labour and parts for each month ##

SELECT DATE_FORMAT(InvoiceDate, '%Y-%m') AS Month, SUM(TotalLabour) AS Total_Labour_Revenue, SUM(TotalParts) AS Total_Parts_Revenue
FROM invoice
GROUP BY Month
ORDER BY Month;

## Overall profitability of the repair shop ##
SELECT SUM(Total) AS TotalRevenue, SUM(TotalLabour) + SUM(TotalParts) AS TotalCost, (SUM(Total) - (SUM(TotalLabour) + SUM(TotalParts))) AS Profit
FROM invoice;

##Impact of sales tax on the total revenue ##
SELECT SUM(Total) AS TotalRevenue, SUM(Total) * 0.13 AS SalesTaxImpact
FROM invoice;

