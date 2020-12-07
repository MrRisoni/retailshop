DECLARE @routeIter varchar(6)
DECLARE @statusIter varchar(2)

DECLARE @unTid bigint /* tid danish for time */
DECLARE @tkTid bigint
DECLARE @unTableId bigint
DECLARE @tkTableId bigint

DECLARE routeCursor CURSOR FOR SELECT DISTINCT(route) FROM notification_history WHERE gdsPnr = 'PUSHKI'
OPEN routeCursor;


FETCH NEXT FROM routeCursor INTO @routeIter;  
WHILE @@FETCH_STATUS = 0  
BEGIN
	SELECT TOP 1 @tkTid=gdsChangedAt ,@tkTableId = id FROM notification_history WHERE route=@routeIter AND status = 'TK' ORDER BY gdsChangedAt DESC
	SELECT TOP 1 @unTid=gdsChangedAt ,@unTableId = id FROM notification_history WHERE route=@routeIter AND status = 'UN' ORDER BY gdsChangedAt DESC

	FETCH NEXT FROM routeCursor INTO @routeIter; 
END;

CLOSE routeCursor;
DEALLOCATE routeCursor;
