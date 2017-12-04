ALTER LOGIN testUser
WITH PASSWORD = 'testUserPasswordComplicate';

ALTER LOGIN testUser
WITH PASSWORD = 'testUserPasswordComplicate' MUST_CHANGE, 
CHECK_EXPIRATION = ON;
