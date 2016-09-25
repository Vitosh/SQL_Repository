use VitoshAcademy
go

if OBJECT_ID('[dbo].[del_users]','TR') is not null
	drop trigger [dbo].[del_users]
go

create trigger [dbo].[del_users] on [dbo].[users]
	instead of delete
as

begin
	declare @Count int;
	set @Count = @@ROWCOUNT
	if @Count = 0 
		return;

	set nocount on;

	begin 
		raiserror
			(N' You cannot delete users like this...',10,1)

			if @@TRANCOUNT > 0
			begin
				rollback transaction
		end
	end
end
go
