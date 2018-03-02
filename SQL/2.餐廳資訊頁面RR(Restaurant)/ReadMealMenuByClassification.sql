SELECT
	Meal_Name,
	MealClassification_Name,
	Meal_Picture,
	dbo.FN_Money_Formate (Meal_Price) AS Meal_Price,
	Meal_Recommendation,
	Meal_Summary,
	Meal_Caloric,
	IIF (
		Meal_Vegetarian = 1,
		'¯À­¹',
		'«D¯À'
	) AS Meal_Vegetarian,
	Meal_Spicy
FROM
	Meal
INNER JOIN MealClassification AS MC ON MC.MealClassification_ID = Meal.MealClassification_ID
WHERE
	Restaurant_ID = @Restaurant_ID
AND Meal.MealClassification_ID = @MealClassification_ID