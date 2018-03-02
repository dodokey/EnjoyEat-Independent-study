SELECT
	Restaurant_Name,
	Restaurant_BranchName,
	Restaurant_Addresszip + ' ' + Restaurant_Address AS Restaurant_Address,
	dbo.FN_Phone_Formate (
		Restaurant_Telephonearea,
		Restaurant_Telephone,
		''
	) AS Restaurant_Telephone,
	Restaurant_Officialwebsite,
	CONVERT (
		CHAR (5),
		Restaurant_Businehoursmorningbegin,
		108
	) + '~' + CONVERT (
		CHAR (5),
		Restaurant_Businehoursmorningend,
		108
	) AS Restaurant_Businehoursmorning,
	CONVERT (
		CHAR (5),
		Restaurant_Businehoursnoonbegin,
		108
	) + '~' + CONVERT (
		CHAR (5),
		Restaurant_Businehoursnoonend,
		108
	) AS Restaurant_Businehoursnoon,
	CONVERT (
		CHAR (5),
		Restaurant_Businehoursnoonbegin,
		108
	) + '~' + CONVERT (
		CHAR (5),
		Restaurant_Businehoursnightend,
		108
	) AS Restaurant_Businehoursnight,
	Restaurant_Capacity,
	IIF (
		Restaurant_Parking = 1,
		'有',
		'無'
	) AS Restaurant_Parking,
	IIF (
		Restaurant_Creditcard = 1,
		'提供',
		'不提供'
	) AS Restaurant_Creditcard,
	IIF (
		Restaurant_Accessible = 1,
		'有',
		'無'
	) AS Restaurant_Accessible,
	IIF (
		Restaurant_Wifi = 1,
		'有',
		'無'
	) AS Restaurant_Wifi,
	dbo.FN_Money_Formate (Restaurant_Costmax) AS Restaurant_Costmax,
	dbo.FN_Money_Formate (Restaurant_Costmin) AS Restaurant_Costmin,
	dbo.FN_Money_Formate (Restaurant_Costavg) AS Restaurant_Costavg,
	dbo.FN_Money_Formate (Restaurant_Mincharge) AS Restaurant_Mincharge,
	dbo.FN_RestaurantClassification (Restaurant.Restaurant_ID) AS RestaurantClassification_Name,
	Restaurant_Summary,
	Restaurant_Trafficinformation,
	(
		SELECT
			COUNT (0)
		FROM
			Track
		WHERE
			Track.Restaurant_ID = Restaurant.Restaurant_ID
	) AS TrackCNT
FROM
	Restaurant
WHERE
	Restaurant_ID = @Restaurant_ID