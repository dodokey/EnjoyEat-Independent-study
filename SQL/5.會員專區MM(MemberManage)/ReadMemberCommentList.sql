SELECT
	Comment_ID,
	Restaurant_Name,
	Comment_Title,
	Comment_Content,
	Comment_Score,
	FORMAT (
		Comment_Datetime,
		'f',
		'zh-TW'
	) AS Comment_Datetime
FROM
	Comment
INNER JOIN Restaurant ON Restaurant.Restaurant_ID = Comment.Restaurant_ID
WHERE
	Comment.Member_ID = @Member_ID