SELECT
	SAM.SocialActivity_ID,
	SocialActivity_Title,
	FORMAT (
		SocialActivity_StartDatetime,
		'yyyy/MM/dd HH:mm'
	) AS SocialActivity_StartDatetime,
	FORMAT (
		SocialActivity_EndDatetime,
		'yyyy/MM/dd HH:mm'
	) AS SocialActivity_EndDatetime,
	Member_Name
FROM
	SocialActivityMember AS SAM
INNER JOIN SocialActivity AS SA ON SA.SocialActivity_ID = SAM.SocialActivity_ID
INNER JOIN Member AS M ON SA.Member_ID = M.Member_ID
WHERE
	SAM.Member_ID = @Member_ID