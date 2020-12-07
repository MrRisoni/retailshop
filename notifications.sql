DECLARE @routeIter varchar(6)
DECLARE @statusIter varchar(2)

DECLARE @unID bigint
DECLARE @tkID bigint
DECLARE @unTid datetime /* tid Danish for time */
DECLARE @tkTid datetime

DECLARE routeCursor CURSOR FOR SELECT DISTINCT(route) FROM notification_history WHERE gdsPnr = 'PUSHKI' AND bookingId = 452875
OPEN routeCursor;

FETCH NEXT FROM routeCursor INTO @routeIter;  
WHILE @@FETCH_STATUS = 0  
BEGIN
	PRINT @routeIter
	SET @tkID = (SELECT TOP 1 id FROM notification_history WHERE route=@routeIter AND status = 'TK' ORDER BY gdsNotifiedAt DESC)
	SET @tkTid = (SELECT TOP 1 gdsNotifiedAt FROM notification_history WHERE route=@routeIter AND status = 'TK' ORDER BY gdsNotifiedAt DESC)

	SET @unID = (SELECT TOP 1 id FROM notification_history WHERE route=@routeIter AND status = 'UN' ORDER BY gdsNotifiedAt DESC)
	SET @unTid = (SELECT TOP 1 gdsNotifiedAt FROM notification_history WHERE route=@routeIter AND status = 'UN' ORDER BY gdsNotifiedAt DESC)
			
	IF DATEDIFF(day, @unTid,@tkTid) >=0 AND @tkID IS NOT NULL AND @unID IS NOT NULL
	BEGIN
		SELECT * FROM notification_history WHERE id = @tkID
	END
	FETCH NEXT FROM routeCursor INTO @routeIter; 
END;

CLOSE routeCursor;
DEALLOCATE routeCursor;
