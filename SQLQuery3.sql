CREATE PROCEDURE InsertEmployee @employee VARCHAR(max)
AS
BEGIN
 
INSERT INTO [dbo].[Employee] (
 [Name],[Address],[Email]
 
    SELECT
        [ID],
		[Name],
		[Address],
		[Email]
    FROM OPENJSON(@json)
    WITH (
            ID int,
			Name varchar(50),
			Address varchar(60),
			Email varchar(50)

    ) 
END


EXECUTE InsertEmployee [ {
"Name":"sandu", "Address":"elpi", "Email":"hi"
}]
GO