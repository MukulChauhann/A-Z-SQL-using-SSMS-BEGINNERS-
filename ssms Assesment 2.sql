select * from Jomato
exec sp_helpconstraint jomato

-- question number 1
CREATE FUNCTION dbo.StuffChickenIntoBites()
RETURNS NVARCHAR(100)
AS
BEGIN
    DECLARE @OriginalString NVARCHAR(100) = 'Quick Bites';
    DECLARE @ChickenString NVARCHAR(100) = 'Chicken';

    RETURN STUFF(@OriginalString, CHARINDEX(' ', @OriginalString) + 1, 0, @ChickenString + ' ');
END;

SELECT dbo.StuffChickenIntoBites() AS NEW_NAME



-- question number 2
SELECT
    RestaurantName,
    CuisinesType,
    dbo.StuffChickenIntoBites() AS ModifiedCuisineType
FROM Jomato
WHERE Rating = (SELECT MAX(Rating) FROM Jomato);

--question number 3

alter table jomato
add Rating_Status varchar(100)
update jomato set Rating_Status =
case
when Rating > 4 then 'Excelect'
when Rating > 3.5 AND Rating < 4 then 'Good'
when Rating > 3 AND Rating  <= 3.5 then 'Average'
when Rating < 3 then 'Bad'
else 'Unknown'
end;
select * from jomato

-- question number  4

select CEILING(rating) as Ceil_Rating, FLOOR(rating) as Floor_rating, ABS(Rating) as Abs_rating from jomato
select getdate() as today_date, year(getdate())as yearofdate, DATENAME(M,getdate()) as Monthofdate, day(getdate()) as Dayofdate

-- question number 5

select sum(averagecost) as TotalavgCost,RestaurantType from jomato group by rollup(restauranttype)







