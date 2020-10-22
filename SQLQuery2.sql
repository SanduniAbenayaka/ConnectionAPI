

ALTER PROC AllAction @id int, @option varchar(50)
AS
BEGIN
IF @option='Delete'
	BEGIN  
            DELETE FROM [dbo].[Employee]
            WHERE  [dbo].[Employee].ID = @id  
        END  

ELSE IF @option='SeleteAll'
	BEGIN  
            SELECT *  
            FROM  [dbo].[Employee]
			WHERE [dbo].[Employee].ID !=@id
        END 

ELSE IF @option='SeleteOne'
	BEGIN  
            SELECT *  
            FROM  [dbo].[Employee]
			WHERE [dbo].[Employee].ID =@id
        END

END
