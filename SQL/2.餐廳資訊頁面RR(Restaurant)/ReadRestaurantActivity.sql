SELECT
	RestaurantActivity_Title,
	RestaurantActivity_Content,
	RestaurantActivity_Other,
	RestaurantActivity_Picture,
	FORMAT (
		RestaurantActivity_Startdatetime,
		'd',
		'zh-TW'
	) AS RestaurantActivity_Startdatetime,
	FORMAT (
		RestaurantActivity_Enddatetime,
		'd',
		'zh-TW'
	) AS RestaurantActivity_Enddatetime,
	FORMAT (
		RestaurantActivity_Datetime,
		'f',
		'zh-TW'
	) AS RestaurantActivity_Datetime
FROM
	RestaurantActivity
WHERE
	RestaurantActivity.Company_ID = @Company_ID