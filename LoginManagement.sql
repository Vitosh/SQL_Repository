SELECT name, LOGINPROPERTY([name], 'PasswordLastSetTime') AS 'PasswordChanged', is_disabled, is_policy_checked
FROM sys.sql_logins
order by is_policy_checked desc, PasswordChanged desc

SELECT N'ALTER LOGIN ' + QUOTENAME(name) 
  + N' WITH PASSWORD = N'''' MUST_CHANGE, CHECK_POLICY = ON;' 
  FROM sys.sql_logins
