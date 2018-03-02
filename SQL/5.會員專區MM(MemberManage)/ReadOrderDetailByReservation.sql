SELECT
	ROW_NUMBER () OVER (ORDER BY Orderdetail_SeqNo) AS RowNo,
	Member_ID,
	Reservation_ID,
	Meal_Name,
	MC.MealClassification_Name,
	Orderdetail_Quantity,
	Orderdetail_Other,
	dbo.FN_Money_Formate (Meal_Price) AS Meal_Price,
	dbo.FN_Money_Formate (
		Orderdetail_Quantity * Meal_Price
	) AS SubTotal
FROM
	Orderdetail AS OD
INNER JOIN Meal ON Meal.Meal_ID = OD.Meal_ID
INNER JOIN MealClassification AS MC ON MC.MealClassification_ID = Meal.MealClassification_ID
WHERE
	OD.Member_ID = 2
AND OD.Reservation_ID = 1
UNION ALL
	SELECT
		NULL,
		2,
		1,
		NULL,
		NULL,
		NULL,
		NULL,
		NULL,
		dbo.FN_Money_Formate (
			dbo.FN_CalculateMemberOrder (1, 2)
		)