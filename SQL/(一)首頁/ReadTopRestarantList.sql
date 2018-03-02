SELECT
	TOP 8 R.Restaurant_ID,
	R.Restaurant_Name + ' ' + R.Restaurant_BranchName AS Restaurant_Name,
	RP.RestaurantPicture_Url,
	REPLACE(
		R.Restaurant_Summary,
		'<br/>',
		''
	) AS Restaurant_Summary
FROM
	Restaurant AS R
LEFT JOIN RestaurantPicture AS RP ON R.Restaurant_ID = RP.Restaurant_ID
AND RP.RestaurantPicture_No = 1
LEFT JOIN (
	SELECT
		COUNT (0) AS CNT,
		Restaurant_ID
	FROM
		Visitor
	GROUP BY
		Restaurant_ID
) AS TEMP ON TEMP.Restaurant_ID = R.Restaurant_ID
ORDER BY
	TEMP.CNT DESC