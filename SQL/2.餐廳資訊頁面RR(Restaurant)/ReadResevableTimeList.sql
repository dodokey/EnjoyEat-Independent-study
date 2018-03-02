--訂位畫面顯示可訂位之時間

SELECT
	CONVERT (
		CHAR (5),
		RO.RestaurantOrderTime_Time,
		108
	) AS RestaurantOrderTime_Time,
	COUNT (0) AS TABLECNT
FROM
	RestaurantTable AS RT
INNER JOIN Restaurant AS R ON R.Restaurant_ID = RT.Restaurant_ID
AND R.Restaurant_ID = @Restaurant_ID
INNER JOIN RestaurantOrderTime AS RO ON RO.Restaurant_ID = R.Restaurant_ID
LEFT JOIN Reservation AS RV ON RV.RestaurantOrderTime_Time = RO.RestaurantOrderTime_Time
AND RV.Restaurant_ID = RT.Restaurant_ID
AND RV.RestaurantTable_Name = RT.RestaurantTable_Name
AND RV.Reservation_Date = @Reservation_Date
WHERE
	RestaurantTable_People >= @RestaurantTable_People 
AND RV.Restaurant_ID IS NULL
AND RO.RestaurantOrderTime_Open = 1
GROUP BY
	CONVERT (
		CHAR (5),
		RO.RestaurantOrderTime_Time,
		108
	)