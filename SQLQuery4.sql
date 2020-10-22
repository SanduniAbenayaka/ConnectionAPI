

ALTER PROC AllAction @id int, @option varchar(50)
AS
BEGIN
IF @option='Delete'
	BEGIN  
            DELETE FROM [dbo].[Employee]
            WHERE  [dbo].[Employee].ID = @id  
    END  

ELSE 
IF @option='SelectAll'
	BEGIN  
            SELECT  *
            FROM  [dbo].[Employee]
			WHERE [dbo].[Employee].ID !=@id
    END 

ELSE 
IF @option='SelectAllExceptId'
	BEGIN  
            SELECT  *
            FROM  [dbo].[Employee]
			WHERE [dbo].[Employee].ID !=@id
    END 

ELSE  
IF @option='SelectOne'
	BEGIN  
            SELECT *  
            FROM  [dbo].[Employee]
			WHERE [dbo].[Employee].ID =@id
     END

END

--exec AllAction 1 , SelectOne