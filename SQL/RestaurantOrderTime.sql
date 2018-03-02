SELECT
	CONVERT (
		CHAR (5),
		RestaurantOrderTime_Time,
		108
	)
FROM
	RestaurantOrderTime AS ROT
WHERE
	ROT.RestaurantOrderTime_Open = 1
AND ROT.Restaurant_ID = @Restaurant_ID