DECLARE @routeIter varchar(6)

DECLARE routeCursor CURSOR FOR SELECT DISTINCT(route) FROM notification_history WHERE gdsPnr = 'PUSHKI'
OPEN routeCursor;


FETCH NEXT FROM routeCursor INTO @routeIter;  
WHILE @@FETCH_STATUS = 0  
BEGIN
	PRINT @routeIter;  
	FETCH NEXT FROM routeCursor INTO @routeIter; 
END;

CLOSE routeCursor;
DEALLOCATE routeCursor;
