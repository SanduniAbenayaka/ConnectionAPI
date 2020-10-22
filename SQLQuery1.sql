--exec InsertNewEmployee [ ,{ "ID":6,"Name":"hi", "Address":"elpiiya", "Email":"hinmnnmuyhu"},"Y"]
--GO

--select * from [dbo].[Employee]
Alter PROC InsertNewEmployee @id int,@employee VARCHAR(max), @option varchar(50)
AS
BEGIN

IF @option='Insert'
 
	INSERT INTO [dbo].[Employee] 
	(
	 [Name],[Address],[Email]
	 ) 
		SELECT
        
			[Name],
			[Address],
			[Email]
		FROM OPENJSON(@employee)
		WITH (
				ID int,
				[Name] varchar(50),
				[Address] varchar(60),
				Email varchar(50)

		) 
		

	else
		Update [dbo].[Employee] 
		SET
		 [Name]=J.[Name],
		 [Address]=J.[Name],
		 [Email]=J.Email
		 
			FROM [dbo].[Employee] 
			JOIN OPENJSON(@employee)
			WITH (
					ID int,
					[Name] varchar(50),
					[Address] varchar(60),
					Email varchar(50)

			) J
			ON @id=[dbo].[Employee].ID
		

END
