SELECT
	Member_Name,
	Comment_Title,
	Comment_Content,
	Comment_Score,
	FORMAT (
		Comment_Datetime,
		'f',
		'zh-TW'
	) AS Comment_Datetime,
	(
		SELECT
			COUNT (0)
		FROM
			CommentLike
		WHERE
			CommentLike.Comment_ID = Comment.Comment_ID
	) AS CommentLikeCNT
FROM
	Comment
INNER JOIN Member ON Member.Member_ID = Comment.Member_ID
WHERE
	Comment.Restaurant_ID = @Restaurant_ID