SELECT
	RV.Reservation_ID,
	M.Member_ID,
	M.Member_Name,
	Restaurant_Name + Restaurant_BranchName AS Restaurant_Name,
	FORMAT (
		RV.Reservation_Date,
		'D',
		'zh-TW'
	) AS Reservation_Date,
	IIF (
		O.Member_ID = RV.Member_ID
		OR O.Member_ID IS NULL,
		'是',
		'否'
	) AS Is_Author,
	--是否為發起人
	CONVERT (
		CHAR (5),
		RestaurantOrderTime_Time,
		108
	) AS RestaurantOrderTime_Time,
	dbo.FN_CalculateMemberOrder (
		O.Reservation_ID,
		O.Member_ID
	) AS Total,
	IIF (
		O.Order_Check = 'Y',
		'已結帳',
		IIF (
			dbo.FN_CalculateMemberOrder (
				O.Reservation_ID,
				O.Member_ID
			) = 0,
			'未使用線上點餐服務',
			'未結帳'
		)
	) AS Order_Check
FROM
	Reservation AS RV
INNER JOIN Restaurant AS RR ON RR.Restaurant_ID = RV.Restaurant_ID
INNER JOIN Member AS M ON M.Member_ID = RV.Member_ID
LEFT JOIN [Order] AS O ON RV.Reservation_ID = O.Reservation_ID
WHERE
	O.Member_ID = @Member_ID