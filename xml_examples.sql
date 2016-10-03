use VitoshAcademyCom
select * from Footballers
for xml raw, root('FootballInfo')

select * from Footballers
for xml raw, elements,root('FootballInfo')

select * from Footballers
for xml raw ('FootballPlayer'), elements,root('FootballInfo')

use VitoshAcademyCom
select * from Footballers
for xml raw

select * from Footballers
for xml auto

use VitoshAcademyCom
select f.firstname, f.lastname, f.Club, c.City, c.boss from  Footballers f
inner join CityInfo c on c.id = f.Cityid
for xml auto

use VitoshAcademyCom
select Footballers.firstname, Footballers.lastname, Footballers.Club, CityInfo.City, CityInfo.boss from  Footballers
inner join CityInfo on CityInfo.id = Footballers.Cityid
for xml auto, root('FootballInfo')

use VitoshAcademyCom
select Footballers.firstname, Footballers.lastname, Footballers.Club, CityInfo.City, CityInfo.boss from  Footballers
inner join CityInfo on CityInfo.id = Footballers.Cityid
for xml auto, root('FootballInfo')

use VitoshAcademyCom
select Footballers.firstname 'Names/FirstName', Footballers.lastname 'Names/LastName', Footballers.Club, CityInfo.City 'CityInfo/Name', CityInfo.boss 'CityInfo/Boss' from  Footballers
inner join CityInfo on CityInfo.id = Footballers.Cityid
for xml path('Information'), root('FootballInfo')
