SELECT
	Track.Restaurant_ID,
	Restaurant_Name,
	FORMAT (Track_Datetime, 'f', 'zh-TW') AS Track_Datetime
FROM
	Track
INNER JOIN Member ON Track.Member_ID = Member.Member_ID
INNER JOIN Restaurant ON Restaurant.Restaurant_ID = Track.Restaurant_ID
WHERE
	Track.Member_ID = @Member_ID