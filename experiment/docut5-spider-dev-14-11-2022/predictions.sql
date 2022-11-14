select count(*) from singer
select count(*) from singer
concert
select name, country, age from singer order by age desc
select avg(age), min(age), max(age) from singer where country = 'France'
select avg(age), min(age), max(age) from singer where country = "France"
select song_name, song_release_year from singer order by age asc limit 1
select song_name, song_release_year from singer order by age asc limit 1
select distinct country from singer where age > 20
select distinct country from singer where age > 20
select country, count(*) from singer group by country
select country, count(*) from singer group by country
select song_name from singer where age > (select avg(age) from singer)
select song_name from singer where age > (select avg(age) from singer)
select location, name from stadium where capacity between 5000 and 10000
select location, name from stadium where capacity between 5000 and 10000
select max(capacity), avg(average) from stadium
select avg(capacity), max(capacity) from stadium
select name, capacity from stadium order by average desc limit 1
select name, capacity from stadium order by average desc limit 1
select count(*) from concert where year = 2014 or year = 2015
select count(*) from concert where year = 2014 or year = 2015
select t2.name, count(*) from concert as t1 join stadium as t2 on t1.stadium_id = t2.stadium_id group by t1.stadium_id
select count(*), t1.name from stadium as t1 join concert as t2 on t1.stadium_id = t2.stadium_id group by t1.stadium_id
select t1.name, t1.capacity from stadium as t1 join concert as t2 on t1.stadium_id = t2.stadium_id where t2.year >= 2014 group by t1.stadium_id order by count(*) desc limit 1
select t1.name, t1.capacity from stadium as t1 join concert as t2 on t1.stadium_id = t2.stadium_id where t2.year > 2013 group by t1.stadium_id order by count(*) desc limit 1
select year from concert group by year order by count(*) desc limit 1
select year from concert group by year order by count(*) desc limit 1
select name from stadium where stadium_id not in (select stadium_id from concert)
select name from stadium where stadium_id not in (select stadium_id from concert)
select country from singer where age > 40 intersect select country from singer where age < 30
select name from stadium except select t1.name from stadium as t1 join concert as t2 on t1.stadium_id = t2.stadium_id where t2.year = 2014
select name from stadium where stadium_id not in (select stadium_id from concert where year = 2014)
select concert_name, theme, count(*) from concert group by theme
select concert_name, theme, count(*) from concert group by theme
select t3.name, count(*) from singer_in_concert as t1 join concert as t2 on t1.singer_id = t3.singer_id join singer as t3 on t1.singer_id = t3.singer_id group by t1.singer_id
select t2.name, count(*) from singer_in_concert as t1 join singer as t2 on t1.singer_id = t2.singer_id group by t1.singer_id
select t3.name from concert as t1 join singer_in_concert as t2 on t1.concert_id = t2.concert_id join singer as t3 on t2.singer_id = t3.singer_id where t1.year = 2014
select t3.name from concert as t1 join singer_in_concert as t2 on t1.concert_id = t2.concert_id join singer as t3 on t2.singer_id = t3.singer_id where t1.year = 2014
select name, country from singer where song_name like "%hey%"
select name, country from singer where song_name like '%hey%'
select t1.name, t1.location from stadium as t1 join concert as t2 on t1.stadium_id = t2.stadium_id where t2.year = 2014 intersect select t1.name, t1.location from stadium as t1 join concert as t2 on t1.stadium_id = t2.stadium_id where t2.year = 2015
select t1.name, t1.location from stadium as t1 join concert as t2 on t1.stadium_id = t2.stadium_id where t2.year = 2014 intersect select t1.name, t1.location from stadium as t1 join concert as t2 on t1.stadium_id = t2.stadium_id where t2.year = 2015
select count(*) from concert as t1 join stadium as t2 on t1.stadium_id = t2.stadium_id where t2.capacity = (select max(capacity) from stadium)
select count(*) from concert as t1 join stadium as t2 on t1.stadium_id = t2.stadium_id where t2.capacity = (select max(capacity) from stadium)
select count(*) from pets where weight > 10
select count(*) from pets where weight > 10
select pet_age from pets where pettype = "dog" order by pet_age asc limit 1
select min(weight) from pets where pettype = "dog"
select max(weight), pettype from pets group by pettype
select max(weight), pettype from pets group by pettype
select count(distinct pet_age) from pets as t1 join has_pet as t2 on t1.petid = t2.petid join student as t3 on t2.stuid = t3.stuid where t3.age > 20
select count(*) from pets as t1 join has_pet as t2 on t1.petid = t2.petid join student as t3 on t3.stuid = t2.stuid where t3.age > 20
select count(*) from pets as t1 join has_pet as t2 on t1.petid = t2.petid join student as t3 on t3.stuid = t2.stuid where t3.sex = "F"
select count(*) from pets as t1 join has_pet as t2 on t1.petid = t2.petid join student as t3 on t3.stuid = t2.stuid where t3.sex = "F"
select count(distinct pettype) from pets
select count(distinct pettype) from pets
select distinct t1.fname from student as t1 join has_pet as t2 on t1.stuid = t2.stuid where t2.petid = 'cat' or t2.pettyp
select t1.fname from student as t1 join has_pet as t2 on t1.stuid = t2.stuid where pettype = "cat"
select t1.fname from student as t1 join has_pet as t2 on t1.stuid = t2.stuid where t2.pettyp
select t1.fname from student as t1 join has_pet as t2 on t1.stuid = t2.stuid join pets as t3 on t2.petid = t3.petid where t3.pettype = "cat" intersect select t1.fname from student as t1 join has_pet as t2 on t1.stuid = t2.stuid join pets as t3 on t2.petid = t3.petid where t3.pettype = "dog"
select major, age from student where stuid not in (select stuid from has_pet)
select major, age from student where stuid not in (select stuid from has_pet)
select stuid from student except select stuid from has_pet where pettype = 'cat' 
select stuid from has_pet except select petid from pets where pettype = "cat"
select distinct t1.fname, t1.age from student as t1 join has_pet as t2 on t1.stuid = t2.stuid where
select t1.fname from student as t1 join has_pet as t2 on t1.stuid = t2.stuid where pettype = "dog"
select pettype, weight from pets order by pet_age asc limit 1
select pettype, weight from pets order by pet_age asc limit 1
select petid, weight from pets where pet_age > 1
select petid, weight from pets where pet_age > 1
select pettype, avg(pet_age), max(pet_age) from pets group by pettype
select pettype, avg(pet_age), max(pet_age) from pets group by pettype
select pettype, avg(weight) from pets group by pettype
select pettype, avg(weight) from pets group by pettype
select distinct t1.fname, t1.age from student as t1 join has_pet as t2 on t1.stuid = t2.stuid
select distinct t1.fname, t1.age from student as t1 join has_pet as t2 on t1.stuid = t2.stuid
select t2.petid from has_pet as t1 join pets as t2 on t1.petid = t2.petid join student as t3 on t1.stuid = t3.stuid where t3.lname = "Smith"
select t2.petid from has_pet as t1 join pets as t2 on t1.petid = t2.petid join student as t3 on t1.stuid = t3.stuid where t3.lname = "Smith"
select count(*), stuid from has_pet group by stuid
select stuid, count(*) from has_pet group by stuid
select fname, sex from student group by sex having count(*) > 1
select t1.fname, t1.sex from student as t1 join has_pet as t2 on t1.stuid = t2.stuid group by t1.stuid having count(*) > 1
select t1.lname from student as t1 join has_pet as t2 on t1.stuid = t2.stuid where
select lname from student where stuid in (select stuid from has_pet where pettype = 'cat' and age = 3
select avg(age) from student where stuid not in (select stuid from has_pet)
select avg(age) from student where stuid not in (select petid from has_pet)
select count(*) from continents
select count(*) from continents
select continent, count(*) from continents group by continent
select continent, countryname, count(*) from countries group by continent
select count(*) from countries
select count(*) from countries
select t1.maker, t1.fullname, t1.id, count(*) from car_makers as t1 join model_list as t2 on t1.id = t2.maker group by t1.id
select t1.fullname, t1.id, count(*) from car_makers as t1 join model_list as t2 on t1.id = t2.modelid group by t1.id
select t1.model from model_list as t1 join cars_data as t2 on t1.model = t2.id group by t1.model order by min(horsepower) limit 1
select t2.model from cars_data as t1 join model_list as t2 on t1.id = t2.modelid group by t1.id order by sum(t1.horsepower) limit 1
select t2.model from cars_data as t1 join model_list as t2 on t1.id = t2.modelid where t1.weight < (select avg(weight) from cars_data)
select t2.model from cars_data as t1 join model_list as t2 on t1.id = t2.modelid where t1.weight < (select avg(weight) from cars_data)
select t2.maker from cars_data as t1 join car_makers as t2 on t1.id = t2.maker where t1.year = 1970
select distinct t1.maker from car_makers as t1 join model_list as t2 on t1.id = t2.modelid join car_names as t3 on t2.model
select max(year), make from car_names
select t2.maker, t1.year from cars_data as t1 join car_makers as t2 on t1.id = t2.maker order by t1.year asc limit 1
select distinct model from car_names where make > 1980
select distinct t2.model from cars_data as t1 join model_list as t2 on t1.id = t2.modelid where t1.year > 1980
select t1.continent, count(*) from continents as t1 join car_makers as t2 on t1.contid = t2.maker group by t1.continent
select t1.continent, count(*) from continents as t1 join car_makers as t2 on t1.contid = t2.id group by t1.continent
select t1.countryname from countries as t1 join car_makers as t2 on t1.countryid = t2.country group by t1.countryname order by count(*) desc limit 1
select t1.countryname from countries as t1 join car_makers as t2 on t1.countryid = t2.country group by t1.countryname order by count(*) desc limit 1
select count(*), t1.fullname from car_makers as t1 join model_list as t2 on t1.id = t2.maker group by t1.maker
select count(*), t1.maker, t1.fullname from car_makers as t1 join model_list as t2 on t1.id = t2.maker group by t1.maker
select t2.accelerate from car_names as t1 join cars_data as t2 on t1.makeid = t2.id where t1.make = "amc hornet sportabout" and t1.model = "sw"
select sum(t1.accelerate) from cars_data as t1 join car_names as t2 on t1.id = t2.makeid where t2.make = "amc hornet sportabout" and t2.model = "sw"
select count(*) from countries where countryname = "france"
select count(*) from countries as t1 join car_makers as t2 on t1.countryid = t2.country where t1.countryname = "france"
select count(*) from countries where countryname = "usa"
select count(*) from car_makers where country = 'USA'
select avg(mpg) from cars_data where cylinders = 4
select avg(mpg) from cars_data where cylinders = 4
select min(weight) from cars_data where cylinders = 8 and year = 1974
select min(weight) from cars_data where cylinders = 8 and year = 1974
select maker, model from model_list
select t1.maker, t2.model from car_makers as t1 join model_list as t2 on t1.id = t2.modelid
select t1.countryname, t1.countryid from countries as t1 join car_makers as t2 on t1.countryid = t2.id group by t1.countryid having count(*) >= 1
select t1.countryname, t1.countryid from countries as t1 join car_makers as t2 on t1.countryid = t2.id group by t1.countryid having count(*) >= 1
select count(*) from cars_data where horsepower > 150
select count(*) from cars_data where horsepower > 150
select avg(weight), year from cars_data group by year
select avg(weight), avg(year), year from cars_data group by year
select t1.countryname from countries as t1 join car_makers as t2 on t1.countryid = t2.country where t1.continent = "europe" group by t1.countryname having count(*) >= 3
select t1.countryname from countries as t1 join car_makers as t2 on t1.countryid = t2.country where t1.continent = "europe" group by t1.countryname having count(*) >= 3
select max(t1.horsepower), t2.make from cars_data as t1 join car_names as t2 on t1.id = t2.model where t1.cylinders = 3
select max(t1.horsepower), t2.make from cars_data as t1 join car_names as t2 on t1.id = t2.makeid where t1.cylinders = 3
select t2.model from cars_data as t1 join model_list as t2 on t1.id = t2.modelid group by t2.model order by t1.mpg desc limit 1
select t2.model from cars_data as t1 join model_list as t2 on t1.id = t2.modelid order by t1.mpg desc limit 1
select avg(horsepower) from cars_data where year < 1980
select avg(horsepower) from cars_data where year < 1980
select avg(t1.edispl) from cars_data as t1 join car_names as t2 on t1.id = t2.makeid where t2.model = "volvo"
select avg(t1.edispl) from cars_data as t1 join car_names as t2 on t1.id = t2.makeid where t2.model = "volvo"
select max(accelerate), cylinders from cars_data group by cylinders
select max(accelerate), cylinders from cars_data group by cylinders
select model from car_names group by model order by count(*) desc limit 1
select model from model_list group by model order by count(*) desc limit 1
select count(*) from cars_data where cylinders > 4
select count(*) from cars_data where cylinders > 4
select count(*) from cars_data where year = 1980
select count(*) from car_names as t1 join cars_data as t2 on t1.make = t2.id where t2.year = 1980
select count(*) from car_makers where maker = 'American Motor Company'
select count(*) from car_makers where maker = 'American Motor Company'
select t1.maker, t1.fullname, t1.id from car_makers as t1 join model_list as t2 on t1.id = t2.maker group by t1.id having count(*) > 3
select t1.maker, t1.id from car_makers as t1 join model_list as t2 on t1.id = t2.maker group by t1.id having count(*) > 3
select distinct t2.model from car_makers as t1 join model_list as t2 on t1.id = t2.modelid where t1.fullname = "General Motors" or t2.weight
select distinct t2.model from car_makers as t1 join model_list as t2 on t1.id = t2.modelid where t1.fullname = "General Motors" or t1.weight
select year from cars_data where weight < 3000 intersect select year from cars_data where weight < 4000
select distinct year from cars_data where weight < 4000 intersect select distinct year from cars_data where weight > 3000
select horsepower from cars_data order by accelerate desc limit 1
select horsepower from cars_data order by accelerate desc limit 1
select t2.cylinders from model_list as t1 join cars_data as t2 on t1.modelid = t2.id join car_makers as t3 on t1.modelid = t3.id where t1.model = "volvo" order by t2.ac
select count(*), t1.cylinders from cars_data as t1 join model_list as t2 on t1.id = t2.modelid where t2.model = "volvo" order by t1.accelerate limit 1
select count(*) from cars_data where accelerate > (select max(horsepower) from cars_data)
select count(*) from cars_data where accelerate > (select max(horsepower) from cars_data)
select count(*), country from car_makers group by country having count(*) > 2
select count(*), country from car_makers group by country having count(*) > 2
select count(*) from cars_data where cylinders > 6
select count(*) from cars_data where cylinders > 6
select t2.model from cars_data as t1 join model_list as t2 on t1.id = t2.modelid where t1.cylinders = 4 order by horsepower desc limit 1
select t2.model from cars_data as t1 join model_list as t2 on t1.id = t2.modelid where t1.cylinders = 4 group by t2.model order by sum(t1.horsepower) desc limit 1
select t1.make, t1.make from car_names as t1 join cars_data as t2 on t1.makeid = t2.id where t2.horsepower > (select min(horsepower) from cars_data)
select t1.make, t2.make from car_names as t1 join cars_data as t3 on t1.makeid = t3.id
select max(t1.mpg) from cars_data as t1 join car_names as t2 on t1.id = t2.makeid where t1.cylinders = 8 or t1.year < 1980
select max(t1.mpg) from cars_data as t1 join car_names as t2 on t1.id = t2.makeid where t1.cylinders = 8 union select max(t1.mpg) from cars_data as t1 join cars_data as t2 on t1.id = t2.id where t1.year < 1980
select t2.model from car_names as t1 join model_list as t2 on t1.model = t2.modelid join car_makers as t3 on
select distinct model from car_names where weight < 3500 and maker!= 'Ford Motor Company' 
select countryname from countries except select t1.countryname from countries as t1 join car_makers as t2 on t1.countryid = t2.country
select countryname from countries where countryid not in (select country from car_makers)
select t1.id, t1.maker from car_makers as t1 join model_list as t2 on t1.id = t2.maker group by t1.id having count(*) >= 2 intersect select t1.id, t1.maker from car_makers as t1 join model_list as t2 on t1.id = t2.maker group by t1.id having count(*) >= 3
select t1.id, t1.maker from car_makers as t1 join model_list as t2 on t1.id = t2.modelid group by t1.id having count(*) >= 2 intersect select t1.id, t1.maker from car_makers as t1 join model_list as t2 on t1.id = t2.maker group by t1.id having count(*) >= 3
select t1.countryname from countries as t1 join car_makers as t2 on t1.countryid = t2.id where t2.maker = 'fiat' group by t1.countryname having count(*) > 3
select t1.countryid, t1.countryname from countries as t1 join car_makers as t2 on t1.countryid = t2.id where t2.maker = 'fiat' group by t1.countryid having count(*) > 3 union select t1.countryname, t1.countryname from countries as t1 join model_list as t2 on t1.countryid = t2.countryid
select country from airlines where abbreviation = "JetBlue Airways"
select country from airlines where abbreviation = "JetBlue Airways"
select abbreviation from airlines where airline = "JetBlue Airways"
select abbreviation from airlines where airline = "JetBlue Airways"
select airline, abbreviation from airlines where country = 'USA'
select airline, abbreviation from airlines where country = 'USA'
select airportcode, airportname from airports where city = "Anthony"
select airportcode, airportname from airports where city = "Anthony"
select count(*) from airlines
select count(*) from airlines
select count(*) from airports
select count(*) from airports
select count(*) from flights
select count(*) from flights
select airline from airlines where abbreviation = 'UAL'
select airline from airlines where abbreviation = 'UAL'
select count(*) from airlines where country = 'USA'
select count(*) from airlines where country = 'USA'
select city, country from airports where airportname = "Alton"
select city, country from airports where airportname = "Alton"
select airportname from airports where airportcode = 'AKO'
select airportname from airports where airportcode = 'AKO'
select airportname from airports where city = 'Aberdeen'
select airportname from airports where city = 'Aberdeen'
select count(*) from flights where sourceairport = 'APG'
select count(*) from flights where sourceairport = 'APG'
select count(*) from airports as t1 join flights as t2 on t1.airportcode = t2.sourceairport where t1.airportcode = "ATO"
select count(*) from airports where airportcode = "ATO"
select count(*) from airports as t1 join flights as t2 on t1.airportcode = t2.sourceairport where t1.city = "Aberdeen"
select count(*) from airports as t1 join flights as t2 on t1.airportcode = t2.sourceairport where t1.city = 'Aberdeen'
select count(*) from airports as t1 join flights as t2 on t1.airportcode = t2.sourceairport where t1.city = "Aberdeen"
select count(*) from airports as t1 join flights as t2 on t1.airportcode = t2.sourceairport where t1.city = "Aberdeen"
select count(*) from airports as t1 join flights as t2 on t1.airportcode = t2.sourceairport where t1.city = 'Aberdeen' and t1.airportname = 'Ashley'
select count(*) from airports as t1 join flights as t2 on t1.city = 'Aberdeen' and t1.airportcode = t2.sourceairport where t1.airportname = 'Ashley'
select count(*) from airlines as t1 join flights as t2 on t1.uid = t2.airline where t1.abbreviation = 'JetBlue Airways'
select count(*) from airlines as t1 join flights as t2 on t1.uid = t2.flightno where t1.abbreviation = "JetBlue Airways"
select count(*) from flights as t1 join airports as t2 on t1.sourceairport = t2.sourceairport
select count(*) from airlines as t1 join airports as t2 on t1.uid = t2.airportcode where t2.airportcode = "ASY" and t1.airline = "United Airlines"
select count(*) from flights where sourceairport = 'AHD' and airline = 'United Airlines'
select count(*) from flights where sourceairport = 'AHD' and airline = 'United Airlines'
select count(distinct uid) from airlines as t1 join flights as t2 on t1.uid = t2.airline join airports as t3 on t3.airportcode = t2.sourceairport where t3.city = 'Aberdeen'
select count(distinct uid) from airlines as t1 join flights as t2 on t1.uid = t2.flightno where t1.country = "Aberdeen" and t1.airline = "United Airlines"
select t1.city from airports as t1 join flights as t2 on t1.airportcode = t2.sourceairport group by t1.city order by count(*) desc limit 1
select t1.city from airports as t1 join flights as t2 on t1.airportcode = t2.sourceairport group by t1.city order by count(*) desc limit 1
select t1.city from airports as t1 join flights as t2 on t1.airportcode = t2.sourceairport group by t1.city order by count(*) desc limit 1
select city from airports group by city order by count(*) desc limit 1
select t1.airportcode from airports as t1 join flights as t2 on t1.airportcode = t2.sourceairport group by t1.airportcode order by count(*) desc limit 1
select t1.airportcode from airports as t1 join flights as t2 on t1.airportcode = t2.sourceairport group by t2.sourceairport order by count(*) desc limit 1
select t1.airportcode from airports as t1 join flights as t2 on t1.airportcode = t2.sourceairport group by t1.airportcode order by count(*) limit 1
select t1.airportcode from airports as t1 join flights as t2 on t1.airportcode = t2.sourceairport group by t1.airportcode order by count(*) asc limit 1
select t1.airline from airlines as t1 join flights as t2 on t1.uid = t2.airline group by t1.airline order by count(*) desc limit 1
select t1.airline from airlines as t1 join flights as t2 on t1.uid = t2.airline group by t1.airline order by count(*) desc limit 1
select t1.abbreviation, t1.country from airlines as t1 join flights as t2 on t1.uid = t2.airline group by t2.airline order by count(*) limit 1
select t2.abbreviation, t1.country from airports as t1 join flights on t1.countryabbrev = t2.airport
select t1.uid from airlines as t1 join flights as t2 on t1.uid = t2.airline where t2.sourceairport = 'AHD'
select t1.airline from airlines as t1 join flights as t2 on t1.uid = t2.airline where t2.sourceairport = "AHD"
select distinct t1.uid from airlines as t1 join flights as t2 on t1.uid = t2.airline where t2.sourceairport = 'AHD'
select t1.airline from airlines as t1 join flights as t2 on t1.uid = t2.airline where t2.sourceairport = "AHD"
select t1.airline from airlines as t1 join flights as t2 on t1.uid = t2.airline where t2.sourceairport = 'APG' intersect select t1.airline from airlines as t1 join flights as t2 on t1.uid = t2.airline where t2.sourceairport = 'CVO'
select t1.airline from airlines as t1 join flights as t2 on t1.uid = t2.airline where t2.sourceairport = 'APG' intersect select t1.airline from airlines as t1 join flights as t2 on t1.uid = t2.airline where t2.sourceairport = 'CVO'
select t2.airline from airports as t1 join flights as t2 on t1.airportcode = t2.sourceairport where t1.airportcode = 'CVO' except select t2.airline from airports as t1 join flights as t2 on t1.airportcode = t2.sourceairport where t1.airportcode = 'APG'
select t1.uid from airlines as t1 join flights as t2 on t1.uid = t2.airline where t2.sourceairport = 'CVO' except select t1.uid from airlines as t1 join airports as t2 on t1.uid = t2.airportcode where t2.airportcode = 'APG'
select t1.airline from airlines as t1 join flights as t2 on t1.uid = t2.airline group by t2.airline having count(*) >= 10
select t1.airline from airlines as t1 join flights as t2 on t1.uid = t2.airline group by t1.uid having count(*) >= 10
select airline from flights group by airline having count(*) < 200
select airline from flights group by airline having count(*) < 200
select t1.flightno from flights as t1 join airlines as t2 on t1.airline = t2.uid where t2.airline = "United Airlines"
select t1.flightno from flights as t1 join airlines as t2 on t1.airline = t2.uid where t2.airline = "United Airlines"
select flightno from flights where sourceairport = "APG"
select flightno from flights where sourceairport = 'APG'
select distinct flightno from flights where sourceairport = "APG"
select flightno from flights where sourceairport = 'APG'
select distinct t2.flightno from airports as t1 join flights as t2 on t1.airportcode = t2.sourceairport where t1.city = "Aberdeen"
select flightno from flights where sourceairport = 'Aberdeen'
select distinct t2.flightno from airports as t1 join flights as t2 on t1.airportcode = t2.sourceairport where t1.city = "Aberdeen"
select distinct t1.flightno from flights as t1 join airports as t2 on t1.sourceairport = t2.airport
select count(*) from airports as t1 join flights as t2 on t1.airportcode = t2.sourceairport where t1.city = "Aberdeen" or t1.city = "Abilene"
select count(*) from airports as t1 join flights as t2 on t1.airportcode = t2.sourceairport where t1.city = "Aberdeen" or t1.country = "Abilene"
select airportname from airports where airportcode not in (select sourceairport from flights)
select airportname from airports except select t1.airportname from airports as t1 join flights as t2 on t1.airportcode = t2.sourceairport
select count(*) from employee
select count(*) from employee
select name from employee order by age asc
select name from employee order by age asc
select city, count(*) from employee group by city
select count(*), city from employee group by city
select city from employee where age < 30 group by city having count(*) > 1
select city from employee where age < 30 group by city having count(*) > 1
select location, count(*) from shop group by location
select location, count(*) from shop group by location
select t3.manager_name, t3.district from shop as t1 join employee as t2 on t1.shop_id = t2.employee_id join shop as t3 on t1.shop_id = t3.shop_id order by t3.number_products desc limit 1
select t3.manager_name, t3.district from shop as t1 join employee as t2 on t1.shop_id = t2.employee_id join shop as t3 on t1.shop_id = t3.shop_id order by t3.number_products desc limit 1
select min(number_products), max(number_products) from shop
select min(number_products), max(number_products) from shop
select name, location, district from shop order by number_products desc
select name, location, district from shop order by number_products desc
select name from shop where number_products > (select avg(number_products) from shop)
select name from shop where number_products > (select avg(number_products) from shop)
select t1.name from employee as t1 join evaluation as t2 on t1.employee_id = t2.employee_id group by t2.employee_id order by count(*) desc limit 1
select t1.name from employee as t1 join evaluation as t2 on t1.employee_id = t2.employee_id group by t1.employee_id order by count(*) desc limit 1
select t1.name from employee as t1 join evaluation as t2 on t1.employee_id = t2.employee_id order by t2.bonus desc limit 1
select t1.name from employee as t1 join evaluation as t2 on t1.employee_id = t2.employee_id order by t2.bonus desc limit 1
select name from employee except select t1.name from employee as t1 join evaluation as t2 on t1.employee_id = t2.employee_id
select name from employee where employee_id not in (select employee_id from evaluation)
select t2.name from hiring as t1 join shop as t2 on t1.shop_id = t2.shop_id group by t1.shop_id order by count(*) desc limit 1
select t2.name from hiring as t1 join shop as t2 on t1.shop_id = t2.shop_id group by t1.shop_id order by count(*) desc limit 1
select name from shop where shop_id not in (select shop_id from hiring)
select name from shop where shop_id not in (select shop_id from hiring)
select t2.name, count(*) from hiring as t1 join shop as t2 on t1.shop_id = t2.shop_id group by t1.shop_id
select t2.name, count(*) from hiring as t1 join shop as t2 on t1.shop_id = t2.shop_id group by t1.shop_id
select sum(bonus) from evaluation
select sum(bonus) from evaluation
select * from hiring
select * from hiring
select district from shop where number_products < 3000 intersect select district from shop where number_products > 10000
select district from shop where number_products < 3000 intersect select district from shop where number_products > 10000
select count(distinct location) from shop
select count(distinct location) from shop
select count(*) from documents
select count(*) from documents
select document_id, document_name, document_description from documents
select document_id, document_name, document_description from documents
select document_name, template_id from documents where document_description like "%w%"
select document_name, template_id from documents where document_description like "%w%"
select document_id, template_id, document_description from documents where document_name = "Robbin CV"
select document_id, template_id, document_description from documents where document_name = "Robbin CV"
select count(distinct template_id) from documents
select count(distinct template_id) from documents
select count(*) from documents as t1 join templates as t2 on t1.template_id = t2.template_id where t2.template_type_code = 'PPT'
select count(*) from documents as t1 join templates as t2 on t1.template_id = t2.template_id where t2.template_type_code = "PPT"
select template_id, count(*) from documents group by template_id
select template_id, count(*) from documents group by template_id
select t1.template_id, t1.template_type_code from templates as t1 join documents as t2 on t1.template_id = t2.template_id group by t1.template_id order by count(*) desc limit 1
select t1.template_id, t1.template_type_code from templates as t1 join documents as t2 on t1.template_id = t2.template_id group by t1.template_id order by count(*) desc limit 1
select t1.template_id from templates as t1 join documents as t2 on t1.template_id = t2.template_id group by t1.template_id having count(*) > 1
select t1.template_id from templates as t1 join documents as t2 on t1.template_id = t2.template_id group by t1.template_id having count(*) > 1
select template_id from templates except select template_id from documents
select template_id from templates except select template_id from documents
select count(*) from templates
select count(*) from templates
select template_id, version_number, template_type_code from templates
select template_id, version_number, template_type_code from templates
select distinct template_type_code from templates
select distinct template_type_code from templates
select template_id from templates where template_type_code = "PP" or template_type_code = "PPT"
select template_id from templates where template_type_code = "PP" or template_type_code = "PPT"
select count(*) from templates where template_type_code = "CV"
select count(*) from templates where template_type_code = "CV"
select version_number, template_type_code from templates where version_number > 5
select version_number, template_type_code from templates where version_number > 5
select template_type_code, count(*) from templates group by template_type_code
select template_type_code, count(*) from templates group by template_type_code
select template_type_code from templates group by template_type_code order by count(*) desc limit 1
select template_type_code from templates group by template_type_code order by count(*) desc limit 1
select template_type_code from templates group by template_type_code having count(*) < 3
select template_type_code from templates group by template_type_code having count(*) < 3
select version_number, template_type_code from templates order by version_number asc limit 1
select min(version_number), template_type_code from templates
select t1.template_type_code from templates as t1 join documents as t2 on t1.template_id = t2.template_id where t2.document_name = "Data base"
select t1.template_type_code from templates as t1 join documents as t2 on t1.template_id = t2.template_id where t2.document_name = "Data base"
select document_name from documents as t1 join templates as t2 on t1.template_id = t2.template_id where t2.template_type_code = "BK"
select t1.document_name from documents as t1 join templates as t2 on t1.template_id = t2.template_id where t2.template_type_code = "BK"
select t1.template_type_code, count(*) from templates as t1 join documents as t2 on t1.template_id = t2.template_id group by t1.template_type_code
select t1.template_type_code, count(*) from templates as t1 join documents as t2 on t1.template_id = t2.template_id group by t1.template_type_code
select t1.template_type_code from templates as t1 join documents as t2 on t1.template_id = t2.template_id group by t1.template_type_code order by count(*) desc limit 1
select t1.template_type_code from templates as t1 join documents as t2 on t1.template_id = t2.template_id group by t1.template_type_code order by count(*) desc limit 1
select template_type_code from templates except select t1.template_type_code from templates as t1 join documents as t2 on t1.template_id = t2.template_id
select template_type_code from ref_template_types except select t1.template_type_code from templates as t1 join documents as t2 on t1.template_id = t2.template_id
select template_type_code, template_type_description from ref_template_types
select template_type_code, template_type_description from ref_template_types
select template_type_description from ref_template_types where template_type_code = "AD"
select template_type_description from ref_template_types where template_type_code = "AD"
select template_type_code from ref_template_types where template_type_description = "Book"
select template_type_code from ref_template_types where template_type_description = "Book"
select distinct template_type_description from ref_template_types join documents on documents.template_id = documents.template_id
select distinct t1.template_type_description from ref_template_types as t1 join documents as t2 on t1.template_type_code = t2.template_id
select t1.template_id from templates as t1 join ref_template_types as t2 on t1.template_type_code = t2.template_type_code where t2.template_type_description = "Presentation"
select t1.template_id from templates as t1 join ref_template_types as t2 on t1.template_type_code = t2.template_type_code where t2.template_type_description = 'Presentation'
select count(*) from paragraphs
select count(*) from paragraphs
select count(*) from documents as t1 join paragraphs as t2 on t1.document_id = t2.document_id where t1.document_name = "Summer Show"
select count(*) from documents as t1 join paragraphs as t2 on t1.document_id = t2.document_id where t1.document_name = "Summer Show"
select other_details from paragraphs where paragraph_text = "Korea"
select other_details from paragraphs where paragraph_text like '%korea%'
select t2.paragraph_id, t2.paragraph_text from documents as t1 join paragraphs as t2 on t1.document_id = t2.document_id where t1.document_name = "Welcome to NY"
select t1.paragraph_id, t1.paragraph_text from paragraphs as t1 join documents as t2 on t1.document_id = t2.document_id where t2.document_name = 'Welcome to NY'
select t1.paragraph_text from paragraphs as t1 join documents as t2 on t1.document_id = t2.document_id where t2.document_name = "Customer reviews"
select t1.paragraph_text from paragraphs as t1 join documents as t2 on t1.document_id = t2.document_id where t2.document_name = "Customer reviews"
select document_id, count(*) from paragraphs group by document_id order by document_id
select document_id, count(*) from paragraphs group by document_id order by document_id
select t1.document_id, t1.document_name, count(*) from documents as t1 join paragraphs as t2 on t1.document_id = t2.document_id group by t1.document_id
select t1.document_id, t1.document_name, count(*) from documents as t1 join paragraphs as t2 on t1.document_id = t2.document_id group by t1.document_id
select document_id from paragraphs group by document_id having count(*) >= 2
select document_id from paragraphs group by document_id having count(*) >= 2
select t1.document_id, t1.document_name from documents as t1 join paragraphs as t2 on t1.document_id = t2.document_id group by t1.document_id order by count(*) desc limit 1
select t1.document_id, t1.document_name from documents as t1 join paragraphs as t2 on t1.document_id = t2.document_id group by t1.document_id order by count(*) desc limit 1
select document_id from paragraphs group by document_id order by count(*) asc limit 1
select document_id from paragraphs group by document_id order by count(*) asc limit 1
select document_id from paragraphs group by document_id having count(*) between 1 and 2
select document_id from paragraphs group by document_id having count(*) between 1 and 2
select document_id from paragraphs where paragraph_text = 'Brazil' intersect select document_id from paragraphs where paragraph_text = 'Ireland'
select document_id from paragraphs where paragraph_text = 'Brazil' intersect select document_id from paragraphs where paragraph_text = 'Ireland'
select count(*) from teacher
select count(*) from teacher
select name from teacher order by age asc
select name from teacher order by age asc
select age, hometown from teacher
select age, hometown from teacher
select name from teacher where hometown!= 'Little Lever Urban District'
select name from teacher where hometown!= 'Little Lever Urban District'
select name from teacher where age = 32 or age = 33
select name from teacher where age = 32 or age = 33
select hometown from teacher order by age asc limit 1
select hometown from teacher order by age asc limit 1
select distinct hometown, count(*) from teacher group by hometown
select hometown, count(*) from teacher group by hometown
select hometown from teacher group by hometown order by count(*) desc limit 1
select hometown from teacher group by hometown order by count(*) desc limit 1
select hometown from teacher group by hometown having count(*) >= 2
select hometown from teacher group by hometown having count(*) >= 2
select t1.name, t2.course_id from teacher as t1 join course_arrange as t2 on t1.teacher_id = t2.teacher_id
select t2.name, t3.course from course_arrange as t1 join teacher as t2 on t1.teacher_id = t2.teacher_id join course as t3 on t1.course_id = t3.course_id
select t2.name, t3.course from course_arrange as t1 join teacher as t2 on t1.teacher_id = t2.teacher_id join course as t3 on t1.course_id = t3.course_id order by t2.name asc
select t2.name, t3.course from course_arrange as t1 join teacher as t2 on t1.teacher_id = t2.teacher_id join course as t3 on t1.course_id = t3.course_id order by t2.name asc
select t2.name from course_arrange as t1 join teacher as t2 on t1.teacher_id = t2.teacher_id join course as t3 on t1.course_id = t3.course_id where t3.course = 'Math'
select distinct t1.name from teacher as t1 join course as t2 on t1.teacher_id =
select t2.name, count(*) from course_arrange as t1 join teacher as t2 on t1.teacher_id = t2.teacher_id group by t2.name
select t2.name, count(*) from course_arrange as t1 join teacher as t2 on t1.teacher_id = t2.teacher_id group by t2.name
select t2.name from course_arrange as t1 join teacher as t2 on t1.teacher_id = t2.teacher_id group by t2.name having count(*) >= 2
select t2.name from course_arrange as t1 join teacher as t2 on t1.teacher_id = t2.teacher_id group by t2.name having count(*) >= 2
select name from teacher where teacher_id not in (select teacher_id from course_arrange)
select name from teacher where teacher_id not in (select teacher_id from course_arrange)
select count(*) from visitor where age < 30
select name from visitor where level_of_membership > 4 order by level_of_membership desc
select avg(age), name from visitor where level_of_membership < 4
select name, level_of_membership from visitor where level_of_membership > 4 order by age desc
select t1.museum_id, t1.name from museum as t1 join visit as t2 on t1.museum_id = t2.museum_id group by t1.museum_id order by sum(num_of_staff) desc limit 1
select avg(num_of_staff) from museum where open_year < 2009
select open_year, num_of_staff from museum where name = 'Plaza Museum'
select name from museum where num_of_staff > (select min(num_of_staff) from museum where open_year > 2010)
select t1.id, t1.name, t1.age from visitor as t1 join visit as t2 on t1.id = t2.visitor_id group by t1.id having count(*) > 1
select t1.id, t1.name, t1.level_of_membership from visitor as t1 join visit as t2 on t1.id = t2.visitor_id order by sum(t2.total_spent) desc limit 1
select t1.museum_id, t1.name from museum as t1 join visit as t2 on t1.museum_id = t2.museum_id group by t1.museum_id order by count(*) desc limit 1
select name from museum where museum_id not in (select museum_id from visit)
select t1.name, t1.age from visitor as t1 join visit as t2 on t1.id = t2.visitor_id group by t2.visitor_id order by sum(t2.num_of_ticket) desc limit 1
select avg(num_of_ticket), max(num_of_ticket) from visit
select sum(total_spent) from visit as t1 join visitor as t2 on t1.visitor_id = t2.id where t2.level_of_membership = 1
select t1.name from visitor as t1 join visit as t2 on t1.id = t2.visitor_id join museum as t3 on t2.museum_id = t3.museum_id where t3.open_year < 2009 intersect select t1.name from visitor as t1 join visit as t2 on t1.id = t2.visitor_id join museum as t3 on t2.museum_id = t3.museum_id where t3.open_year > 2011
select count(*) from visit as t1 join museum as t2 on t1.museum_id = t2.museum_id where t2.open_year > 2010
select count(*) from museum where open_year > 2013 or open_year < 2008
select count(*) from players
select count(*) from players
select count(*) from matches
select count(*) from matches
select first_name, birth_date from players where country_code = 'USA'
select first_name, birth_date from players where country_code = "USA"
select avg(loser_age), avg(winner_age) from matches
select avg(loser_age), avg(winner_age) from matches
select avg(winner_rank) from matches
select avg(winner_rank) from matches
select max(loser_rank) from matches
select best_of from matches where loser_rank = (select min(loser_rank) from matches)
select count(distinct country_code) from players
select count(distinct country_code) from players
select count(distinct loser_name) from matches
select count(distinct loser_name) from matches
select tourney_name from matches group by tourney_name having count(*) > 10
select tourney_name from matches group by tourney_name having count(*) > 10
select winner_name from matches where year = 2013 intersect select winner_name from matches where year = 2016
select winner_name from matches where year = 2013 intersect select t1.winner_name from matches as t1 join players as t2 on t1.winner_id = t2.player_id where t1.year = 2016
select count(*) from matches where year = 2013 or year = 2016
select count(*) from matches where year = 2013 or year = 2016
select t1.country_code, t1.first_name from players as t1 join matches as t2 on t1.player_id = t2.winner_id where tourney_name = 'WTA Championships' intersect select t1.country_code, t1.first_name from players as t1 join matches as t2 on t1.player_id = t2.winner_id where tourney_name = 'Australian Open'
select t1.first_name, t1.country_code from players as t1 join matches as t2 on t1.player_id = t2.winner_id where t2.tourney_name = "WTA Championships" intersect select t1.first_name, t1.country_code from players as t1 join matches as t2 on t1.player_id = t2.winner_id where t2.tourney_name = "Australian Open"
select first_name, country_code from players order by birth_date desc limit 1
select first_name, country_code from players order by birth_date desc limit 1
select first_name, last_name from players order by birth_date
select first_name, last_name from players order by birth_date
select first_name, last_name from players where hand = "left" order by birth_date
select first_name, last_name from players where hand = "left" order by birth_date
select t1.first_name, t1.country_code from players as t1 join rankings as t2 on t1.player_id = t2.player_id group by t1.player_id order by count(*) desc limit 1
select t1.first_name, t1.country_code from players as t1 join rankings as t2 on t1.player_id = t2.player_id group by t1.player_id order by count(*) desc limit 1
select year from matches group by year order by count(*) desc limit 1
select year from matches group by year order by count(*) desc limit 1
select t2.winner_name, t2.winner_rank_points from rankings as t1 join
select t2.winner_name, t2.winner_rank_points from rankings as t1 join players on t1.player_id = t3.player_id join matches as t2 on t1.ranking_date = t2.ranking_date
select winner_name from matches where tourney_name = "Australian Open" order by winner_rank_points desc limit 1
select winner_name from matches where tourney_name = "Australian Open" order by winner_rank_points desc limit 1
select loser_name, winner_name from matches order by minutes desc limit 1
select t2.winner_name, t2.loser_name from matches as t1 join players as t2
select t1.player_id, t2.first_name, avg(t1.ranking) from rankings as t1 join players as t2 on t1.player_id = t2.player_id group by t1.player_id
select t1.first_name, avg(t2.ranking) from players as t1 join rankings as t2 on t1.player_id = t2.player_id group by t1.first_name
select sum(ranking_points), t1.first_name from players as t1 join rankings as t2 on t1.player_id = t2.player_id group by t1.player_id
select t1.first_name, sum(t2.ranking_points) from players as t1 join rankings as t2 on t1.player_id = t2.player_id group by t1.player_id
select country_code, count(*) from players group by country_code
select country_code, count(*) from players group by country_code
select country_code from players group by country_code order by count(*) desc limit 1
select country_code from players group by country_code order by count(*) desc limit 1
select country_code from players group by country_code having count(*) > 50
select country_code from players group by country_code having count(*) > 50
select ranking_date, count(*) from rankings group by ranking_date
select ranking_date, count(*) from rankings group by ranking_date
select year, count(*) from matches group by year
select year, count(*) from matches group by year
select winner_name, winner_rank from matches order by winner_age asc limit 3
select winner_name, winner_rank from matches order by winner_age asc limit 3
select count(distinct winner_hand) from matches where tourney_name = 'WTA Championships'
select count(*) from matches where tourney_name = "WTA Championships" and winner_hand = "left"
select t1.first_name, t1.country_code, t1.birth_date from players as t1 join matches as t2 on t1.player_id = t2.winner_id order by t2.winner_rank_points desc limit 1
select t1.first_name, t1.country_code, t1.birth_date from players as t1 join rankings as t2 on t1.player_id = t2.player_id group by t2.player_id order by count(*) desc limit 1
select hand, count(*) from players group by hand
select hand, count(*) from players group by hand
select count(*) from ship where disposition_of_ship = 'Captured'
select name, tonnage from ship order by name desc
select name, date, result from battle
select max(t1.killed), min(t1.killed) from death as t1 join battle as t2 on t1.caused_by_ship_id = t2.id group by t1.id
select avg(injured), t1.id from death as t1 join battle as t2 on t1.caused_by_ship_id = t2.id group by t1.id
select killed, injured from death as t1 join ship as t2 on t1.id = 'caused_by_ship_id' where t2.tonnage = 't'
select name, result from battle where bulgarian_commander!= 'Boril'
select distinct t1.id, t1.name from battle as t1 join ship as t2 on t1.id = t2.lost_in_battle where t2.ship_type = 'Brig'
select t1.id, t1.name from battle as t1 join death as t2 on t1.id = t2.caused_by_ship_id group by t1.id having sum(t2.killed) > 10
select t1.id, t1.name from ship as t1 join death as t2 on t1.id = t2.caused_by_ship_id group by t1.id order by sum(injured) desc limit 1
select distinct name from battle where bulgarian_commander = 'Kaloyan' intersect select distinct name from battle where latin_commander = 'Baldwin I'
select count(distinct result) from battle
select count(*) from battle where id not in ( select lost_in_battle from ship where tonnage = '225' )
select t1.name, t1.date from battle as t1 join ship as t2 on t1.id = t2.lost_in_battle where t2.name = 'Lettice' intersect select t1.name, t1.date from battle as t1 join ship as t2 on t1.id = t2.lost_in_battle where t2.name = 'HMS Atalanta'
select name, result, bulgarian_commander from battle where id not in (select lost_in_battle from ship where location = 'English Channel')
select note from death where note like '%east%'
select address_id from addresses where line_1 like "%2%"
select t1.line_1, t1.line_2 from addresses as t1 join students as t2 on t1.address_id = t2.current_address_id
select count(*) from courses
select count(*) from courses
select course_description from courses where course_name = "math"
select course_description from courses where course_name = "math"
select zip_postcode from addresses where city = "Port Chelsea"
select zip_postcode from addresses where city = "Port Chelsea"
select t1.department_name, t2.department_id from departments as t1 join degree_programs as t2 on t1.department_id = t2.department_id group by t2.department_id order by count(*) desc limit 1
select t1.department_name, t1.department_id from departments as t1 join degree_programs as t2 on t1.department_id = t2.department_id group by t1.department_id order by count(*) desc limit 1
select count(distinct department_id) from degree_programs
select count(distinct department_id) from degree_programs
select count(distinct degree_summary_name) from degree_programs
select count(distinct degree_program_id) from degree_programs
select count(*) from departments as t1 join degree_programs as t2 on t1.department_id = t2.department_id where t1.department_name = "Engineering"
select count(*) from departments as t1 join degree_programs as t2 on t1.department_id = t2.department_id where t1.department_name = "Engineering"
select section_name, section_description from sections
select section_name, section_description from sections
select t1.course_name, t1.course_id from courses as t1 join sections as t2 on t1.course_id = t2.course_id group by t1.course_id having count(*) < 2
select t1.course_name, t1.course_id from courses as t1 join sections as t2 on t1.course_id = t2.course_id group by t1.course_id having count(*) < 2
select section_name from sections order by section_name desc
select section_name from sections order by section_name desc
select t1.semester_name, t1.semester_id from semesters as t1 join student_enrolment as t2 on t1.semester_id = t2.semester_id group by t1.semester_id order by count(*) desc limit 1
select t1.semester_name, t1.semester_id from semesters as t1 join student_enrolment as t2 on t1.semester_id = t2.semester_id group by t1.semester_id order by count(*) desc limit 1
select department_description from departments where department_name like "%computer%"
select department_description from departments where department_name like "%computer%"
select t1.first_name, t1.middle_name, t1.last_name, t1.student_id from students as t1 join student_enrolment as t2 on t1.student_id = t2.student_id where t2.degree_program_id = 2
select t1.first_name, t1.middle_name, t1.last_name, t1.student_id from students as t1 join student_enrolment as t2 on t1.student_id = t2.student_id group by t1.student_id having count(*) = 2
select t1.first_name, t1.middle_name, t1.last_name from students as t1 join student_enrolment as t2 on t1.student_id = t2.student_id join degree_programs as t3 on t2.degree_program_id = t3.degree_program_id where t3.degree_summary_name = "Bachelor"
select t2.first_name, t2.middle_name, t2.last_name from student_enrolment as t1 join students as t2 on t1.student_id = t2.student_id where t1.degree_program_id = 'Bachelor'
select degree_program_id from student_enrolment group by degree_program_id order by count(*) desc limit 1
select t1.degree_summary_name from degree_programs as t1 join student_enrolment as t2 on t1.degree_program_id = t2.degree_program_id group by t1.degree_summary_name order by count(*) desc limit 1
select t1.degree_program_id, t1.degree_summary_name from degree_programs as t1 join student_enrolment as t2 on t1.degree_program_id = t2.degree_program_id group by t1.degree_program_id order by count(*) desc limit 1
select t1.degree_program_id, t1.degree_summary_name from degree_programs as t1 join student_enrolment as t2 on t1.degree_program_id = t2.degree_program_id group by t1.degree_program_id order by count(*) desc limit 1
select t1.student_id, t2.first_name, t2.middle_name, count(*), t1.student_id from student_enrolment as t1 join students as t2 on t1.student_id = t2.student_id group by t1.student_id order by count(*) desc limit 1
select t1.first_name, t1.middle_name, t1.last_name, count(*), t1.student_id from students as t1 join student_enrolment as t2 on t1.student_id = t2.student_id group by t1.student_id order by count(*) desc limit 1
select semester_name from semesters where semester_id not in (select semester_id from student_enrolment)
select semester_name from semesters where semester_id not in (select semester_id from student_enrolment)
select distinct t1.course_name from courses as t1 join student_enrolment_courses as t2 on t1.course_id = t2.course_id
select distinct t1.course_name from courses as t1 join student_enrolment_courses as t2 on t1.course_id = t2.course_id
select t1.course_name from courses as t1 join student_enrolment_courses as t2 on t1.course_id = t2.course_id group by t1.course_id order by count(*) desc limit 1
select t1.course_name from courses as t1 join student_enrolment_courses as t2 on t1.course_id = t2.course_id group by t1.course_name order by count(*) desc limit 1
select last_name from students where current_address_id in (select student_id from student_enrolment where degree_program_id = 'Y') and state_province_county = "Nortucky" 
select last_name from students where current_address_id in (select current_address_id from students where date_first_registered = 'NC') except select t1.last_name from students as t1 join student_enrolment as t2 on t1.student_id = t2.student_id
select t1.transcript_date, t1.transcript_id from transcripts as t1 join transcript_contents as t2 on t1.transcript_id = t2.transcript_id group by t1.transcript_id having count(*) >= 2
select t1.transcript_date, t1.transcript_id from transcripts as t1 join courses as t2 on t1.course_id
select cell_mobile_number from students where first_name = "Timmothy" and last_name = "Ward"
select cell_mobile_number from students where first_name = "Timmothy" and last_name = "Ward"
select first_name, middle_name, last_name from students order by date_first_registered asc limit 1
select first_name, middle_name, last_name from students order by date_first_registered asc limit 1
select first_name, middle_name, last_name from students order by date_first_registered asc limit 1
select first_name, middle_name, last_name from students order by date_first_registered limit 1
select distinct first_name from addresses as t1 join students as t2 on t1.address_id = t2.permanent_address_id
select first_name from students where permanent_address_id not in (select permanent_address_id from students)
select t1.address_id, t1.line_1 from addresses as t1 join students as t2 on t1.address_id = t2.current_address_id group by t1.address_id order by count(*) desc limit 1
select t1.address_id, t1.line_1, t1.line_2 from addresses as t1 join students as t2 on t1.address_id = t2.current_address_id group by t1.address_id order by count(*) desc limit 1
select avg(transcript_date) from transcripts
select avg(transcript_date) from transcripts
select transcript_date, other_details from transcripts as t1 join transcripts as t2 on t1.transcript_id = t2.transcript_id
select t1.transcript_date, t1.other_details from transcripts as t1 join transcripts as t2 on t1.transcript_id = t2.transcript_id order by t1.transcript_date asc limit 1
select count(*) from transcripts
select count(*) from transcripts
select max(transcript_date) from transcripts
select max(transcript_date) from transcripts
select count(*), t1.course_id from courses as t1 join transcript_contents as t2 on t1.course_id = t2.student_course_id group by t1.course_id
select t1.course_name, count(*) from courses as t1 join student_enrolment_courses as t2 on t1.course_id = t2.course_id group by t1.course_id
select transcript_date, transcript_id from transcripts group by transcript_id order by count(*) asc limit 1
select t1.transcript_date, t1.transcript_id from transcripts as t1 join transcript_contents as t2 on t1.transcript_id = t2.transcript_id group by t1.transcript_id order by count(*) asc limit 1
select t2.semester_id from student_enrolment as t1 join semesters as t2 on t1.semester_id = t2.semester_id join courses as t3 on t1.course
select semester_id from student_enrolment where student_id = "Masters" intersect select semester_id from student_enrolment where student_id = "Bachelors"
select count(distinct current_address_id) from students
select distinct t1.address_id from addresses as t1 join students as t2 on t1.address_id = t2.current_address_id
select other_student_details from students order by other_student_details desc
select other_student_details from students order by other_student_details
select section_description from sections where section_name = "h"
select section_description from sections where section_name = "h"
select t1.first_name from students as t1 join addresses as t2 on t1.permanent_address_id = t2.address_id where t2.country = "Haiti" or t1.cell_mobile_number = "09700166582"
select first_name from students where permanent_address_id = 'Haiti' or cell_mobile_number = '09700166582'
select title from cartoon order by title
select title from cartoon order by title
select title from cartoon where directed_by = "Ben Jones"
select title from cartoon where directed_by = "Ben Jones"
select count(*) from cartoon where written_by = "Joseph Kuhr"
select count(*) from cartoon where written_by = "Joseph Kuhr"
select title, directed_by from cartoon order by original_air_date
select title, directed_by from cartoon order by original_air_date
select title from cartoon where directed_by = "Ben Jones" or directed_by = "Brandon Vietti"
select title from cartoon where directed_by = "Ben Jones" or directed_by = "Brandon Vietti"
select country, count(*) from tv_channel group by country order by count(*) desc limit 1
select country, count(*) from tv_channel group by country order by count(*) desc limit 1
select count(distinct series_name), content from tv_channel
select count(distinct series_name), content from tv_channel
select content from tv_channel where series_name = "Sky Radio"
select content from tv_channel where series_name = "Sky Radio"
select package_option from tv_channel where series_name = "Sky Radio"
select t1.package_option from tv_channel as t1 join tv_series as t2 on t1.id = t2.channel where series_name = "Sky Radio"
select count(*) from tv_channel where language = "English"
select count(*) from tv_channel where language = "English"
select language, count(*) from tv_channel group by language order by count(*) asc limit 1
select language, count(*) from tv_channel group by language order by count(*) asc limit 1
select language, count(*) from tv_channel group by language
select language, count(*) from tv_channel group by language
select t2.series_name from cartoon as t1 join tv_channel as t2 on t1.channel = t2.id where t1.title = "The Rise of the blue Beetle!"
select t1.series_name from tv_channel as t1 join cartoon as t2 on t1.id = t2.channel where t2.title = "The Rise of the Blue Beetle"
select t1.title from cartoon as t1 join tv_channel as t2 on t1.channel = t2.id where t2.series_name = "Sky Radio"
select t1.title from cartoon as t1 join tv_channel as t2 on t1.channel = t2.id where t2.series_name = "Sky Radio"
select episode from tv_series order by rating
select episode from tv_series order by rating
select episode, rating from tv_series order by rating desc limit 3
select episode, rating from tv_series order by rating desc limit 3
select min(share), max(share) from tv_series
select max(share), min(share) from tv_series
select air_date from tv_series where episode = "A love of a Lifetime"
select air_date from tv_series where episode = "A love of a Lifetime"
select weekly_rank from tv_series where episode = "A love of a Lifetime"
select weekly_rank from tv_series where episode = "A love of a Lifetime"
select t2.series_name, t1.channel from tv_series as t1 join tv_channel as t2 on t1.channel = t2.id where t1.episode = "A love of a Lifetime"
select tv_series.series_name from tv_series as t1 join
select t1.episode from tv_series as t1 join tv_channel as t2 on t1.channel = t2.id where t2.series_name = "Sky Radio"
select t1.episode from tv_series as t1 join tv_channel as t2 on t1.channel = t2.id where t2.series_name = "Sky Radio"
select directed_by, count(*) from cartoon group by directed_by
select directed_by, count(*) from cartoon group by directed_by
select production_code, channel from cartoon order by original_air_date desc limit 1
select production_code, channel from cartoon order by original_air_date desc limit 1
select t1.package_option, t1.series_name from tv_channel as t1 join tv_series as t2 on t1.id = t2.channel where t1.hight_definition_tv = 'Yes'
select t1.package_option, t1.series_name from tv_channel as t1 join tv_series as t2 on t1.id = t2.channel where t1.hight_definition_tv = 'Yes'
select t1.country from tv_channel as t1 join cartoon as t2 on t1.id = t2.channel where t2.written_by = "Todd Casey"
select t1.country from tv_channel as t1 join cartoon as t2 on t1.id = t2.channel where t2.written_by = "Todd Casey"
select country from tv_channel except select t1.country from tv_channel as t1 join cartoon as t2 on t1.id = t2.channel where t2.written_by = "Todd Casey"
select country from tv_channel except select t1.country from tv_channel as t1 join cartoon as t2 on t1.id = t2.channel where t2.written_by = "Todd Casey"
select t1.series_name, t1.country from tv_channel as t1 join cartoon as t2 on t1.id = t2.channel where t2.directed_by = "Ben Jones" intersect select t1.series_name, t1.country from tv_channel as t1 join cartoon as t2 on t1.id = t2.channel where t2.directed_by = "Michael Chang"
select t1.series_name, t1.country from tv_channel as t1 join cartoon as t2 on t1.id = t2.channel where t2.directed_by = "Ben Jones" intersect select t1.series_name, t1.country from tv_channel as t1 join cartoon as t2 on t1.id = t2.channel where t2.directed_by = "Michael Chang"
select pixel_aspect_ratio_par, country from tv_channel where language!= "English"
select pixel_aspect_ratio_par, country from tv_channel where language!= "English"
select t1.id from tv_channel as t1 join tv_series as t2 on t1.id = t2.channel group by t1.id having count(*) > 2
select t1.id from tv_channel as t1 join tv_series as t2 on t1.id = t2.channel group by t1.id having count(*) > 2
select id from tv_channel except select t1.id from tv_channel as t1 join cartoon as t2 on t1.id = t2.channel where t2.directed_by = "Ben Jones"
select id from tv_channel except select channel from cartoon where directed_by = "Ben Jones"
select package_option from tv_channel except select t1.package_option from tv_channel as t1 join cartoon as t2 on t1.id = t2.channel where t2.directed_by = "Ben Jones"
select package_option from tv_channel except select t1.package_option from tv_channel as t1 join cartoon as t2 on t1.id = t2.channel where t2.directed_by = "Ben Jones"
select count(*) from poker_player
select count(*) from poker_player
select earnings from poker_player order by earnings desc
select earnings from poker_player order by earnings desc
select final_table_made, best_finish from poker_player
select final_table_made, best_finish from poker_player
select avg(e
select avg(e
select money_rank from poker_player order by earnings desc limit 1
select money_rank from poker_player order by earnings desc limit 1
select max(final_table_made) from poker_player where earnings < 200000
select max(final_table_made) from poker_player where earnings < 200000
select t2.name from poker_player as t1 join people as t2 on t1.people_id = t2.people_id
select t2.name from poker_player as t1 join people as t2 on t1.people_id = t2.people_id
select t2.name from poker_player as t1 join people as t2 on t1.people_id = t2.people_id where t1.earnings > 300000
select t2.name from poker_player as t1 join people as t2 on t1.people_id = t2.people_id where t1.earnings > 300000
select t2.name from poker_player as t1 join people as t2 on t1.people_id = t2.people_id order by t1.final_table_made asc
select t2.name from poker_player as t1 join people as t2 on t1.people_id = t2.people_id order by t1.final_table_made asc
select t2.birth_date from poker_player as t1 join people as t2 on t1.people_id = t2.people_id order by t1.earnings limit 1
select t2.birth_date from poker_player as t1 join people as t2 on t1.people_id = t2.people_id order by t1.earnings limit 1
select t1.money_rank from poker_player as t1 join people as t2 on t1.people_id = t2.people_id order by t2.height desc limit 1
select t1.money_rank from poker_player as t1 join people as t2 on t1.people_id = t2.people_id order by t2.height desc limit 1
select avg(t1.earnings) from poker_player as t1 join people as t2 on t1.people_id = t2.people_id where t2.height > 200
select avg(t1.earnings) from poker_player as t1 join people as t2 on t1.people_id = t2.people_id where t2.height > 200
select t2.name from poker_player as t1 join people as t2 on t1.people_id = t2.people_id order by t1.earnings desc
select t2.name from poker_player as t1 join people as t2 on t1.people_id = t2.people_id order by t1.earnings desc
select nationality, count(*) from people group by nationality
select nationality, count(*) from people group by nationality
select nationality from people group by nationality order by count(*) desc limit 1
select nationality from people group by nationality order by count(*) desc limit 1
select nationality from people group by nationality having count(*) >= 2
select nationality from people group by nationality having count(*) >= 2
select name, birth_date from people order by name asc
select name, birth_date from people order by name asc
select name from people where nationality!= "Russia"
select name from people where nationality!= "Russia"
select name from people where people_id not in (select people_id from poker_player)
select name from people where people_id not in (select people_id from poker_player)
select count(distinct nationality) from people
select count(distinct nationality) from people
select count(*) from area_code_state
select contestant_number, contestant_name from contestants order by contestant_name desc
select vote_id, phone_number, state from votes
select max(area_code), min(area_code) from area_code_state
select created from votes where state = 'CA' and created = (select max(created) from votes where state = 'CA')
select contestant_name from contestants except select contestant_name from contestants where contestant_name = 'Jessie Alloway'
select distinct state, created from votes
select t1.contestant_number, t1.contestant_name from contestants as t1 join votes as t2 on t1.contestant_number = t2.contestant_number group by t1.contestant_number having count(*) >= 2
select t1.contestant_number, t1.contestant_name from contestants as t1 join votes as t2 on t1.contestant_number = t2.contestant_number group by t2.contestant_number order by count(*) asc limit 1
select count(*) from votes where state = 'NY' or state = 'CA'
select count(*) from contestants where contestant_name not in (select distinct t1.contestant_name from contestants as t1 join votes as t2 on t1.contestant_number = t2.contestant_number)
select area_code from votes
select t1.created, t1.state, t1.phone_number from votes as t1 join contestants as t2 on t1.contestant_number = t2.contestant_number where t2.contestant_name = 'Tabatha Gehling'
select t1.area_code from area_code_state as t1 join votes as t2 on t1.area_code = t2.vote_id join contestants as t3 on t2.contestant_number = t3.contestant_number where t3.contestant_name = 'Tabatha Gehling' intersect select t1.area_code from area_code_state as t1 join votes as t2 on t1.area_code = t2.vote_id join contestants as t3 on t2.contestant_number = t3.contestant_number where t3.contestant_name = 'Kelly Clauss'
select contestant_name from contestants where contestant_name like '%al%'
select name from country where indepyear > 1950
select name from country where indepyear > 1950
select count(*) from country where governmentform = "Republic"
select count(*) from country where governmentform = "Republic"
select sum(surfacearea) from country where region = "Carribean"
select sum(surfacearea) from country where continent = "Carribean"
select continent from country where name = "Anguilla"
select continent from country where name = "Anguilla"
select distinct t2.region from city as t1 join country as t2 on t1.countrycode = t2.code where t1.name = "Kabul"
select distinct region from city as t1 join country as t2 on t1.countrycode = t2.code where t1.name = "Kabul"
select language from countrylanguage where localname = 'Aruba'
select language from countrylanguage where localname = "Aruba"
select population, lifeexpectancy from country where name = 'Brazil'
select population, lifeexpectancy from country where name = 'Brazil'
select region, population from country where name = 'Angola'
select region, population from country where name = "Angola"
select avg(lifeexpectancy) from country where region = "Central Africa"
select avg(lifeexpectancy) from country where region = "Central Africa"
select name from country where continent = 'Asia' order by lifeexpectancy asc limit 1
select name from country where continent = 'Asia' order by lifeexpectancy limit 1
select sum(population), max(gnp) from country where continent = 'Asia'
select population, gnp from country where continent = "Asia" group by gnp order by count(*) desc limit 1
select avg(lifeexpectancy) from country where continent = "Africa" and governmentform = "Republic"
select avg(lifeexpectancy) from country where continent = 'Africa' and governmentform = 'Republic'
select sum(surfacearea) from country where continent = "Asia" intersect select sum(surfacearea) from country where continent = "Europe"
select sum(surfacearea) from country where continent = "Asia" or continent = "Europe"
select sum(population) from city where district = "Gelderland"
select sum(population) from city where district = 'Gelderland'
select avg(gnp), sum(population) from country where governmentform = 'US Territory'
select avg(gnp), sum(population) from country where governmentform = "US Territory"
select count(distinct language) from countrylanguage
select count(distinct language) from countrylanguage
select count(distinct governmentform) from country where continent = "Africa"
select count(distinct governmentform) from country where continent = 'Africa'
select count(distinct language) from countrylanguage where name = 'Aruba' 
select count(distinct language) from countrylanguage where localname = "Aruba
select count(distinct language) from countrylanguage where countrycode in (select t1.code from country as t1 join countrylanguage as t2 on t1.code = t2.countrycode where t1.name = "Afghanistan")
select count(distinct language) from countrylanguage where countrycode = "Afghanistan"
select t1.name from country as t1 join countrylanguage as t2 on t1.code = t2.countrycode group by t1.name order by count(*) desc limit 1
select t1.name from country as t1 join countrylanguage as t2 on t1.code = t2.countrycode group by t1.name order by count(*) desc limit 1
select t1.continent, t2.language from country as t1 join countrylanguage as t2 on
select t1.continent, count(*) from country as t1 join countrylanguage as t2 on t1.code = t2.countrycode group by t1.continent order by count(*) desc limit 1
select count(*) from countrylanguage where language = "English" intersect select countrycode from countrylanguage where language = "Dutch"
select count(*) from countrylanguage where language = "English" intersect select countrycode from countrylanguage where language = "Dutch"
select t1.name from country as t1 join countrylanguage as t2 on t1.code = t2.countrycode where t2.language = "English" intersect select t1.name from country as t1 join countrylanguage as t2 on t1.code = t2.countrycode where t2.language = "French"
select t1.name from country as t1 join countrylanguage as t2 on t1.code = t2.countrycode where t2.language = "English" intersect select t1.name from country as t1 join countrylanguage as t2 on t1.code = t2.countrycode where t2.language = "French"
select t1.name from country as t1 join countrylanguage as t2 on t1.code = t2.countrycode where t2.language = "English" intersect select t1.name from country as t1 join countrylanguage as t2 on t1.code = t2.countrycode where t2.language = "French"
select t1.name from country as t1 join countrylanguage as t2 on t1.code = t2.countrycode where t2.language = "English" intersect select t1.name from country as t1 join countrylanguage as t2 on t1.code = t2.countrycode where t2.language = "French"
select count(distinct t1.continent) from country as t1 join countrylanguage as t2 on t1.code = t2.countrycode where t2.language = "Chinese"
select count(*) from country as t1 join countrylanguage as t2 on t1.code = t2.countrycode where t2.language = "Chinese"
select distinct t2.region from countrylanguage as t1 join country as t2 on t1.countrycode = t2.code where t1.language = "English" or t1.language = "Dutch"
select distinct t1.region from country as t1 join countrylanguage as t2 on t1.code = t2.countrycode where t2.language = "Dutch" or t2.language = "English"
select countrycode from countrylanguage where language = "English" or language = "Dutch"
select t1.name from country as t1 join countrylanguage as t2 on t1.code = t2.countrycode where t2.language = "English" or t2.language = "Dutch"
select t1.language from countrylanguage as t1 join country as t2 on t1.countrycode = t2.code where t2.continent = "Asia" group by t1.language order by count(*) desc limit 1
select t1.language from countrylanguage as t1 join country as t2 on t1.countrycode = t2.code where t2.continent = "Asia" group by t1.language order by count(*) desc limit 1
select language from countrylanguage where governmentform = 'Republic'
select t1.language from countrylanguage as t1 join country as t2 on t1.countrycode = t2.code where t2.governmentform = "Republic" group by t1.language having count(*) = 1
select t1.name from city as t1 join countrylanguage as t2 on t1.id = t2.countrycode where t2.language = "English" group by t1.name order by count(*) desc limit 1
select t1.name from city as t1 join countrylanguage as t2 on t1.id = t2.countrycode where t2.language = "English" group by t1.name order by count(*) desc limit 1
select name, population, lifeexpectancy from country where continent = 'Asia' order by surfacearea desc limit 1
select name, population, lifeexpectancy from country where continent = 'Asia'
select avg(lifeexpectancy) from country where language not
select avg(lifeexpectancy) from country where language!= "english" or isofficial!= "
select sum(t1.population) from country as t1 join countrylanguage as t2 on t1.code = t2.countrycode where t2.language!= "English"
select sum(population) from country where countrycode not in (select countrycode from countrylanguage where language = 'England') 
select t2.language from country as t1 join countrylanguage as t2 on t1.code = t2.countrycode where t1.headofstate = "Beatrix"
select t2.language from country as t1 join countrylanguage as t2 on t1.code = t2.countrycode where t1.headofstate = "Beatrix"
select count(distinct language) from countrylanguage where countrycode in (select t1.countrycode from country as
select count(*) from countrylanguage where isofficial < 1930
select name from country where surfacearea > (select max(surfacearea) from country where continent = 'Europe')
select name from country where surfacearea > (select max(surfacearea) from country where continent = 'Europe')
select name from country where population < (select max(population) from country where continent = 'Africa')
select name from country where population < (select min(population) from country where continent = 'Africa')
select name from country where population > (select max(population) from country where continent = 'Asia')
select name from country where population > (select min(population) from country where continent = 'Asia')
Select countrycode from countrylanguage except select countrycode from countrylanguage where language = "English"
select countrycode from countrylanguage where language!= "English"
select countrycode from countrylanguage where language!= "English"
select countrycode from countrylanguage where language!= "English"
select countrycode from countrylanguage where language!= 'English' and governmentform!= 'Republique!
select countrycode from countrylanguage where language!= 'English' and governmentform!= 'Republika
select t1.name from city as t1 join countrylanguage as t2 on t1.countrycode = t2.countrycode where t2.language!= "English"
select name from country where continent = 'Europe' and language!= 'England!
select distinct t1.name from city as t1 join countrylanguage as t2 on t1.countrycode = t2.countrycode where t2.language = "Chinese"
select distinct t1.name from city as t1 join countrylanguage as t2 on t1.countrycode = t2.countrycode where continent = "Asia" and t2.language = "Chinese
select name, indepyear, surfacearea from country order by population asc limit 1
select name, indepyear, surfacearea from country order by population asc limit 1
select population, name, headofstate from country order by surfacearea desc limit 1
select name, population, headofstate from country order by surfacearea desc limit 1
select t1.name, count(*), t1.code from country as t1 join countrylanguage as t2 on t1.code = t2.countrycode group by t1.name having count(*) >= 3
select t1.name, count(*) from country as t1 join countrylanguage as t2 on t1.code = t2.countrycode group by t1.name having count(*) > 2
select count(*), district from city group by district having avg(population) > (select avg(population) from city)
select count(*), district from city where population > (select avg(population) from city) group by district
select governmentform, sum(population) from country where lifeexpectancy > 72 group by governmentform
select sum(population), governmentform from country where lifeexpectancy > 72 group by governmentform
select avg(lifeexpectancy), sum(population), continent from country where avg(lifeexpectancy) < 72 group by continent
select continent, sum(population), avg(lifeexpectancy) from country where population < 72 group by continent
select name, surfacearea from country order by surfacearea desc limit 5
select name, surfacearea from country order by population desc limit 5
select name from country order by population desc limit 3
select name from country order by population desc limit 3
select name from country order by population asc limit 3
select name from country order by population asc limit 3
select count(*) from country where continent = "Asia"
select count(*) from country where continent = "Asia"
select name from country where continent = 'Europe' and population = 80000
select name from country where continent = 'Europe' and population = 80000
select sum(population), avg(surfacearea) from country where continent = "North America" and region > 3000
select sum(population), avg(surfacearea) from country where region = "North America" and surfacearea > 3000
select name from city where population between 160000 and 900000
select name from city where population between 160000 and 900000
select language from countrylanguage group by language order by count(*) desc limit 1
select language from countrylanguage group by language order by count(*) desc limit 1
select language, count(*) from countrylanguage group by language order by count(*) desc limit 1
select countrycode, language from countrylanguage group by countrycode order by sum(percentage) desc limit 1
select count(*) from countrylanguage where language = 'Spanish' group by countrycode order by sum(percentage) desc limit 1
select count(*) from countrylanguage where language = "Spanish" group by countrycode order by count(*) desc limit 1
select countrycode from countrylanguage where language = "Spanish" group by countrycode order by sum(percentage) desc limit 1
select countrycode from countrylanguage where language = "Spanish" group by countrycode order by count(*) desc limit 1
select count(*) from conductor
select count(*) from conductor
select name from conductor order by age asc
select name from conductor order by age asc
select name from conductor where nationality!= 'USA'
select name from conductor where nationality!= 'USA'
select record_company from orchestra order by year_of_founded desc
select record_company from orchestra order by year_of_founded desc
select avg(attendance) from show
select avg(attendance) from show
select max(share), min(share) from performance where type!= "Live final"
select max(share), min(share) from performance where type!= "Live final"
select count(distinct nationality) from conductor
select count(distinct nationality) from conductor
select name from conductor order by year_of_work desc
select name from conductor order by year_of_work desc
select name from conductor order by year_of_work desc limit 1
select name from conductor order by year_of_work desc limit 1
select t2.name, count(*) from orchestra as t1 join conductor as t2 on
select t2.name, t3.name from orchestra as t1 join conductor as t2 on
select t2.name from orchestra as t1 join conductor as t2 on t1.conductor_id = t2.conductor_id group by t2.name having count(*) > 1
select t2.name from orchestra as t1 join conductor as t2 on t1.conductor_id = t2.conductor_id group by t2.name having count(*) > 1
select t2.name from orchestra as t1 join conductor as t2 on t1.conductor_id = t2.conductor_id group by t2.name order by count(*) desc limit 1
select t2.name from orchestra as t1 join conductor as t2 on t1.conductor_id = t2.conductor_id group by t2.name order by count(*) desc limit 1
select t2.name from orchestra as t1 join conductor as t2 on t1.conductor_id = t2.conductor_id where t1.year_of_founded > 2008
select t2.name from orchestra as t1 join conductor as t2 on t1.conductor_id = t2.conductor_id where t1.year_of_founded > 2008
select record_company, count(*) from orchestra group by record_company
select record_company, count(*) from orchestra group by record_company
select major_record_format from orchestra order by count(*) asc
select major_record_format from orchestra group by major_record_format order by count(*) asc
select record_company from orchestra group by record_company order by count(*) desc limit 1
select record_company from orchestra group by record_company order by count(*) desc limit 1
select orchestra from orchestra where orchestra_id not in (select orchestra_id from performance)
select orchestra from orchestra where orchestra_id not in (select orchestra_id from performance)
select record_company from orchestra where year_of_founded < 2003 intersect select record_company from orchestra where year_of_founded > 2003
select record_company from orchestra where year_of_founded < 2003 intersect select record_company from orchestra where year_of_founded > 2003
select count(*) from orchestra where major_record_format = "CD" or major_record_format = "DVD"
select count(*) from orchestra where major_record_format = "CD" or major_record_format = "DVD"
select year_of_founded from orchestra group by year_of_founded having count(*) > 1
select year_of_founded from orchestra group by year_of_founded having count(*) > 1
select count(*) from highschooler
select count(*) from highschooler
select name, grade from highschooler
select name, grade from highschooler
select distinct grade from highschooler
select distinct grade from highschooler
select grade from highschooler where name = 'Kyle'
select grade from highschooler where name = 'Kyle'
select name from highschooler where grade = 10
select name from highschooler where grade = 10
select id from highschooler where name = 'Kyle'
select id from highschooler where name = 'Kyle'
select count(*) from highschooler where grade = 9 or grade = 10
select count(*) from highschooler where grade = 9 or grade = 10
select grade, count(*) from highschooler group by grade
select grade, count(*) from highschooler group by grade
select grade from highschooler group by grade order by count(*) desc limit 1
select grade from highschooler group by grade order by count(*) desc limit 1
select grade from highschooler group by grade having count(*) >= 4
select grade from highschooler group by grade having count(*) >= 4
select student_id, count(distinct friend_id) from friend group by student_id
select count(distinct friend_id) from friend
select t1.name, count(*) from highschooler as t1 join friend as t2 on t1.id = t2.friend_id group by t1.id
select count(*), t1.name from highschooler as t1 join friend as t2 on t1.id = t2.friend_id group by t1.id
select t1.name from highschooler as t1 join friend as t2 on t1.id = t2.friend_id group by t1.id order by count(*) desc limit 1
select t1.name from highschooler as t1 join friend as t2 on t1.id = t2.student_id group by t1.id order by count(*) desc limit 1
select t1.name from highschooler as t1 join friend as t2 on t1.id = t2.friend_id group by t2.friend_id having count(*) >= 3
select t1.name from highschooler as t1 join friend as t2 on t1.id = t2.friend_id group by t2.friend_id having count(*) >= 3
select distinct t3.name from highschooler as t1 join friend as t2 on t1.id = t2.friend_id join highschooler as t3 on t1.id = t3.id where t1.name = "Kyle"
select t2.friend_id from highschooler as t1 join friend as t2 on t1.id = t2.friend_id where t1.name = "Kyle"
select count(distinct t2.friend_id) from highschooler as t1 join friend as t2 on t1.id = t2.student_id where t1.name = "Kyle"
select count(distinct friend_id) from highschooler as t1 join friend as t2 on t1.id = t2.friend_id where t1.name = "Kyle"
select student_id from
select id from highschooler except select friend_id from friend
select name from highschooler where id not in (select student_id from friend)
select name from
select t1.id from highschooler as t1 join friend as t2 on t1.id = t2.friend_id intersect select t1.id from highschooler as t1 join likes as t2 on t1.id = t2.liked_id
select t1.student_id from friend as t1 join likes as t2 on t1.friend_id = t2.student_id
select t2.name from friend as t1 join likes as t3 on t1.friend_id = t3.student_id
select t1.name from highschooler as t1 join friend as t2 on t1.id = t2.friend_id intersect select t1.name from highschooler as t1 join likes as t2 on t1.id = t2.liked_id
select count(*), student_id from likes group by student_id
select student_id, count(*) from likes group by student_id
select t1.name, count(*) from highschooler as t1 join likes as t2 on t1.id = t2.liked_id group by t1.id
select t1.name, count(*) from highschooler as t1 join likes as t2 on t1.id = t2.liked_id group by t1.id
select t1.name from highschooler as t1 join likes as t2 on t1.id = t2.liked_id group by t1.id order by count(*) desc limit 1
select t1.name from highschooler as t1 join likes as t2 on t1.id = t2.student_id group by t2.student_id order by count(*) desc limit 1
select t1.name from highschooler as t1 join likes as t2 on t1.id = t2.student_id group by t1.name having count(*) >= 2
select t1.name from highschooler as t1 join likes as t2 on t1.id = t2.student_id group by t2.student_id having count(*) >= 2
select name from highschooler where grade > 5 intersect select t1.name from highschooler as t1 join friend as t2 on t1.id = t2.friend_id group by t1.name having count(*) >= 2
select name from highschooler where grade > 5 intersect select t1.name from highschooler as t1 join friend as t2 on t1.id = t2.friend_id group by t2.friend_id having count(*) >= 2
select count(*) from highschooler as t1 join likes as t2 on t1.id = t2.liked_id where t1.name = "Kyle"
select count(*) from highschooler as t1 join likes as t2 on t1.id = t2.liked_id where t1.name = "Kyle"
select avg(t2.grade) from friend as t1 join highschooler as t2 on t1.student_id = t2.id group by t1.student_id
select avg(t2.grade) from friend as t1 join highschooler as t2 on t1.student_id = t2.id
select min(grade) from highschooler where id not in (select student_id from friend)
select min(grade) from highschooler where id not in (select student_id from friend)
select state from owners union select state from professionals
select state from owners intersect select state from professionals
select avg(age) from dogs as t1 join treatments as t2 on t1.dog_id = t2.dog_id
select avg(age) from dogs as t1 join treatments as t2 on t1.dog_id = t2.dog_id
select t1.professional_id, t1.last_name, t1.cell_number from professionals as t1 join treatments as t2 on t1.professional_id = t2.professional_id where t1.state = "Indiana" group by t1.professional_id having count(*) > 2
select t1.professional_id, t1.last_name, t1.home_phone from professionals as t1 join treatments as t2 on t1.professional_id = t2.professional_id where t1.state = "Indiana" group by t1.professional_id having count(*) > 2
select name from dogs where dog_id not in (select dog_id from treatments group by dog_id having cost_of_treatment > 1000)
select name from dogs where owner_id not in (select dog_id from treatments group by dog_id having cost_of_treatment > 1000)
select first_name from professionals union select last_name from owners
select first_name from professionals union select last_name from owners
select professional_id, role_code, email_address from professionals except select t1.professional_id, t1.role_code from professionals as t1 join treatments as t2 on t1.professional_id = t2.professional_id where t2.dog_id = 1
select professional_id, role_code, email_address from professionals except select t1.professional_id, t1.role_code from professionals as t1 join treatments as t2 on t1.professional_id = t2.professional_id where t2.date_of_treatment >= 4
select t1.owner_id, t1.first_name, t1.last_name from owners as t1 join dogs as t2 on t1.owner_id = t2.owner_id group by t1.owner_id order by count(*) desc limit 1
select t1.owner_id, t1.first_name, t1.last_name from owners as t1 join dogs as t2 on t1.owner_id = t2.owner_id group by t1.owner_id order by count(*) desc limit 1
select t1.professional_id, t1.role_code, t1.first_name from professionals as t1 join treatments as t2 on t1.professional_id = t2.professional_id group by t1.professional_id having count(*) >= 2
select t1.professional_id, t1.role_code, t1.first_name from professionals as t1 join treatments as t2 on t1.professional_id = t2.professional_id group by t1.professional_id having count(*) >= 2
select t1.breed_name from breeds as t1 join dogs as t2 on t1.breed_code = t2.breed_code group by t1.breed_code order by count(*) desc limit 1
select t2.breed_name from dogs as t1 join breeds as t2 on t1.breed_code = t2.breed_code group by t2.breed_name order by count(*) desc limit 1
select t1.owner_id, t1.last_name from owners as t1 join treatments as t2 on t1.owner_id = t2.dog_id group by t1.owner_id order by count(*) desc limit 1
select t1.owner_id, t1.last_name from owners as t1 join treatments as t2 on t1.owner_id = t2.dog_id group by t1.owner_id order by sum(t2.cost_of_treatment) desc limit 1
select t1.treatment_type_description from treatment_types as t1 join treatments as t2 on t1.treatment_type_code = t2.treatment_type_code group by t1.treatment_type_code order by sum(t2.cost_of_treatment) asc limit 1
select t1.treatment_type_description from treatment_types as t1 join treatments as t2 on t1.treatment_type_code = t2.treatment_type_code group by t1.treatment_type_code order by sum(t2.cost_of_treatment) asc limit 1
select t1.owner_id, t1.zip_code from owners as t1 join charges as t2 on t1.owner_id = t2.owner_id
select t1.owner_id, t1.zip_code from owners as t1 join dogs as t2 on t1.owner_id = t2.owner_id group by t1.owner_id order by sum(t2.cost_of_treatment
select t1.professional_id, t1.cell_number from professionals as t1 join treatments as t2 on t1.professional_id = t2.professional_id group by t1.professional_id having count(*) >= 2
select t1.professional_id, t1.home_phone from professionals as t1 join treatments as t2 on t1.professional_id = t2.professional_id group by t1.professional_id having count(*) >= 2
select t2.first_name, t2.last_name from treatments as t1 join professionals as t2 on t1.professional_id = t2.professional_id where t1.cost_of_treatment < (select avg(cost_of_treatment) from treatments)
select t2.first_name, t2.last_name from treatments as t1 join professionals as t2 on t1.professional_id = t2.professional_id where t1.cost_of_treatment < (select avg(cost_of_treatment) from treatments)
select date_of_treatment, first_name from professionals as t1 join treatments as t2 on t1.professional_id = t2.professional_id
select date_of_treatment, first_name from professionals as t1 join treatments as t2 on t1.professional_id = t2.professional_id
select t1.cost_of_treatment, t2.treatment_type_description from treatments as t1 join treatment_types as t2 on t1.treatment_type_code = t2.treatment_type_code
select t1.cost_of_treatment, t2.treatment_type_description from treatments as t1 join treatment_types as t2 on t1.treatment_type_code = t2.treatment_type_code
select t1.first_name, t1.last_name, t2.size_code from owners as t1 join dogs as t2 on t1.owner_id = t2.owner_id
select t1.first_name, t1.last_name, t2.size_code from owners as t1 join dogs as t2 on t1.owner_id = t2.dog_id
select t1.first_name, t2.name from owners as t1 join dogs as t2 on t1.owner_id = t2.dog_id
select t1.first_name, t2.name from owners as t1 join dogs as t2 on t1.owner_id = t2.dog_id
select t1.name, t2.date_of_treatment from dogs as t1 join treatments as t2 on t1.dog_id = t2.dog_id where t1.breed_code = (select breed_code from dogs order by t1.breed_code limit 1)
select t1.name, t2.date_of_treatment from dogs as t1 join treatments as t2 on t1.dog_id = t2.dog_id where t1.breed_code = (select breed_code from dogs order by t1.breed_code limit 1)
select first_name, last_name from owners where state = "Virginia"
select t1.first_name, t2.name from owners as t1 join dogs as t2 on t1.owner_id = t2.dog_id where t1.state = "Virginia"
select date_arrived, date_departed from dogs as t1 join treatments as t2 on t1.dog_id = t2.dog_id
select date_arrived, date_departed from dogs as t1 join treatments as t2 on t1.dog_id = t2.dog_id
select t2.last_name from dogs as t1 join owners as t2 on t1.owner_id = t2.owner_id order by t1.age asc limit 1
select t2.last_name from dogs as t1 join owners as t2 on t1.owner_id = t2.owner_id order by t1.age asc limit 1
select email_address from professionals where state = "Hawaii" or state = "Wisconsin"
select email_address from professionals where state = "Hawaii" or state = "Wisconsin"
select date_arrived, date_departed from dogs
select date_arrived, date_departed from dogs
select count(distinct dog_id) from treatments
select count(distinct dog_id) from treatments
select count(distinct professional_id) from treatments as t1 join dogs as t2 on t1.dog_id = t2.dog_id
select count(distinct professional_id) from treatments as t1 join dogs as t2 on t1.dog_id = t2.dog_id
select role_code, street, city, state from professionals where city like '%west%'
select role_code, street, city, state from professionals where city like '%west%'
select first_name, last_name, email_address from owners where state like '%north%'
select first_name, last_name, email_address from owners where state like '%north%'
select count(*) from dogs where age < (select avg(age) from dogs)
select count(*) from dogs where age < (select avg(age) from dogs)
select max(cost_of_treatment) from treatments
select cost_of_treatment from treatments order by date_of_treatment desc limit 1
select count(*) from dogs where dog_id not in ( select dog_id from treatments )
select count(*) from dogs where dog_id not in ( select dog_id from treatments )
select count(*) from owners where owner_id not in ( select owner_id from dogs )
select count(*) from owners where owner_id not in ( select owner_id from dogs )
select count(*) from professionals where professional_id not in ( select professional_id from treatments where dog_id!= "null")
select count(*) from professionals where professional_id not in ( select professional_id from treatments )
select name, age, weight from dogs where abandoned_yn = 1 and 0 = "no"
select name, age, weight from dogs where abandoned_yn = 1 union select t1.name, t1.age, t1.weight from dogs as t1 join owners as t2 on t1.dog_id = t2.owner_id
select avg(age) from dogs
select avg(age) from dogs
select age from dogs order by age desc limit 1
select age from dogs order by age desc limit 1
select charge_type, charge_amount from charges group by charge_type
select charge_type, charge_amount from charges
select charge_type, max(charge_amount) from charges group by charge_type order by count(*) desc limit 1
select t1.charge_amount from charges as t1 join charges as t2 on t1.charge_id = t2.charge_id group by t2.charge_type order by sum(t2.cost_of_treatment
select email_address, cell_number, home_phone from professionals
select email_address, cell_number, home_phone from professionals
select distinct breed_code, size_code from dogs
select distinct breed_code, size_code from dogs
select t2.first_name, t3.treatment_type_description from treatments as t1 join professionals as t2 on t1.professional_id = t2.professional_id join treatment_types as t3 on t1.treatment_type_code = t3.treatment_type_code
select t2.first_name, t3.treatment_type_description from treatments as t1 join professionals as t2 on t1.professional_id = t2.professional_id join treatment_types as t3 on t1.treatment_type_code = t3.treatment_type_code
select count(*) from singer
select count(*) from singer
select name from singer order by net_worth_millions asc
select name from singer order by net_worth_millions asc
select birth_year, citizenship from singer
select birth_year, citizenship from singer
select name from singer where citizenship!= "France"
select name from singer where citizenship!= "France"
select name from singer where birth_year = 1948 or birth_year = 1949
select name from singer where birth_year = 1948 or birth_year = 1949
select name from singer order by net_worth_millions desc limit 1
select name from singer order by net_worth_millions desc limit 1
select citizenship, count(*) from singer group by citizenship
select citizenship, count(*) from singer group by citizenship
select citizenship from singer group by citizenship order by count(*) desc limit 1
select citizenship from singer group by citizenship order by count(*) desc limit 1
select citizenship, max(net_worth_millions) from singer group by citizenship
select citizenship, max(net_worth_millions) from singer group by citizenship
select t2.title, t1.name from singer as t1 join song as t2 on t1.singer_id = t2.singer_id
select t3.title, t2.name from song as t1 join singer as t2 on t1.singer_id = t2.singer_id join song as t3 on t1.song_id = t3.song_id
select distinct t1.name from singer as t1 join song as t2 on t1.singer_id = t2.singer_id where t2.sales > 300000
select distinct t1.name from singer as t1 join song as t2 on t1.singer_id = t2.singer_id where t2.sales > 300000
select t1.name from singer as t1 join song as t2 on t1.singer_id = t2.singer_id group by t1.singer_id having count(*) > 1
select t1.name from singer as t1 join song as t2 on t1.singer_id = t2.singer_id group by t1.singer_id having count(*) > 1
select t2.name, sum(t1.sales) from song as t1 join singer as t2 on t1.singer_id = t2.singer_id group by t1.singer_id
select sum(sales), t1.name from singer as t1 join song as t2 on t1.singer_id = t2.singer_id group by t1.name
select name from singer where singer_id not in (select singer_id from song)
select name from singer where singer_id not in (select singer_id from song)
select citizenship from singer where birth_year < 1945 intersect select citizenship from singer where birth_year > 1955
select citizenship from singer where birth_year < 1945 intersect select citizenship from singer where birth_year > 1955
select count(*) from other_available_features
select t1.feature_type_name from ref_feature_types as t1 join other_available_features as t2 on t1.feature_type_code = t2.feature_type_code where t2.feature_name = "AirCon"
select t1.property_type_description from ref_property_types as t1 join properties as t2 on t1.property_type_code = t2.property_type_code
select property_name from properties where property_type_code = "House" or property_type_code = "Apartment" and room_count > 1
