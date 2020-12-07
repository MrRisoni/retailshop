DECLARE @routeIter varchar(6)
DECLARE @statusIter varchar(2)

DECLARE @unID bigint
DECLARE @tkID bigint
DECLARE @unTid datetime /* tid Danish for time */
DECLARE @tkTid datetime
DECLARE @validId bigint

DECLARE routeCursor CURSOR FOR SELECT DISTINCT(route) FROM notification_history WHERE gdsPnr = 'PUSHKI' AND bookingId = 452875
OPEN routeCursor;


FETCH NEXT FROM routeCursor INTO @routeIter;  
WHILE @@FETCH_STATUS = 0  
BEGIN
	SELECT TOP 1 @tkTid = gdsNotifiedAt,@tkID = id FROM notification_history WHERE route=@routeIter AND status = 'TK' ORDER BY gdsNotifiedAt DESC
	SELECT TOP 1 @unTid = gdsNotifiedAt,@unID = id FROM notification_history WHERE route=@routeIter AND status = 'UN' ORDER BY gdsNotifiedAt DESC

	FETCH NEXT FROM routeCursor INTO @routeIter; 
END;

CLOSE routeCursor;
DEALLOCATE routeCursor;
