SELECT
	RestaurantPicture_Url
FROM
	Restaurant
LEFT JOIN RestaurantPicture AS RP ON Restaurant.Restaurant_ID = RP.Restaurant_ID
WHERE
	Restaurant.Restaurant_ID = @Restaurant_ID