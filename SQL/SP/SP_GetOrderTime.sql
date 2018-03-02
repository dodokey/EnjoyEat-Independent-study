SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		George Liu
-- Create date: 2015/11/15
-- Description:	取得可訂位時間
-- Parameter:
--			@intRestaurant_ID 訂位餐廳編號
--			@intReservation_Peoplenumber 訂位人數
--			@dateReservation_Date 訂位日期
-- =============================================
IF OBJECT_ID(N'dbo.SP_GetOrderTime', 'p') IS NOT NULL
DROP PROCEDURE dbo.SP_GetOrderTime
GO
CREATE PROCEDURE [dbo].[SP_GetOrderTime] 
	@intRestaurant_ID AS int,
	@intReservation_Peoplenumber AS int,
	@dateReservation_Date AS Date
AS
BEGIN
-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
SET NOCOUNT ON;

-- Insert statements for procedure here
SELECT
DISTINCT
	CONVERT(
	CHAR(5),
	RO.RestaurantOrderTime_Time,
	108
	) AS RestaurantOrderTime_Time
FROM RestaurantTable AS RT
INNER JOIN Restaurant AS R
	ON R.Restaurant_ID = RT.Restaurant_ID
	AND R.Restaurant_ID = @intRestaurant_ID
INNER JOIN RestaurantOrderTime AS RO
	ON RO.Restaurant_ID = R.Restaurant_ID
	AND RO.RestaurantOrderTime_Open = 1
LEFT JOIN Reservation AS RV
	ON RV.RestaurantOrderTime_Time = RO.RestaurantOrderTime_Time
	AND RV.Restaurant_ID = RT.Restaurant_ID
	AND RV.RestaurantTable_Name = RT.RestaurantTable_Name
	AND RV.Reservation_Date = @dateReservation_Date
WHERE RestaurantTable_People >= @intReservation_Peoplenumber
AND RV.Reservation_ID IS NULL;

END
GO