SELECT
	Company_Shortname,
	Bonus_Total - IIF (
		BonusUseDetail_Total IS NULL,
		0,
		BonusUseDetail_Total
	) AS Bonus_Total
FROM
	(
		SELECT
			Company_ID,
			SUM (Bonus_Total) AS Bonus_Total
		FROM
			Bonus
		WHERE
			Member_ID = 2
		GROUP BY
			Company_ID
	) AS TEMPTABLE_A
INNER JOIN Company ON Company.Company_ID = TEMPTABLE_A.Company_ID
LEFT JOIN (
	SELECT
		Company_ID,
		SUM (BonusUseDetail_Total) AS BonusUseDetail_Total
	FROM
		BonusUseDetail
WHERE Member_ID = 2
	GROUP BY
		Company_ID
) TEMPTABLE_B ON TEMPTABLE_A.Company_ID = TEMPTABLE_B.Company_ID
ORDER BY
	TEMPTABLE_A.Company_ID