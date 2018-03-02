SELECT
	TEMPTABLE.*
FROM
	(
		SELECT DISTINCT
			Restaurant.Restaurant_ID,
			Restaurant.Region_ID,
			Region_Name,
			Restaurant_Name,
			Restaurant_Address,
			dbo.FN_Phone_Formate (
				Restaurant_Telephonearea,
				Restaurant_Telephone,
				''
			) AS Restaurant_Telephone,
			Restaurant_Costavg,
			Restaurant_Summary,
			dbo.FN_RestaurantClassification (Restaurant.Restaurant_ID) AS RestaurantClassification_Name
		FROM
			Restaurant
		INNER JOIN Region ON Restaurant.Region_ID = Region.Region_ID
		INNER JOIN RestaurantClassificationRecord AS RCR ON Restaurant.Restaurant_ID = RCR.Restaurant_ID
		LEFT JOIN RestaurantPicture AS RP ON Restaurant.Restaurant_ID = RP.Restaurant_ID
		AND RP.RestaurantPicture_No = 1
	) AS TEMPTABLE
WHERE
	TEMPTABLE.Region_ID = @Region_ID
AND TEMPTABLE.Restaurant_Costavg >= @CostavgMin
AND TEMPTABLE.Restaurant_Costavg <= @CostavgMax
AND TEMPTABLE.RestaurantClassification_Name LIKE '%@RestaurantClassification_Name%'
ORDER BY
	TEMPTABLE.Restaurant_ID,
	TEMPTABLE.Region_ID;

