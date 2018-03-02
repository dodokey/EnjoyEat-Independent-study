SELECT DISTINCT
	MC.MealClassification_ID,
	MealClassification_Name,
	MealClassification_EName
FROM
	Meal
INNER JOIN MealClassification AS MC ON MC.MealClassification_ID = Meal.MealClassification_ID
WHERE
	Restaurant_ID = @Restaurant_ID