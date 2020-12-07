DECLARE @routeIter varchar(6)
DECLARE @statusIter varchar(2)

DECLARE @unId bigint
DECLARE @tkId bigint


DECLARE routeCursor CURSOR FOR SELECT DISTINCT(route) FROM notification_history WHERE gdsPnr = 'PUSHKI'
OPEN routeCursor;


FETCH NEXT FROM routeCursor INTO @routeIter;  
WHILE @@FETCH_STATUS = 0  
BEGIN
	SELECT TOP 1 @routeIter,gdsChangedAt,status FROM notification_history WHERE route=@routeIter AND status = 'TK' ORDER BY gdsChangedAt DESC
	SELECT TOP 1 @routeIter,gdsChangedAt,status FROM notification_history WHERE route=@routeIter AND status = 'UN' ORDER BY gdsChangedAt DESC

	FETCH NEXT FROM routeCursor INTO @routeIter; 
END;

CLOSE routeCursor;
DEALLOCATE routeCursor;
