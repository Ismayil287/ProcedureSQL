USE [RegistrationDB]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER procedure [dbo].[RegWeb1]
@case int out , @Username varchar(50),@Email varchar(50), 
@Password varchar(50)
as
if exists(select * from Table2 where Username = @Username)
begin
--___We check registration success with usernames if both of them are the same case return 1 __--
set @case = 1
return @case 
end
else
begin
---If there is no username same as with inputted username---- 
---then case will return 0 and insert data to the table---
insert into Table2(Username, Email, Password) values(@Username,@Email,@Password)
set @case=0
return @case
end
