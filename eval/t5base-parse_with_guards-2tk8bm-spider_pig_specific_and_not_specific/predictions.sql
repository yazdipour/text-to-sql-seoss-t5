select count(*) from singer	concert_singer 
select count(*) from singer	concert_singer 
select name, country, age from singer order by age desc	concert_singer 
select name, country, age from singer order by age desc	concert_singer 
select avg(age), min(age), max(age) from singer where country = "France"	concert_singer 
select avg(age), min(age), max(age) from singer where country = "France"	concert_singer 
select song_name, song_release_year from singer order by age limit 1	concert_singer 
select song_name, song_release_year from singer order by age asc limit 1	concert_singer 
select distinct country from singer where age > 20	concert_singer 
select distinct country from singer where age > 20	concert_singer 
select country, count(*) from singer group by country	concert_singer 
select country, count(*) from singer group by country	concert_singer 
select song_name from singer where age > (select avg(age) from singer)	concert_singer 
select song_name from singer where age > (select avg(age) from singer)	concert_singer 
select location, name from stadium where capacity between 5000 and 10000	concert_singer 
select location, name from stadium where capacity between 5000 and 10000	concert_singer 
select max(capacity), avg(capacity) from stadium	concert_singer 
select avg(capacity), max(capacity) from stadium	concert_singer 
select name, capacity from stadium order by average desc limit 1	concert_singer 
select name, capacity from stadium order by avg(average) desc limit 1	concert_singer 
select count(*) from concert where year = 2014 or year = 2015	concert_singer 
select count(*) from concert where year = 2014 or year = 2015	concert_singer 
select t2.name, count(*) from concert as t1 join stadium as t2 on t1.stadium_id = t2.stadium_id group by t1.stadium_id	concert_singer 
select t1.stadium_id, count(*) from stadium as t1 join concert as t2 on t1.stadium_id = t2.stadium_id group by t2.stadium_id	concert_singer 
select t2.name, t2.capacity from concert as t1 join stadium as t2 on t1.stadium_id = t2.stadium_id where t1.year >= 2014 group by t1.stadium_id order by count(*) desc limit 1	concert_singer 
select t2.name, t2.capacity from concert as t1 join stadium as t2 on t1.stadium_id = t2.stadium_id where t1.year > 2013 group by t1.stadium_id order by count(*) desc limit 1	concert_singer 
select year from concert group by year order by count(*) desc limit 1	concert_singer 
select year from concert group by year order by count(*) desc limit 1	concert_singer 
select name from stadium where stadium_id not in (select stadium_id from concert)	concert_singer 
select name from stadium where stadium_id not in (select stadium_id from concert)	concert_singer 
select country from singer where age > 40 intersect select country from singer where age < 30	concert_singer 
select name from stadium except select t2.name from concert as t1 join stadium as t2 on t1.stadium_id = t2.stadium_id where t1.year = 2014	concert_singer 
select name from stadium except select t2.name from concert as t1 join stadium as t2 on t1.stadium_id = t2.stadium_id where t1.year = 2014	concert_singer 
select t2.concert_name, t2.theme, count(*) from singer_in_concert as t1 join concert as t2 on t1.concert_id = t2.concert_id group by t1.concert_id	concert_singer 
select t2.concert_name, t2.theme, count(*) from singer_in_concert as t1 join concert as t2 on t1.concert_id = t2.concert_id group by t1.concert_id	concert_singer 
select t2.name, count(*) from singer_in_concert as t1 join singer as t2 on t1.singer_id = t2.singer_id group by t1.singer_id	concert_singer 
select t2.name, count(*) from singer_in_concert as t1 join singer as t2 on t1.singer_id = t2.singer_id group by t1.singer_id	concert_singer 
select t3.name from concert as t1 join singer_in_concert as t2 on t1.concert_id = t2.concert_id join singer as t3 on t2.singer_id = t3.singer_id where t1.year = 2014	concert_singer 
select t3.name from concert as t1 join singer_in_concert as t2 on t1.concert_id = t2.concert_id join singer as t3 on t2.singer_id = t3.singer_id where t1.year = 2014	concert_singer 
select name, country from singer where song_name like '%hey%'	concert_singer 
select name, country from singer where song_name like '%hey%'	concert_singer 
select t2.name, t2.location from concert as t1 join stadium as t2 on t1.stadium_id = t2.stadium_id where t1.year = 2014 intersect select t2.name, t2.location from concert as t1 join stadium as t2 on t1.stadium_id = t2.stadium_id where t1.year = 2015	concert_singer 
select t2.name, t2.location from concert as t1 join stadium as t2 on t1.stadium_id = t2.stadium_id where t1.year = 2014 intersect select t2.name, t2.location from concert as t1 join stadium as t2 on t1.stadium_id = t2.stadium_id where t1.year = 2015	concert_singer 
select count(*) from stadium as t1 join concert as t2 on t1.stadium_id = t2.stadium_id order by t1.capacity desc limit 1	concert_singer 
select count(*) from stadium as t1 join concert as t2 on t1.stadium_id = t2.stadium_id where t1.capacity = (select max(capacity) from stadium)	concert_singer 
select count(*) from pets where weight > 10	pets_1 
select count(*) from pets where weight > 10	pets_1 
select weight from pets where pettype = 'dog' order by pet_age limit 1	pets_1 
select t2.weight from pets as t1 join pets as t2 on t1.petid = t2.petid where t1.pettype = "dog" order by t1.pet_age limit 1	pets_1 
select max(weight), pettype from pets group by pettype	pets_1 
select max(weight), pettype from pets group by pettype	pets_1 
select count(*) from pets as t1 join has_pet as t2 on t1.petid = t2.petid join student as t3 on t2.stuid = t3.stuid where t3.age > 20	pets_1 
select count(*) from has_pet as t1 join student as t2 on t1.stuid = t2.stuid where t2.age > 20	pets_1 
select count(*) from pets as t1 join has_pet as t2 on t1.petid = t2.petid join student as t3 on t2.stuid = t3.stuid where t3.sex = "F" and t2.petid = "dog"	pets_1 
select count(*) from pets as t1 join has_pet as t2 on t1.petid = t2.petid join student as t3 on t2.stuid = t3.stuid where t3.sex = "F" and t1.pettype = "dog"	pets_1 
select count(distinct pettype) from pets	pets_1 
select count(distinct pettype) from pets	pets_1 
select t1.fname from student as t1 join has_pet as t2 on t1.stuid = t2.stuid join pets as t3 on t2.petid = t3.petid where t3.pettype = "cat" or t3.pettype = "dog"	pets_1 
select distinct t1.fname from student as t1 join has_pet as t2 on t1.stuid = t2.stuid join pets as t3 on t2.petid = t3.petid where t3.pettype = "cat" or t3.pettype = "dog"	pets_1 
select fname from student where stuid in (select t1.stuid from has_pet as t1 join pets as t2 on t1.petid = t2.petid where t2.pettype = "cat") intersect select fname from student where stuid in (select t1.stuid from has_pet as t1 join pets as t2 on t1.petid = t2.petid where t2.pettype = "dog")	pets_1 
select fname from student where stuid in (select t1.stuid from has_pet as t1 join pets as t2 on t1.petid = t2.petid where t2.pettype = "cat") intersect select fname from student where stuid in (select t1.stuid from has_pet as t1 join pets as t2 on t1.petid = t2.petid where t2.pettype = "dog")	pets_1 
select major, age from student except select t1.major, t1.age from student as t1 join has_pet as t2 on t1.stuid = t2.stuid join pets as t3 on t2.petid = t3.petid where t3.pettype = "cat"	pets_1 
select t1.major, t1.age from student as t1 join has_pet as t2 on t1.stuid = t2.stuid join pets as t3 on t2.petid = t3.petid where t3.pettype = "cat"	pets_1 
select stuid from student except select stuid from has_pet as t1 join pets as t2 on t1.petid = t2.petid where t2.pettype = "cat"	pets_1 
select stuid from student except select stuid from has_pet as t1 join pets as t2 on t1.petid = t2.petid where t2.pettype = "cat"	pets_1 
select t1.fname, t1.age from student as t1 join has_pet as t2 on t1.stuid = t2.stuid join pets as t3 on t2.petid = t3.petid where t3.pettype = "dog" except select t1.fname, t1.age from student as t1 join has_pet as t2 on t1.stuid = t2.stuid join pets as t3 on t2.petid = t3.petid where t3.pettype = "cat"	pets_1 
select t1.fname from student as t1 join has_pet as t2 on t1.stuid = t2.stuid join pets as t3 on t2.petid = t3.petid where t3.pettype = "dog" except select t1.fname from student as t1 join has_pet as t2 on t1.stuid = t2.stuid join pets as t3 on t2.petid = t3.petid where t3.pettype = "cat"	pets_1 
select pettype, weight from pets order by pet_age asc limit 1	pets_1 
select pettype, weight from pets order by pet_age asc limit 1	pets_1 
select petid, weight from pets where pet_age > 1	pets_1 
select petid, weight from pets where pet_age > 1	pets_1 
select pettype, avg(pet_age), max(pet_age) from pets group by pettype	pets_1 
select pettype, avg(pet_age), max(pet_age) from pets group by pettype	pets_1 
select pettype, avg(weight) from pets group by pettype	pets_1 
select pettype, avg(weight) from pets group by pettype	pets_1 
select distinct t1.fname, t1.age from student as t1 join has_pet as t2 on t1.stuid = t2.stuid	pets_1 
select distinct t1.fname, t1.age from student as t1 join has_pet as t2 on t1.stuid = t2.stuid where t2.petid in (select t4.petid from has_pet as t3 join pets as t4 on t3.petid = t4.petid)	pets_1 
select t2.petid from has_pet as t1 join pets as t2 on t1.petid = t2.petid join student as t3 on t1.stuid = t3.stuid where t3.lname = 'Smith'	pets_1 
select t2.petid from has_pet as t1 join pets as t2 on t1.petid = t2.petid join student as t3 on t1.stuid = t3.stuid where t3.lname = 'Smith'	pets_1 
select count(*), stuid from has_pet group by stuid	pets_1 
select count(*), stuid from has_pet group by stuid	pets_1 
select t1.fname, t1.sex from student as t1 join has_pet as t2 on t1.stuid = t2.stuid group by t1.stuid having count(*) > 1	pets_1 
select t1.fname, t1.sex from student as t1 join has_pet as t2 on t1.stuid = t2.stuid group by t1.stuid having count(*) > 1	pets_1 
select t2.lname from has_pet as t1 join student as t2 on t1.stuid = t2.stuid join pets as t3 on t1.petid = t3.petid where t3.pettype = "cat" and t2.age = 3	pets_1 
select t2.lname from has_pet as t1 join student as t2 on t1.stuid = t2.stuid join pets as t3 on t1.petid = t3.petid where t3.pettype = "cat" and t2.age = 3	pets_1 
select avg(age) from student where stuid not in (select stuid from has_pet)	pets_1 
select avg(age) from student where stuid not in (select stuid from has_pet)	pets_1 
select count(*) from continents	car_1 
select count(*) from continents	car_1 
select count(*), t1.continent from continents as t1 join countries as t2 on t1.continent = t2.countryid group by t1.continent	car_1 
select t1.countryid, t1.countryname, count(*) from countries as t1 join continents as t2 on t1.countryid = t2.continent group by t1.countryid	car_1 
select count(*) from countries	car_1 
select count(*) from countries	car_1 
select t1.fullname, t1.id, count(*) from car_makers as t1 join model_list as t2 on t1.id = t2.maker	car_1 
select t1.fullname, t1.id, count(*) from car_makers as t1 join model_list as t2 on t1.id = t2.maker	car_1 
select t2.modelid, t1.horsepower from cars_data as t1 join model_list as t2 on t1.id = t2.modelid group by t2.modelid order by sum(t1.horsepower) asc limit 1	car_1 
select t1.modelid from model_list as t1 join cars_data as t2 on t1.modelid = t2.id order by t2.horsepower limit 1	car_1 
select t2.modelid from cars_data as t1 join model_list as t2 on t1.id = t2.modelid where t1.weight < (select avg(weight) from cars_data)	car_1 
select avg(weight) from cars_data where weight < (select avg(weight) from cars_data)	car_1 
select distinct t1.maker from car_makers as t1 join car_names as t2 on t1.id = t2.makeid where	car_1 
select distinct t1.maker from car_makers as t1 join cars_data as t2 on t1.id = 2 where t2.year = 1970	car_1 
select t1.make, max(t2.year) from car_names as t1 join cars_data as t2 on t1.makeid = 2 and t2.id = t2.id where t2.year = (select min(year) from cars_data)	car_1 
select t1.maker, t2.year from model_list as t1 join cars_data as t2 on t1.modelid = t2.id where t2.year = (select min(year) from cars_data)	car_1 
select distinct t2.make from cars_data as t1 join model_list as	car_1 
select distinct t2.model from cars_data as t1 join model_list as t2 on t1.id = t2.modelid where t1.year > 1980	car_1 
select t1.continent, count(*) from continents as t1 join car_makers as t2 on t1.continent = t2.continent	car_1 
select count(*), continent from continents group by continent	car_1 
select countryname from countries group by countryname order by count(*) desc limit 1	car_1 
select t1.countryname from countries as t1 join car_makers as t2 on t1.countryid = 2 group by t1.countryname order by count(*) desc limit 1	car_1 
select count(*), t1.fullname from car_makers as t1 join model_list as t2 on t1.id = t2.maker group by t1.maker	car_1 
select count(*), t1.id, t1.fullname from car_makers as t1 join model_list as t2 on t1.id = t2.maker group by t1.id	car_1 
select avg(t1.accelerate) from cars_data as t1 join model_list as t2 on t2.modelid = t1.id where t2.model = 'ac hornet sportabout (sw)'	car_1 
select avg(t1.accelerate) from cars_data as t1 join model_list as t2 on t1.model	car_1 
select count(*) from car_makers where country	car_1 
select count(distinct t1.maker) from car_makers as t1 join countries as t2 on t2.countryid = t2.countryid where t2.countryname = "france"	car_1 
select count(*) from countries where countryname = "usa"	car_1 
select count(*) from car_makers as t1 join model_list as t2 on t1.id = t2.modelid where t1.country	car_1 
select avg(mpg) from cars_data where cylinders = 4	car_1 
select avg(mpg) from cars_data where cylinders = 4	car_1 
select min(weight) from cars_data where cylinders = 8 and year = 1974	car_1 
select min(weight) from cars_data where cylinders = 8 and year = 1974	car_1 
select maker, model from model_list	car_1 
select maker, model from model_list	car_1 
select t1.countryname, t2.id from countries as t1 join car_makers as t2 on t1.countryid = t2.id group by t2.id having count(*) >= 1	car_1 
select distinct t1.countryname, t1.countryid from countries as t1 join car_makers as t2 on t1.countryid = t2.id group by t1.countryid having count(*) >= 1	car_1 
select count(*) from cars_data where horsepower > 150	car_1 
select count(*) from cars_data where horsepower > 150	car_1 
select avg(weight), year from cars_data group by year	car_1 
select avg(weight), year from cars_data group by year	car_1 
select t2.countryname from car_makers as t1 join countries as t2 on t1.country = t2.countryid group by t2.countryname having count(*) >= 3	car_1 
select t1.countryname from countries as t1 join car_makers as t2 on t1.countryid = 2 join car_makers as t3 on t1.countryid = t3.id group by t1.countryname having count(*) >= 3	car_1 
select mpg, t1.make from car_names as t1 join cars_data as t2 on t1.makeid = t2.make	car_1 
select mpg, t1.make from car_names as t1 join cars_data as t2 on t1.makeid = 2 where t2.cylinders = 3	car_1 
select t1.modelid from model_list as t1 join cars_data as t2 on t1.modelid = t2.id where t2.mpg = (select max(mpg) from cars_data)	car_1 
select mpg from cars_data order by mpg desc limit 1	car_1 
select avg(horsepower) from cars_data where year < 1980	car_1 
select avg(horsepower) from cars_data where year < 1980	car_1 
select avg(t2.edispl) from model_list as t1 join cars_data as t2 on t1.modelid = 2 where t1.model = "volunteer"	car_1 
select avg(edispl) from car_makers as t1 join cars_data as t2 on t1.id = t2.model	car_1 
select max (accelerate), t1.cylinders from cars_data as t1 join model_list as t2 on t1.id = t2.modelid group by t1.cylinders	car_1 
select max(accelerate), cylinders from cars_data group by cylinders	car_1 
select t1.make from car_names as t1 join model_list as t2 on t1.make = t2.modelid group by t1.make order by count(*) desc limit 1	car_1 
select modelid, count(distinct modelid) from model_list group by modelid order by count(distinct modelid) desc limit 1	car_1 
select count(*) from cars_data where cylinders > 4	car_1 
select count(*) from cars_data where cylinders > 4	car_1 
select count(*) from cars_data where year = 1980	car_1 
select count(*) from cars_data where year = 1980	car_1 
select count(*) from car_makers as t1 join model_list as t2 on t1.id = t2.modelid where t1.fullname = "American Motor Company"	car_1 
select count(*) from car_makers as t1 join model_list as t2 on t1.id = t2.modelid where t1.fullname = "American Motor Company"	car_1 
select t1.fullname, t1.id from car_makers as t1 join model_list as t2 on t1.id = t2.maker group by t1.id having count(*) > 3	car_1 
select t1.make, t1.id from	car_1 
select distinct t1.model from model_list as t1 join car_makers as t2 on t1.modelid = t2.id where t2.	car_1 
select distinct t1.model from model_list as t1 join cars_data as t2 on t1.modelid = t2.id where t1.maker = "General Motors" or t2.weight > 3500	car_1 
select year from cars_data where weight < 3000 intersect select year from cars_data where weight > 4000	car_1 
select distinct year from cars_data where weight < 4000 intersect select distinct year from cars_data where weight > 3000	car_1 
select horsepower from cars_data order by accelerate desc limit 1	car_1 
select horsepower from cars_data order by accelerate desc limit 1	car_1 
select max(t2.cylinders) from model_list as t1 join cars_data as t2 on t1.modelid = 2 where t1.model = "volunteer" group by t1.modelid order by sum(t2.accelerate) limit 1	car_1 
select max(t2.cylinders) from model_list as t1 join cars_data as t2 on t1.modelid = 2 where t1.model = "volunteer" group by t1.model order by sum(t2.accelerate) limit 1	car_1 
select count(*) from cars_data where accelerate > (select max(accelerate) from cars_data)	car_1 
select count(*) from cars_data where accelerate > (select max(accelerate) from cars_data)	car_1 
select count(*) from (select country from car_makers group by country having count(*) > 2)	car_1 
select count(*) from (select country from car_makers group by country having count(*) > 2)	car_1 
select count(*) from cars_data where cylinders > 6	car_1 
select count(*) from cars_data where cylinders > 6	car_1 
select t1.model	car_1 
select cylinders from cars_data where cylinders = 4 order by horsepower desc limit 1	car_1 
select t1.id, t2.make from cars_data as t1 join car_names as t2 on t1.id = t2.makeid where t1.horsepower > ( select min(horsepower) from cars_data )	car_1 
select id, t2.make from cars_data as t1 join car_names as t2 on t1.id = t2.makeid where t1.cylinders < 4	car_1 
select max(mpg) from cars_data where cylinders = 8 or year < 1980	car_1 
select max(mpg) from cars_data where cylinders = 8 or year < 1980	car_1 
select t2.model from car_makers as t1 join model_list as t2 on t1.id = t2.modelid join car_makers as t3 on t1.maker = t3.id where t1.fullname = 'Ford Motor Company' except select t2.model from car_makers as t1 join model_list as t2 on t1.id = t2.modelid join car_makers as t3 on t1.maker = t3.id where t1.fullname = 'Ford Motor Company'	car_1 
select distinct t2.model from car_makers as t1 join model_list as t2 on t1.id = t2.modelid where t1.fullname = "Ford Motor Co" except select distinct t2.model from car_makers as t1 join model_list as t2 on t1.id = t2.modelid where t1.fullname = "Ford Motor Co"	car_1 
select countryname from countries except select t1.countryname from countries as t1 join car_makers as t2 on t1.countryid = t2.country	car_1 
select countryname from countries except select t1.countryname from countries as t1 join car_makers as t2 on t1.countryid = t2.country	car_1 
select t1.id, t1.maker from car_makers as t1 join model_list as t2 on t1.id = t2.modelid group by t1.id having count(*) >= 2 intersect select t1.id, t1.maker from car_makers as t1 join model_list as t2 on t1.id = t2.modelid group by t1.id having count(*) > 3	car_1 
select t1.id, t1.maker, count(*) from car_makers as t1 join model_list as t2 on t1.id = t2.modelid group by t1.id having count(*) >= 2 intersect select t1.id, t1.maker from car_makers as t1 join model_list as t2 on t1.id = t2.modelid group by t1.id having count(*) > 3	car_1 
select t1.countryid, t1.countryname from countries as t1 join car_makers as t2 on t1.countryid = t2.id group by t1.countryid having count(*) > 3 union select t1.countryid, t1.countryname from countries as t1 join car_names as t2 on t1.countryid = t2.country	car_1 
select t1.countryid, t1.countryname from countries as t1 join car_makers as t2 on t1.countryid = t2.country where t2.maker = 'fiat' group by t1.countryid having count(*) > 3 union select t1.countryid, t1.countryname from countries as t1 join model_list as t2 on t1.countryid = t2.country	car_1 
select country from airlines where airline = "JetBlue Airways"	flight_2 
select country from airlines where abbreviation = "Japan"	flight_2 
select abbreviation from airlines where airline = "JetBlue Airways"	flight_2 
select abbreviation from airlines where airline = "Japan"	flight_2 
select airline, abbreviation from airlines where country = "USA"	flight_2 
select airline, abbreviation from airlines where country = "USA"	flight_2 
select airportcode, airportname from airports where city = " Anthony"	flight_2 
select airportcode, airportname from airports where city = " Anthony"	flight_2 
select count(*) from airlines	flight_2 
select count(*) from airlines	flight_2 
select count(*) from airports	flight_2 
select count(*) from airports	flight_2 
select count(*) from flights	flight_2 
select count(*) from flights	flight_2 
select airline from airlines where abbreviation = 'UAL'	flight_2 
select airline from airlines where abbreviation = 'UAL'	flight_2 
select count(*) from airlines where country = "USA"	flight_2 
select count(*) from airlines where country = "USA"	flight_2 
select city, country from airports where airportname = "Alton"	flight_2 
select city, country from airports where airportname = "Alton"	flight_2 
select airportname from airports where airportcode = 'AKO'	flight_2 
select airportname from airports where airportcode = 'AKO'	flight_2 
select airportname from airports where city = 'Aberdeen'	flight_2 
select airportname from airports where city = "Aberdeen"	flight_2 
select count(*) from flights where sourceairport = "APG"	flight_2 
select count(*) from flights where sourceairport = 'APG'	flight_2 
select count(*) from airports where airportcode = "ATO"	flight_2 
select count(*) from airports as t1 join flights as t2 on t1.city = t2.sourceairport where t1.airportcode = "ATO"	flight_2 
select count(*) from airports as t1 join flights as t2 on t1.city = t2.sourceairport where t1.city = "Aberdeen"	flight_2 
select count(*) from airports as t1 join flights as t2 on t1.city = t2.sourceairport where t1.city = "Aberdeen"	flight_2 
select count(*) from airports as t1 join flights as t2 on t1.airportcode = t2.sourceairport where t1.city = "Aberdeen"	flight_2 
select count(*) from airports as t1 join flights as t2 on t1.airportcode = t2.sourceairport where t1.city = "Aberdeen"	flight_2 
select count(*) from airports as t1 join flights as t2 on t1.city = t2.sourceairport where t1.city = 'Aberdeen' and t1.airportname = 'Ashley'	flight_2 
select count(*) from airports as t1 join flights as t2 on t1.city = t2.sourceairport where t1.city = "Aberdeen" and t1.airportname = "Ashley"	flight_2 
select count(*) from airlines as t1 join flights as t2 on t1.uid = t2.airline where t1.	flight_2 
select count(*) from airlines as t1 join flights as t2 on t1.uid = t2.airline where t1.	flight_2 
select count(*) from airlines as t1 join flights as t2 on t1.uid = t2.airline where t1.country = 'ASY'	flight_2 
select count(*) from airlines as t1 join airports as t2 on t1.uid = 2 join flights as t3 on t1.uid = t3.airline where t2.airportcode = "ASY"	flight_2 
select count(*) from airlines as t1 join flights as t2 on t1.uid = t2.airline where t1.country = 'AHD'	flight_2 
select count(*) from airlines as t1 join flights as t2 on t1.uid = t2.airline where t1.country = "AHD" and t2.airline = "United Airlines"	flight_2 
select sum(t2.flightno) from airlines as t1 join flights as t2 on t1.uid = t2.airline where t1.country = 'Aberdeen'	flight_2 
select sum(t2.flightno) from airlines as t1 join flights as t2 on t1.uid = t2.airline where t1.country = "Aberdeen"	flight_2 
select city from airports group by city order by count(*) desc limit 1	flight_2 
select city from airports group by city order by count(*) desc limit 1	flight_2 
select city from airports group by city order by count(*) desc limit 1	flight_2 
select city from airports group by city order by count(*) desc limit 1	flight_2 
select t1.airportcode from airports as t1 join flights as t2 on t1.city = t2.sourceairport group by t2.sourceairport order by count(*) desc limit 1	flight_2 
select t1.airportcode from airports as t1 join flights as t2 on t1.city = t2.sourceairport group by t2.sourceairport order by count(*) desc limit 1	flight_2 
select airportcode from airports group by airportcode order by count(*) limit 1	flight_2 
select t1.airportcode from airports as t1 join flights as t2 on t1.city = t2.sourceairport group by t2.sourceairport order by count(*) limit 1	flight_2 
select t1.airline from airlines as t1 join flights as t2 on t1.uid = t2.airline group by t1.uid order by count(*) desc limit 1	flight_2 
select t1.airline from airlines as t1 join flights as t2 on t1.uid = t2.airline group by t1.uid order by count(*) desc limit 1	flight_2 
select t1.abbreviation, t1.country from airlines as t1 join flights as t2 on t1.uid = t2.airline group by t1.uid order by count(*) limit 1	flight_2 
select t1.abbreviation, t1.country from airlines as t1 join flights as t2 on t1.uid = t2.airline group by t2.airline order by count(*) limit 1	flight_2 
select t1.airline from airlines as t1 join flights as t2 on t1.uid = t2.airline where t2.sourceairport = 'AHD'	flight_2 
select t1.airline from airlines as t1 join flights as t2 on t1.uid = t2.airline where t2.sourceairport = "AHD"	flight_2 
select t1.airline from airlines as t1 join flights as t2 on t1.uid = t2.airline where t2.sourceairport = 'AHD'	flight_2 
select t1.airline from airlines as t1 join flights as t2 on t1.uid = t2.airline where t2.sourceairport = "AHD"	flight_2 
select t1.airline from airlines as t1 join flights as t2 on t1.uid = t2.airline where t2.sourceairport = 'APG' intersect select t1.airline from airlines as t1 join flights as t2 on t1.uid = t2.airline where t2.sourceairport = 'CVO'	flight_2 
select t1.airline from airlines as t1 join flights as t2 on t1.uid = t2.airline where t2.sourceairport = "APG" intersect select t1.airline from airlines as t1 join flights as t2 on t1.uid = t2.airline where t2.sourceairport = "CVO"	flight_2 
select t1.airline from airlines as t1 join flights as t2 on t1.uid = t2.airline where t2.sourceairport = 'CVO' except select t1.airline from airlines as t1 join flights as t2 on t1.uid = t2.airline where t2.sourceairport = 'APG'	flight_2 
select t1.airline from airlines as t1 join flights as t2 on t1.uid = t2.airline where t1.country = "CVO" except select t1.airline from airlines as t1 join flights as t2 on t1.uid = t2.airline where t1.country = "APG"	flight_2 
select t1.airline from airlines as t1 join flights as t2 on t1.uid = t2.airline group by t1.uid having count(*) >= 10	flight_2 
select t1.airline from airlines as t1 join flights as t2 on t1.uid = t2.airline group by t1.uid having count(*) >= 10	flight_2 
select airline from flights group by airline having count(*) < 200	flight_2 
select airline from flights group by airline having count(*) < 200	flight_2 
select t2.flightno from airlines as t1 join flights as t2 on t1.uid = t2.airline where t1.airline = "United Airlines"	flight_2 
select t2.flightno from airlines as t1 join flights as t2 on t1.uid = t2.airline where t1.airline = "United Airlines"	flight_2 
select flightno from flights where sourceairport = "APG"	flight_2 
select flightno from flights where destairport = "APG"	flight_2 
select flightno from flights where sourceairport = "APG"	flight_2 
select flightno from flights where sourceairport = "APG"	flight_2 
select t2.flightno from airports as t1 join	flight_2 
select t2.flightno from airports as t1 join flights as t2 on t1.city = t2.sourceairport where t1.city = "Aberdeen"	flight_2 
select t2.flightno from airports as t1 join	flight_2 
select t3.flightno from airports as t1 join flights as t2 on t1.airportcode = t2.airport	flight_2 
select count(*), city from airports as t1 join flights as t2 on t1.city = t2.sourceairport where t1.city = "Adams" or t1.city = "Abilene"	flight_2 
select count(*) from airlines as t1 join flights as t2 on t1.uid = t2.airline where t1.country = "Aberdeen" or t1.country = "Abilene"	flight_2 
select airportname from airports where airportcode not in (select t1.airportname from airports as t1 join flights as t2 on t1.airportcode = 2 where t2.flightno = 0)	flight_2 
select airportname from airports except select t1.airportname from airports as t1 join flights as t2 on t1.airportcode = t2.airport	flight_2 
select count(*) from employee	employee_hire_evaluation 
select count(*) from employee	employee_hire_evaluation 
select name from employee order by age asc	employee_hire_evaluation 
select name from employee order by age asc	employee_hire_evaluation 
select city, count(*) from employee group by city	employee_hire_evaluation 
select city, count(*) from employee group by city	employee_hire_evaluation 
select city from employee where age < 30 group by city having count(*) > 1	employee_hire_evaluation 
select city from employee where age < 30 group by city having count(*) > 1	employee_hire_evaluation 
select location, count(*) from shop group by location	employee_hire_evaluation 
select location, count(*) from shop group by location	employee_hire_evaluation 
select manager_name, district from shop order by number_products desc limit 1	employee_hire_evaluation 
select manager_name, district from shop order by number_products desc limit 1	employee_hire_evaluation 
select min(number_products), max(number_products) from shop	employee_hire_evaluation 
select min(number_products), max(number_products) from shop	employee_hire_evaluation 
select name, location, district from shop order by number_products desc	employee_hire_evaluation 
select name, location, district from shop order by number_products desc	employee_hire_evaluation 
select name from shop where number_products > (select avg(number_products) from shop)	employee_hire_evaluation 
select name from shop where number_products > (select avg(number_products) from shop)	employee_hire_evaluation 
select t1.name from employee as t1 join evaluation as t2 on t1.employee_id = t2.employee_id group by t1.employee_id order by count(*) desc limit 1	employee_hire_evaluation 
select t1.name from employee as t1 join evaluation as t2 on t1.employee_id = t2.employee_id group by t1.employee_id order by count(*) desc limit 1	employee_hire_evaluation 
select t1.name from employee as t1 join evaluation as t2 on t1.employee_id = t2.employee_id order by t2.bonus desc limit 1	employee_hire_evaluation 
select t1.name from employee as t1 join evaluation as t2 on t1.employee_id = t2.employee_id order by t2.bonus desc limit 1	employee_hire_evaluation 
select name from employee where employee_id not in (select employee_id from evaluation)	employee_hire_evaluation 
select name from employee where employee_id not in (select employee_id from evaluation)	employee_hire_evaluation 
select t2.name from hiring as t1 join shop as t2 on t1.shop_id = t2.shop_id group by t1.shop_id order by count(*) desc limit 1	employee_hire_evaluation 
select t2.name from hiring as t1 join shop as t2 on t1.shop_id = t2.shop_id group by t1.shop_id order by count(*) desc limit 1	employee_hire_evaluation 
select name from shop where shop_id not in (select shop_id from hiring)	employee_hire_evaluation 
select name from shop where shop_id not in (select shop_id from hiring)	employee_hire_evaluation 
select t2.name, count(*) from hiring as t1 join shop as t2 on t1.shop_id = t2.shop_id group by t1.shop_id	employee_hire_evaluation 
select count(*), t3.name from employee as t1 join hiring as t2 on t1.employee_id = t2.employee_id join shop as t3 on t2.shop_id = t3.shop_id group by t3.name	employee_hire_evaluation 
select sum(bonus) from evaluation	employee_hire_evaluation 
select sum(bonus) from evaluation	employee_hire_evaluation 
select * from hiring	employee_hire_evaluation 
select * from hiring	employee_hire_evaluation 
select district from shop where number_products < 3000 intersect select district from shop where number_products > 10000	employee_hire_evaluation 
select district from shop where number_products < 3000 intersect select district from shop where number_products > 10000	employee_hire_evaluation 
select count(distinct location) from shop	employee_hire_evaluation 
select count(distinct location) from shop	employee_hire_evaluation 
select count(*) from documents	cre_Doc_Template_Mgt 
select count(*) from documents	cre_Doc_Template_Mgt 
select document_id, document_name, document_description from documents	cre_Doc_Template_Mgt 
select document_id, document_name, document_description from documents	cre_Doc_Template_Mgt 
select document_name, template_id from documents where document_description like '%w%'	cre_Doc_Template_Mgt 
select document_name, template_id from documents where document_description like '%w%'	cre_Doc_Template_Mgt 
select document_id, template_id, document_description from documents where document_name = "Robbin CV"	cre_Doc_Template_Mgt 
select document_id, template_id, document_description from documents where document_name = "Robbin CV"	cre_Doc_Template_Mgt 
select count(distinct template_id) from documents	cre_Doc_Template_Mgt 
select count(distinct template_id) from documents	cre_Doc_Template_Mgt 
select count(*) from documents as t1 join Templates as t2 on t1.Template_id = t2.Template_id where t2.template_type_code = 'PPT'	cre_Doc_Template_Mgt 
select count(*) from templates where template_type_code = "PPT"	cre_Doc_Template_Mgt 
select template_id, count(*) from documents group by template_id	cre_Doc_Template_Mgt 
select template_id, count(*) from documents group by template_id	cre_Doc_Template_Mgt 
select t1.template_id, t1.template_type_code from templates as t1 join documents as t2 on t1.template_id = t2.template_id group by t1.template_id order by count(*) desc limit 1	cre_Doc_Template_Mgt 
select t1.template_id, t1.template_type_code from templates as t1 join documents as t2 on t1.template_id = t2.template_id group by t1.template_id order by count(*) desc limit 1	cre_Doc_Template_Mgt 
select template_id from documents group by template_id having count(*) > 1	cre_Doc_Template_Mgt 
select template_id from documents group by template_id having count(*) > 1	cre_Doc_Template_Mgt 
select template_id from templates except select template_id from documents	cre_Doc_Template_Mgt 
select template_id from templates except select template_id from documents	cre_Doc_Template_Mgt 
select count(*) from templates	cre_Doc_Template_Mgt 
select count(*) from templates	cre_Doc_Template_Mgt 
select template_id, version_number, template_type_code from templates	cre_Doc_Template_Mgt 
select template_id, version_number, template_type_code from templates	cre_Doc_Template_Mgt 
select distinct template_type_code from templates	cre_Doc_Template_Mgt 
select distinct template_type_code from templates	cre_Doc_Template_Mgt 
select template_id from templates where template_type_code = 'PP' or template_type_code = 'PPT'	cre_Doc_Template_Mgt 
select template_id from templates where template_type_code = 'PP' or template_type_code = 'PPT'	cre_Doc_Template_Mgt 
select count(*) from templates where template_type_code = "CV"	cre_Doc_Template_Mgt 
select count(*) from templates where template_type_code = "CV"	cre_Doc_Template_Mgt 
select version_number, template_type_code from templates where version_number > 5	cre_Doc_Template_Mgt 
select version_number, template_type_code from templates where version_number > 5	cre_Doc_Template_Mgt 
select template_type_code, count(*) from templates group by template_type_code	cre_Doc_Template_Mgt 
select template_type_code, count(*) from templates group by template_type_code	cre_Doc_Template_Mgt 
select template_type_code from templates group by template_type_code order by count(*) desc limit 1	cre_Doc_Template_Mgt 
select template_type_code from templates group by template_type_code order by count(*) desc limit 1	cre_Doc_Template_Mgt 
select template_type_code from templates group by template_type_code having count(*) < 3	cre_Doc_Template_Mgt 
select template_type_code from templates group by template_type_code having count(*) < 3	cre_Doc_Template_Mgt 
select version_number, template_type_code from templates order by version_number asc limit 1	cre_Doc_Template_Mgt 
select version_number, template_type_code from templates order by version_number asc limit 1	cre_Doc_Template_Mgt 
select t1.template_type_code from templates as t1 join documents as t2 on t1.template_id = t2.template_id where t2.document_name = "Data base"	cre_Doc_Template_Mgt 
select t1.template_type_code from templates as t1 join documents as t2 on t1.template_id = t2.template_id where t2.document_name = "Data base"	cre_Doc_Template_Mgt 
select document_name from documents as t1 join Templates as t2 on t1.Template_id = t2.Template_id where t2.template_type_code = "BK"	cre_Doc_Template_Mgt 
select document_name from documents as t1 join Templates as t2 on t1.Template_id = t2.Template_id where t2.template_type_code = "BK"	cre_Doc_Template_Mgt 
select t1.template_type_code, count(*) from templates as t1 join documents as t2 on t1.template_id = t2.template_id group by t1.template_type_code	cre_Doc_Template_Mgt 
select t1.template_type_code, count(*) from templates as t1 join documents as t2 on t1.template_id = t2.template_id group by t1.template_type_code	cre_Doc_Template_Mgt 
select t1.template_type_code from templates as t1 join documents as t2 on t1.template_id = t2.template_id group by t1.template_type_code order by count(*) desc limit 1	cre_Doc_Template_Mgt 
select t1.template_type_code from templates as t1 join documents as t2 on t1.template_id = t2.template_id group by t1.template_type_code order by count(*) desc limit 1	cre_Doc_Template_Mgt 
select template_type_code from templates except select t1.template_type_code from templates as t1 join documents as t2 on t1.template_id = t2.template_id	cre_Doc_Template_Mgt 
select template_type_code from templates except select t1.template_type_code from templates as t1 join documents as t2 on t1.template_id = t2.template_id	cre_Doc_Template_Mgt 
select template_type_code, template_type_description from ref_template_types	cre_Doc_Template_Mgt 
select template_type_code, template_type_description from ref_template_types	cre_Doc_Template_Mgt 
select template_type_description from ref_template_types where template_type_code = "AD"	cre_Doc_Template_Mgt 
select template_type_description from ref_template_types where template_type_code = "AD"	cre_Doc_Template_Mgt 
select template_type_code from ref_template_types where template_type_description = "Book"	cre_Doc_Template_Mgt 
select template_type_code from ref_template_types where template_type_description = "Book"	cre_Doc_Template_Mgt 
select distinct t1.template_type_description from ref_template_types as t1 join documents as t2 on t1.template_type_code = t2.template_id	cre_Doc_Template_Mgt 
select distinct t1.template_type_description from ref_template_types as t1 join documents as t2 on t1.template_type_code = t2.template_id	cre_Doc_Template_Mgt 
select t1.template_id from templates as t1 join ref_template_types as t2 on t1.template_type_code = t2.template_type_code where t2.template_type_description = "Presentation"	cre_Doc_Template_Mgt 
select t1.template_id from templates as t1 join ref_template_types as t2 on t1.template_type_code = t2.template_type_code where t2.template_type_description = 'Presentation'	cre_Doc_Template_Mgt 
select count(*) from paragraphs	cre_Doc_Template_Mgt 
select count(*) from paragraphs	cre_Doc_Template_Mgt 
select count(*) from documents as t1 join paragraphs as t2 on t1.document_id = t2.document_id where t1.document_name = "Summer Show"	cre_Doc_Template_Mgt 
select count(*) from documents as t1 join paragraphs as t2 on t1.document_id = t2.document_id where t1.document_name = "Summer Show"	cre_Doc_Template_Mgt 
select other_details from paragraphs where paragraph_text = 'Korea'	cre_Doc_Template_Mgt 
select other_details from paragraphs where paragraph_text like '%korea%'	cre_Doc_Template_Mgt 
select t1.paragraph_id, t1.paragraph_text from paragraphs as t1 join documents as t2 on t1.document_id = t2.document_id where t2.document_name = "Welcome to NY"	cre_Doc_Template_Mgt 
select t1.paragraph_id, t1.paragraph_text from paragraphs as t1 join documents as t2 on t1.document_id = t2.document_id where t2.document_name = "Welcome to NY"	cre_Doc_Template_Mgt 
select t1.paragraph_text from paragraphs as t1 join documents as t2 on t1.document_id = t2.document_id where t2.document_name = "Customer reviews"	cre_Doc_Template_Mgt 
select t1.paragraph_text from paragraphs as t1 join documents as t2 on t1.document_id = t2.document_id where t2.document_name = "Customer reviews"	cre_Doc_Template_Mgt 
select document_id, count(*) from paragraphs group by document_id order by document_id	cre_Doc_Template_Mgt 
select document_id, count(*) from paragraphs group by document_id order by count(*)	cre_Doc_Template_Mgt 
select t1.document_id, t1.document_name, count(*) from documents as t1 join paragraphs as t2 on t1.document_id = t2.document_id group by t1.document_id	cre_Doc_Template_Mgt 
select t1.document_id, t1.document_name, count(*) from documents as t1 join paragraphs as t2 on t1.document_id = t2.document_id group by t1.document_id	cre_Doc_Template_Mgt 
select document_id from paragraphs group by document_id having count(*) >= 2	cre_Doc_Template_Mgt 
select document_id from paragraphs group by document_id having count(*) >= 2	cre_Doc_Template_Mgt 
select t1.document_id, t1.document_name from documents as t1 join paragraphs as t2 on t1.document_id = t2.document_id group by t1.document_id order by count(*) desc limit 1	cre_Doc_Template_Mgt 
select t1.document_id, t1.document_name from documents as t1 join paragraphs as t2 on t1.document_id = t2.document_id group by t1.document_id order by count(*) desc limit 1	cre_Doc_Template_Mgt 
select document_id from paragraphs group by document_id order by count(*) asc limit 1	cre_Doc_Template_Mgt 
select document_id from paragraphs group by document_id order by count(*) asc limit 1	cre_Doc_Template_Mgt 
select document_id from paragraphs group by document_id having count(*) between 1 and 2	cre_Doc_Template_Mgt 
select document_id from paragraphs group by document_id having count(*) between 1 and 2	cre_Doc_Template_Mgt 
select document_id from paragraphs where paragraph_text = 'Brazil' intersect select document_id from paragraphs where paragraph_text = 'Ireland'	cre_Doc_Template_Mgt 
select document_id from paragraphs where paragraph_text like '%brazil%' intersect select document_id from paragraphs where paragraph_text like '%ireland%'	cre_Doc_Template_Mgt 
select count(*) from teacher	course_teach 
select count(*) from teacher	course_teach 
select name from teacher order by age asc	course_teach 
select name from teacher order by age asc	course_teach 
select age, hometown from teacher	course_teach 
select age, hometown from teacher	course_teach 
select name from teacher where hometown!= 'Little Lever Urban District'	course_teach 
select name from teacher where hometown!= 'Little Lever Urban District'	course_teach 
select name from teacher where age = 32 or age = 33	course_teach 
select name from teacher where age = 32 or age = 33	course_teach 
select hometown from teacher order by age asc limit 1	course_teach 
select hometown from teacher order by age asc limit 1	course_teach 
select hometown, count(*) from teacher group by hometown	course_teach 
select hometown, count(*) from teacher group by hometown	course_teach 
select hometown from teacher group by hometown order by count(*) desc limit 1	course_teach 
select hometown from teacher group by hometown order by count(*) desc limit 1	course_teach 
select hometown from teacher group by hometown having count(*) >= 2	course_teach 
select hometown from teacher group by hometown having count(*) >= 2	course_teach 
select t2.name, t3.course from course_arrange as t1 join teacher as t2 on t1.teacher_id = t2.teacher_id join course as t3 on t1.course_id = t3.course_id	course_teach 
select t2.name, t3.course from course_arrange as t1 join teacher as t2 on t1.teacher_id = t2.teacher_id join course as t3 on t1.course_id = t3.course_id	course_teach 
select t2.name, t3.course from course_arrange as t1 join teacher as t2 on t1.teacher_id = t2.teacher_id join course as t3 on t1.course_id = t3.course_id order by t2.name	course_teach 
select t2.name, t3.course from course_arrange as t1 join teacher as t2 on t1.teacher_id = t2.teacher_id join course as t3 on t1.course_id = t3.course_id order by t2.name	course_teach 
select t2.name from course_arrange as t1 join teacher as t2 on t1.teacher_id = t2.teacher_id join course as t3 on t1.course_id = t3.course_id where t3.course = 'Math'	course_teach 
select t2.name from course_arrange as t1 join teacher as t2 on t1.teacher_id = t2.teacher_id join course as t3 on t1.course_id = t3.course_id where t3.course = 'Math'	course_teach 
select t2.name, count(*) from course_arrange as t1 join teacher as t2 on t1.teacher_id = t2.teacher_id group by t2.name	course_teach 
select t2.name, count(*) from course_arrange as t1 join teacher as t2 on t1.teacher_id = t2.teacher_id group by t2.name	course_teach 
select t2.name from course_arrange as t1 join teacher as t2 on t1.teacher_id = t2.teacher_id group by t2.name having count(*) >= 2	course_teach 
select t2.name from course_arrange as t1 join teacher as t2 on t1.teacher_id = t2.teacher_id group by t2.name having count(*) >= 2	course_teach 
select name from teacher where teacher_id not in (select teacher_id from course_arrange)	course_teach 
select name from teacher where teacher_id not in (select teacher_id from course_arrange)	course_teach 
select count(*) from visitor where age < 30	museum_visit 
select name from visitor where level_of_membership > 4 order by level_of_membership	museum_visit 
select avg(age) from visitor where level_of_membership!= 4	museum_visit 
select name, level_of_membership from visitor where level_of_membership > 4 order by age	museum_visit 
select t1.museum_id, t1.name from museum as t1 join visit as t2 on t1.museum_id = t2.museum_id group by t1.museum_id order by num_of_staff desc limit 1	museum_visit 
select avg(num_of_staff) from museum where open_year < 2009	museum_visit 
select open_year, num_of_staff from museum where name = 'Palom Museum'	museum_visit 
select name from museum where num_of_staff > (select min(num_of_staff) from museum where open_year > 2010)	museum_visit 
select t1.id, t1.name, t1.age from visitor as t1 join visit as t2 on t1.id = 2 group by t1.id having count(*) > 1	museum_visit 
select t2.id, t2.name, t2.level_of_membership from visit as t1 join visitor as t2 on t1.visitor_id = t2.id group by t1.visitor_id order by sum(t1.total_spent) desc limit 1	museum_visit 
select t1.id, t1.name, t2.museum_id from visit as t2 join museum as t3 on t1.museum_id = t3.museum_id	museum_visit 
select name from museum where museum_id not in (select museum_id from visit)	museum_visit 
select t2.name, t2.age from visit as t1 join visitor as t2 on t1.visitor_id = t2.id group by t1.visitor_id order by sum(t1.num_of_ticket) desc limit 1	museum_visit 
select avg(num_of_ticket), max(num_of_ticket) from visit	museum_visit 
select sum(num_of_ticket) from visit as t1 join visitor as t2 on t1.visitor_id = t2.id where t2.level_of_membership = 1	museum_visit 
select t3.name from visit as t1 join museum as t2 on t1.museum_id = t2.museum_id join visitor as t3 on t1.visitor_id = t3.id where t2.open_year < 2009 intersect select t3.name from visit as t1 join museum as t2 on t1.museum_id = t2.museum_id join visitor as t3 on t1.visitor_id = t3.id where t2.open_year > 2011	museum_visit 
select count(*), t1.id from visitor as t1 join visit as t2 on t1.id = 2 join museum as t3 on t2.museum_id = t3.museum_id where t3.open_year > 2010 group by t1.id	museum_visit 
select count(*) from museum where open_year > 2013 or open_year < 2008	museum_visit 
select count(*) from players	wta_1 
select count(*) from players	wta_1 
select count(*) from matches	wta_1 
select count(*) from matches	wta_1 
select first_name, birth_date from players where country_code = 'USA'	wta_1 
select first_name, birth_date from players where country_code = 'USA'	wta_1 
select avg(loser_age), avg(winner_age) from matches	wta_1 
select avg(loser_age), avg(winner_age) from matches	wta_1 
select avg(winner_rank_points) from matches	wta_1 
select avg(winner_rank_points) from matches	wta_1 
select max(loser_rank_points) from matches	wta_1 
select loser_rank_points from matches group by loser_rank_points order by count(*) desc limit 1	wta_1 
select count(distinct country_code) from players	wta_1 
select count(distinct country_code) from players	wta_1 
select count(distinct loser_name) from	wta_1 
select count(distinct loser_name) from matches	wta_1 
select tourney_name from matches group by tourney_name having count(*) > 10	wta_1 
select tourney_name from matches group by tourney_name having count(*) > 10	wta_1 
select winner_name from players as t1 join matches as t2 on t1.player_id = t2.winner_id where t2.year = 2013 intersect select winner_name from players as t1 join matches as t2 on t1.player_id = t2.winner_id where t2.year = 2016	wta_1 
select t1.first_name, t1.last_name from players as t1 join matches as t2 on t1.player_id = t2.winner_id where t2.year = 2013 intersect select t1.first_name, t1.last_name from players as t1 join matches as t2 on t1.player_id = t2.winner_id where t2.year = 2016	wta_1 
select count(*) from matches where year = 2013 or year = 2016	wta_1 
select count(*) from matches where year = 2013 or year = 2016	wta_1 
select t1.country_code, t1.first_name from players as t1 join matches as t2 on t1.player_id = t2.winner_id where t2.tourney_name = "WTA Championships" intersect select t1.country_code, t1.first_name from players as t1 join matches as t2 on t1.player_id = t2.winner_id where t2.tourney_name = "Australian Open"	wta_1 
select t1.first_name, t1.country_code from players as t1 join matches as t2 on t1.player_id = t2.winner_id where t2.tourney_name = "WTA Championships" intersect select t1.first_name, t1.country_code from players as t1 join matches as t2 on t1.player_id = t2.winner_id where t2.tourney_name = "Australian Open"	wta_1 
select first_name, country_code from players order by birth_date desc limit 1	wta_1 
select first_name, country_code from players order by birth_date desc limit 1	wta_1 
select first_name, last_name from players order by birth_date	wta_1 
select first_name, last_name from players order by birth_date	wta_1 
select first_name, last_name from players where hand = "left" order by birth_date	wta_1 
select first_name, last_name from players where hand = "left" order by birth_date	wta_1 
select t1.first_name, t1.country_code from players as t1 join rankings as t2 on t1.player_id = t2.player_id group by t2.player_id order by count(*) desc limit 1	wta_1 
select t1.first_name, t1.country_code from players as t1 join rankings as t2 on t1.player_id = t2.player_id group by t2.player_id order by count(*) desc limit 1	wta_1 
select year from matches group by year order by count(*) desc limit 1	wta_1 
select year from matches group by year order by count(*) desc limit 1	wta_1 
select t1.winner_name, t1.winner_rank_point	wta_1 
select t1.winner_name, t1.winner_rank_points	wta_1 
select t2.winner_name from rankings as t1 join	wta_1 
select t2.winner_name from	wta_1 
select t1.loser_name, t2.winner_name from matches as t1 join players on t1.loser_id = t2.player_id join matches as t3 on t1.winner_id = t3.winner_id	wta_1 
select t2.winner_name, t2.loser_name from matches as t1 join players on t1.winner_id = t2.player_id join matches as t3 on t1.winner_id = t3.winner_id	wta_1 
select avg(t1.ranking_date), t2.first_name from rankings as t1 join players as t2 on t1.player_id = t2.player_id group by t2.player_id	wta_1 
select t1.first_name, avg(t2.ranking_points) from players as t1 join rankings as t2 on t1.player_id = t2.player_id group by t2.player_id	wta_1 
select sum(t1.ranking_points), t2.first_name from rankings as t1 join players as t2 on t1.player_id = t2.player_id group by t2.player_id	wta_1 
select t1.first_name, sum(t2.ranking_points) from players as t1 join rankings as t2 on t1.player_id = t2.player_id group by t1.player_id	wta_1 
select country_code, count(*) from players group by country_code	wta_1 
select country_code, count(*) from players group by country_code	wta_1 
select country_code from players group by country_code order by count(*) desc limit 1	wta_1 
select country_code from players group by country_code order by count(*) desc limit 1	wta_1 
select country_code from players group by country_code having count(*) > 50	wta_1 
select country_code from players group by country_code having count(*) > 50	wta_1 
select ranking_date, count(*) from rankings group by ranking_date	wta_1 
select ranking_date, count(*) from rankings group by ranking_date	wta_1 
select count(*), year from matches group by year	wta_1 
select year, count(*) from matches group by year	wta_1 
select t1.winner_name, t1.winner_rank	wta_1 
select t1.first_name, t1.last_name, t2.winner_rank from players as t1 join matches as t2 on t1.player_id = t2.winner_id order by t1.birth_date limit 3	wta_1 
select count(distinct winner_entry) from matches where tourney_name = "WTA Championships" intersect select count(distinct winner_entry) from matches where tourney_name = "WTA Championships"	wta_1 
select count(*) from players as t1 join matches as t2 on t1.player_id = t2.winner_id where t2.tourney_name = "WTA Championships" group by t1.player_id	wta_1 
select t1.first_name, t1.country_code, t1.birth_date from players as t1 join rankings as t2 on t1.player_id = t2.winner_id	wta_1 
select t1.first_name, t1.country_code, t1.birth_date from players as t1 join rankings as t2 on t1.player_id = t2.player_id group by t1.player_id order by count(*) desc limit 1	wta_1 
select hand, count(*) from players group by hand	wta_1 
select hand, count(*) from players group by hand	wta_1 
select count(*) from ship where disposition_of_ship = 'Captured'	battle_death 
select name, tonnage from ship order by name desc	battle_death 
select name, date, result from battle	battle_death 
select max(killed), min(killed) from death group by max(killed)	battle_death 
select avg(injured), count(*) from death group by injured	battle_death 
select killed, injured from death where tonnage!= t1.tonnage - t1.	battle_death 
select name, result from battle where bulgarian_commander!= 'Boril'	battle_death 
select distinct t1.id, t1.name from battle as t1 join ship as t2 on t1.id = t2.lost_in_battle where t2.ship_type = 'Brig'	battle_death 
select t1.id, t1.name from battle as t1 join death as t2 on t1.id = 2 group by t1.id having sum(t2.killed) > 10	battle_death 
select t1.id, t1.name, sum(t2.injured) from ship as t1 join death as t2 on t1.id = t2.injured group by t1.id order by sum(t2.injured) desc limit 1	battle_death 
select distinct name from battle where bulgarian_commander = 'Kaloyan' intersect select distinct name from battle where latin_commander = 'Baldwin I'	battle_death 
select count(distinct result) from battle	battle_death 
select count(*) from battle where id not in ( select id from ship where tonnage = 225 )	battle_death 
select t1.name, t1.date from battle as t1 join ship as t2 on t1.id = t2.lost_in_battle where t2.name = 'Lettice' intersect select t1.name, t1.date from battle as t1 join ship as t2 on t1.id = t2.lost_in_battle where t2.name = 'HMS Atalanta'	battle_death 
select name, result, bulgarian_commander from battle where id not in (select id from ship where location = 'English Channel')	battle_death 
select note from death where note like '%east%'	battle_death 
select line_1 from addresses where line_1 >= "1" and line_2 <= "2"	student_transcripts_tracking 
select line_1, line_2 from addresses	student_transcripts_tracking 
select count(*) from courses	student_transcripts_tracking 
select count(*) from courses	student_transcripts_tracking 
select course_description from courses where course_name = "math"	student_transcripts_tracking 
select course_description from courses where course_name = "math"	student_transcripts_tracking 
select zip_postcode from addresses where city = "Port Chelsea"	student_transcripts_tracking 
select zip_postcode from addresses where city = "Port Chelsea"	student_transcripts_tracking 
select t1.department_name, t1.department_id from departments as t1 join degree_programs as t2 on t1.department_id = t2.department_id group by t1.department_id order by count(*) desc limit 1	student_transcripts_tracking 
select t1.department_name, t1.department_id from departments as t1 join degree_programs as t2 on t1.department_id = t2.department_id group by t1.department_id order by count(*) desc limit 1	student_transcripts_tracking 
select count(distinct department_id) from degree_programs	student_transcripts_tracking 
select count(distinct department_id) from degree_programs	student_transcripts_tracking 
select count(distinct	student_transcripts_tracking 
select count(distinct degree_program_id) from degree_programs	student_transcripts_tracking 
select count(*) from departments as t1 join degree_programs as t2 on t1.department_id = t2.department_id where t1.department_name = "engineering"	student_transcripts_tracking 
select count(*) from departments as t1 join degree_programs as t2 on t1.department_id = t2.department_id where t1.department_name = "engineering"	student_transcripts_tracking 
select section_name, section_description from sections	student_transcripts_tracking 
select section_name, section_description from sections	student_transcripts_tracking 
select t1.course_name, t1.course_id from courses as t1 join sections as t2 on t1.course_id = t2.course_id group by t1.course_id having count(*) <= 2	student_transcripts_tracking 
select t1.course_name, t1.course_id from courses as t1 join sections as t2 on t1.course_id = t2.course_id group by t1.course_id having count(*) < 2	student_transcripts_tracking 
select section_name from sections order by section_name desc	student_transcripts_tracking 
select section_name from sections order by section_name	student_transcripts_tracking 
select t1.semester_name, t1.semester_id from semesters as t1 join student_enrolment as t2 on t1.semester_id = t2.semester_id group by t1.semester_id order by count(*) desc limit 1	student_transcripts_tracking 
select t1.ssn, t1.ssn, t1.ssn from students as t1 join student_enrolment as t2 on t1.student_id = t2.student_id group by t1.ssn order by count(*) desc limit 1	student_transcripts_tracking 
select department_description from departments where department_name like '%computer%'	student_transcripts_tracking 
select department_description from departments where department_name like '%computer%'	student_transcripts_tracking 
select t1.first_name, t1.middle_name, t1.last_name, t2.student_enrolment_id from students as t1 join student_enrolment as t2 on t1.student_id = t2.student_id where t2.degree_program_id = 2 intersect select t1.first_name, t1.middle_name, t2.student_enrolment_id from students as t1 join student_enrolment as t2 on t1.student_id = t2.student_id where t2.degree_program_id = 3	student_transcripts_tracking 
select t1.first_name, t1.middle_name, t1.student_id from students as t1 join student_enrolment as t2 on t1.student_id = t2.student_id group by t1.student_id having count(*) = 2	student_transcripts_tracking 
select t2.first_name, t2.middle_name, t2.last_name from student_enrolment as t1 join students as t2 on t1.student_enrolment_id = t2.student_id join degree_programs as t3 on t1.degree_program_id = t3.degree_program_id where t3.degree_summary_name = "Bachelor"	student_transcripts_tracking 
select t2.first_name, t2.middle_name, t2.last_name from student_enrolment as t1 join students as t2 on t1.student_enrolment_id = t2.student_id where t1.degree_program_id = 'Bachelor'	student_transcripts_tracking 
select t1.degree_program_id from student_enrolment as t1 join student_enrolment_courses as t2 on t1.student_enrolment_id = t2.student_enrolment_id group by t1.degree_program_id order by count(*) desc limit 1	student_transcripts_tracking 
select t3.degree_summary_name from students as t1 join student_enrolment as t2 on t1.student_id = t2.student_id join	student_transcripts_tracking 
select t1.student_enrolment_id, t2.course_id from student_enrolment as t1 join student_enrolment_courses as t2 on t1.student_enrolment_id = t2.student_enrolment_id group by t1.student_enrolment_id order by count(*) desc limit 1	student_transcripts_tracking 
select t1.degree_program_id, t2.degree_summary_description from student_enrolment as t1 join degree_programs as t2 on t1.degree_program_id = t2.degree_program_id group by t1.degree_program_id order by count(*) desc limit 1	student_transcripts_tracking 
select t1.student_id, t1.first_name, t1.last_name, count(*) from students as t1 join student_enrolment as t2 on t1.student_id = t2.student_id group by t1.student_id order by count(*) desc limit 1	student_transcripts_tracking 
select t1.first_name, t1.middle_name, t1.student_id, count(*) from students as t1 join student_enrolment as t2 on t1.student_id = t2.student_id group by t1.student_id order by count(*) desc limit 1	student_transcripts_tracking 
select semester_name from semesters where semester_id not in (select semester_id from student_enrolment)	student_transcripts_tracking 
select semester_name from semesters where semester_id not in (select semester_id from student_enrolment)	student_transcripts_tracking 
select distinct t1.course_name from courses as t1 join student_enrolment_courses as t2 on t1.course_id = t2.course_id	student_transcripts_tracking 
select distinct t1.course_name from courses as t1 join student_enrolment_courses as t2 on t1.course_id = t2.course_id	student_transcripts_tracking 
select t1.course_name from courses as t1 join student_enrolment_courses as t2 on t1.course_id = t2.course_id where t2.student_enrolment_id = (select max(student_enrolment_id) from student_enrolment_courses)	student_transcripts_tracking 
select t1.course_name from courses as t1 join student_enrolment_courses as t2 on t1.course_id = t2.course_id join students as t3 on t2.student_course_id = t3.student_id where t3.student_id in (select t4.student_id from student_enrolment as t4 join student_enrolment_courses as t5 on t1.course_id = t5.student_course_id where t4.student_id in (select t4.student_id from student_enrolment as t5 join student_enrolment_courses as t6 on t4.student_id = t5.student_id where t4.student_id in (select t4.student_id from student_enrolment_courses as t5 join student_enrolment_courses as t8 on t5.course_id = t4.student_id where t4.student_id in (select t4.student_id from student_enrolment_courses as t5 join student_enrolment_courses as t8 on t5.course_id = t5.course_id where t4.student_id in (select t4.student_id from student_enrolment_courses as t5 join student_enrolment_courses as t8 on t5.course_id = t5.course_id where t4.student_id in (select t4.student_id from student_enrolment_courses where t4.student_id in (select t4.student_id from student_enrolment_courses where t4.student_id in (select t4.student_id from student_enrolment_courses where t4.student_id in (select t4.student_i	student_transcripts_tracking 
select last_name from students where state_province_county = "North Carolina"	student_transcripts_tracking 
select last_name from students where state_province_county = "North Carolina"	student_transcripts_tracking 
select t1.transcript_date, t1.transcript_id from transcripts as t1 join transcript_contents as t2 on t1.transcript_id = t2.transcript_id group by t1.transcript_id having count(*) >= 2	student_transcripts_tracking 
select t1.transcript_date, t1.transcript_id from transcripts as t1 join transcript_contents as t2 on t1.transcript_id = t2.transcript_id group by t1.transcript_id having count(*) >= 2	student_transcripts_tracking 
select cell_mobile_number from students where first_name = "Timmothy" and last_name = "Ward"	student_transcripts_tracking 
select cell_mobile_number from students where first_name = "Timmothy" and last_name = "Ward"	student_transcripts_tracking 
select first_name, middle_name, last_name from students order by date_first_registered limit 1	student_transcripts_tracking 
select first_name, middle_name, last_name from students order by date_first_registered limit 1	student_transcripts_tracking 
select first_name, middle_name, last_name from students order by date_first_registered limit 1	student_transcripts_tracking 
select first_name, middle_name, last_name from students order by date_first_registered limit 1	student_transcripts_tracking 
select first_name from students where current_address_id not in (select permanent_address_id from students)	student_transcripts_tracking 
select first_name from students where permanent_address_id!= "null"	student_transcripts_tracking 
select t1.address_id, t1.line_1, t1.line_2 from addresses as t1 join students as t2 on t1.address_id = t2.current_address_id group by t1.address_id order by count(*) desc limit 1	student_transcripts_tracking 
select address_id, line_1, line_2 from addresses group by address_id order by count(*) desc limit 1	student_transcripts_tracking 
select avg(transcript_date) from transcripts	student_transcripts_tracking 
select avg(transcript_date) from transcripts	student_transcripts_tracking 
select t1.transcript_date, t1.other_details from transcripts as t1 join transcript_contents as t2 on t1.transcript_id = t2.transcript_id order by t1.transcript_date asc limit 1	student_transcripts_tracking 
select transcript_date, other_details from transcripts order by transcript_date asc limit 1	student_transcripts_tracking 
select count(*) from transcripts	student_transcripts_tracking 
select count(*) from transcripts	student_transcripts_tracking 
select max(transcript_date) from transcripts	student_transcripts_tracking 
select max(transcript_date) from transcripts	student_transcripts_tracking 
select t1.student_enrolment_id, count(*) from student_enrolment as t1 join transcript_contents as t2 on t1.student_enrolment_id = t2.student_course_id group by t1.student_enrolment_id	student_transcripts_tracking 
select max(t1.course_id), count(*) from courses as t1 join transcript_contents as t2 on t1.course_id = 2 group by t1.course_id	student_transcripts_tracking 
select t1.transcript_date, t1.transcript_id from transcripts as t1 join transcript_contents as t2 on t1.transcript_id = t2.transcript_id group by t1.transcript_id order by count(*) asc limit 1	student_transcripts_tracking 
select t1.transcript_date, t1.transcript_id from transcripts as t1 join transcript_contents as t2 on t1.transcript_id = t2.transcript_id group by t1.transcript_id order by count(*) asc limit 1	student_transcripts_tracking 
select t1.semester_id from semesters as t1 join student_enrolment as t2 on t1.semester_id = t2.student_enrolment_id where t2.degree_sum	student_transcripts_tracking 
select t1.semester_id from semesters as t1 join student_enrolment as t2 on t1.semester_id = t2.semester_id where t2.degree_program_id = 'MA' intersect select t1.semester_id from semesters as t1 join student_enrolment as t2 on t1.semester_id = t2.semester_id where t2.degree_program_id = 'Bachelor'	student_transcripts_tracking 
select count(distinct current_address_id) from students	student_transcripts_tracking 
select distinct t1.address_id from addresses as t1 join students as t2 on t1.address_id = t2.student_id where t2.first_name = "James" and t2.last_name = "France"	student_transcripts_tracking 
select other_student_details from students order by other_student_details	student_transcripts_tracking 
select other_student_details from students order by other_student_details	student_transcripts_tracking 
select section_name from sections	student_transcripts_tracking 
select section_description from sections where section_name = "h"	student_transcripts_tracking 
select first_name from students where	student_transcripts_tracking 
select first_name from students where	student_transcripts_tracking 
select title from cartoon order by title	tvshow 
select title from cartoon order by title	tvshow 
select title from cartoon where directed_by = "Ben Jones"	tvshow 
select title from cartoon where directed_by = 'Ben Jones'	tvshow 
select count(*) from cartoon where written_by = "Joseph Kuhr"	tvshow 
select count(*) from cartoon where written_by = "James Kuhr"	tvshow 
select title, directed_by from cartoon order by original_air_date	tvshow 
select title, directed_by from cartoon order by original_air_date	tvshow 
select title from cartoon where directed_by = "Ben Jones" or directed_by = "Brandon Vietti"	tvshow 
select title from cartoon where directed_by = "Ben Jones" or directed_by = "Ben Vietti"	tvshow 
select country, count(*) from tv_channel group by country order by count(*) desc limit 1	tvshow 
select country, count(*) from tv_channel group by country order by count(*) desc limit 1	tvshow 
select count(distinct series_name), count(distinct content) from tv_channel	tvshow 
select count(distinct t2.series_name), t1.content from tv_channel as t1 join	tvshow 
select content from tv_channel where series_name = "Sky Radio"	tvshow 
select content from tv_channel where series_name = "Sky Radio"	tvshow 
select package_option from tv_channel where series_name = "Sky Radio"	tvshow 
select package_option from tv_channel where series_name = "Sky Radio"	tvshow 
select count(*) from tv_channel where language = "English"	tvshow 
select count(*) from tv_channel where language = "English"	tvshow 
select language, count(*) from tv_channel group by language order by count(*) asc limit 1	tvshow 
select language, count(*) from tv_channel group by language order by count(*) asc limit 1	tvshow 
select language, count(*) from tv_channel group by language	tvshow 
select language, count(*) from tv_channel group by language	tvshow 
select t2.series_name from cartoon as t1 join tv_channel as t2 on t1.id = t2.channel	tvshow 
select t2.series_name from cartoon as t1 join tv_channel as t2 on t1.	tvshow 
select t1.title from cartoon as t1 join tv_channel as t2 on t1.id = t2.t	tvshow 
select t2.title from tv_channel as t1 join cartoon as t2 on t1.id = t2.channel	tvshow 
select episode from tv_series order by rating	tvshow 
select episode from tv_series order by rating	tvshow 
select episode, rating from tv_series order by rating desc limit 3	tvshow 
select episode, rating from tv_series order by rating desc limit 3	tvshow 
select min(share), max(share) from tv_series	tvshow 
select max(share), min(share) from tv_series	tvshow 
select air_date from tv_series where episode = "A Love of a Lifetime"	tvshow 
select air_date from tv_series where episode = "A Love of a Lifetime"	tvshow 
select weekly_rank from tv_series where episode = "A Love of a Lifetime"	tvshow 
select weekly_rank from tv_series where episode = "A Love of a Lifetime"	tvshow 
select t2.series_name from tv_series as t1 join tv_channel as t2 on t1.channel = t2.id where t1.episode = "A Love of a Lifetime"	tvshow 
select t1.series_name from tv_channel as t1 join tv_series as t2 on t1.id = t2.id where t2.episode = "A Love of a Lifetime"	tvshow 
select t3.episode from tv_channel as t1 join	tvshow 
select t1.episode from tv_series as t1 join tv_channel as t2 on t1.id = t2.id where t2.series_name = "Sky Radio"	tvshow 
select directed_by, count(*) from cartoon group by directed_by	tvshow 
select directed_by, count(*) from cartoon group by directed_by	tvshow 
select production_code, channel	tvshow 
select production_code, channel	tvshow 
select t2.package_option, t2.series_name from tv_channel as t1 join tv_channel as t2 on t1.id = 2 where t1.hight_definition_tv = (select max(hight_definition_tv) from tv_channel)	tvshow 
select t1.package_option, t2.series_name from tv_channel as t1 join tv_channel as t2 on t1.id = 2 where t1.hight_definition_tv = (select hight_definition_tv from tv_channel where hight_definition_tv = 'Hight_definition_tv')	tvshow 
select t2.country from cartoon as t1 join tv_channel as t2 on t1.id = t2.channel	tvshow 
select t1.country from tv_channel as t1 join cartoon as t2 on t1.id = t2.directed_by where t2.written_by = "Tucky Casey"	tvshow 
select country from tv_channel except select t1.country from tv_channel as t1 join cartoon as t2 on t1.id = t2.channel	tvshow 
select country from tv_channel except select t1.country from tv_channel as t1 join cartoon as t2 on t1.id = t2.directed_by where t2.written_by = "Tucky Casey"	tvshow 
select t2.series_name, t2.country from cartoon as t1 join tv_channel as t2 on t1.	tvshow 
select t2.series_name, t2.country from tv_series as t1 join tv_channel as t2 on t1.	tvshow 
select pixel_aspect_ratio_par, country from tv_channel where language!= 'English'	tvshow 
select pixel_aspect_ratio_par, country from tv_channel where language!= 'English'	tvshow 
select id from tv_channel group by id having count(*) > 2	tvshow 
select id from tv_channel group by id having count(*) > 2	tvshow 
select id from tv_channel except select t1.id from tv_channel as t1 join cartoon as t2 on t1.	tvshow 
select id from tv_channel except select id from cartoon where directed_by = "Ben Jones"	tvshow 
select package_option from tv_channel except select t1.package_option from tv_channel as t1 join cartoon as t2 on t1.id = t2.channel	tvshow 
select package_option from tv_channel except select t2.package_option from tv_series as t1 join tv_channel as t2 on t1.id = 2 join cartoon as t3 on t1.id = t3.id where t3.directed_by = "Ben Jones"	tvshow 
select count(*) from poker_player	poker_player 
select count(*) from poker_player	poker_player 
select earnings from poker_player order by earnings desc	poker_player 
select earnings from poker_player order by earnings desc	poker_player 
select final_table_made, best_finish from poker_player	poker_player 
select final_table_made, best_finish from poker_player	poker_player 
select avg(e	poker_player 
select avg(e	poker_player 
select money_rank from poker_player order by earnings desc limit 1	poker_player 
select money_rank from poker_player order by earnings desc limit 1	poker_player 
select max(final_table_made) from poker_player where earnings < 200000	poker_player 
select max(final_table_made) from poker_player where earnings < 200000	poker_player 
select t2.name from poker_player as t1 join people as t2 on t1.people_id = t2.people_id	poker_player 
select t2.name from poker_player as t1 join people as t2 on t1.people_id = t2.people_id	poker_player 
select t2.name from poker_player as t1 join people as t2 on t1.people_id = t2.people_id where t1.e	poker_player 
select t2.name from poker_player as t1 join people as t2 on t1.people_id = t2.people_id where t1.e	poker_player 
select t2.name from poker_player as t1 join people as t2 on t1.people_id = t2.people_id order by t1.final_table_made asc	poker_player 
select t2.name from poker_player as t1 join people as t2 on t1.people_id = t2.people_id group by t2.name order by count(*) asc	poker_player 
select t2.birth_date from poker_player as t1 join people as t2 on t1.people_id = t2.people_id order by money_rank asc limit 1	poker_player 
select t2.birth_date from poker_player as t1 join people as t2 on t1.people_id = t2.people_id order by t1.e	poker_player 
select t1.money_rank from poker_player as t1 join people as t2 on t1.people_id = t2.people_id order by t2.height desc limit 1	poker_player 
select t1.money_rank from poker_player as t1 join people as t2 on t1.people_id = t2.people_id order by t2.height desc limit 1	poker_player 
select avg(t1.e	poker_player 
select avg(t2.e	poker_player 
select t2.name from poker_player as t1 join people as t2 on t1.people_id = t2.people_id order by t1.e	poker_player 
select t2.name from poker_player as t1 join people as t2 on t1.people_id = t2.people_id order by money_rank desc	poker_player 
select nationality, count(*) from people group by nationality	poker_player 
select nationality, count(*) from people group by nationality	poker_player 
select nationality from people group by nationality order by count(*) desc limit 1	poker_player 
select nationality from people group by nationality order by count(*) desc limit 1	poker_player 
select nationality from people group by nationality having count(*) >= 2	poker_player 
select nationality from people group by nationality having count(*) >= 2	poker_player 
select name, birth_date from people order by name asc	poker_player 
select name, birth_date from people order by name asc	poker_player 
select name from people where nationality!= "Russia"	poker_player 
select name from people where nationality!= 'Russia'	poker_player 
select name from people where people_id not in (select people_id from poker_player)	poker_player 
select name from people where people_id not in (select people_id from poker_player)	poker_player 
select count(distinct nationality) from people	poker_player 
select count(distinct nationality) from people	poker_player 
select count(*) from area_code_state	voter_1 
select contestant_number, contestant_name from contestants order by contestant_name desc	voter_1 
select vote_id, phone_number, state	voter_1 
select max(area_code), min(area_code) from area_code_state	voter_1 
select created from votes where state = 'CA'	voter_1 
select contestant_name from contestants where contestant_name!= 'Jessie Alloway'	voter_1 
select distinct t1.state, t1.created from votes as t1 join votes as t2 on t1.vote_id = t2.vote_id	voter_1 
select t2.contestant_number, t2.contestant_name from votes as t1 join contestants as t2 on t1.contestant_number = t2.contestant_number group by t1.contestant_number having count(*) >= 2	voter_1 
select t2.contestant_number, t2.contestant_name from votes as t1 join contestants as t2 on t1.vote_id = t2.contestant_number group by t1.contestant_number order by count(*) asc limit 1	voter_1 
select count(*) from votes where state = 'NY' or state = 'CA'	voter_1 
select count(*) from contestants where contestant_number not in (select contestant_number from votes)	voter_1 
select t1.area_code from area_code_state as t1 join votes as t2 on t1.area_code = 2 group by t1.area_code order by count(*) desc limit 1	voter_1 
select t1.created, t1.state, t1.phone_number from votes as t1 join Contestants as t2 on t1.Contestant_number = t2.Contestant_number where t2.contestant_name = 'Tabatha Gehling'	voter_1 
select "Tabatha Gehling" from area_code_state intersect select "Kelly Clauss" from contestants where contestant_name = "Tabatha Gehling"	voter_1 
select contestant_name from contestants where contestant_name like '%al%'	voter_1 
select t1.name from country as t1 join city as t2 on t1.code = t2.countrycode where t2.name > 1950	world_1 
select name from country where	world_1 
select count(*) from country where governmentform = 'Republic'	world_1 
select count(distinct gnp) from country where governmentform = 'Republic'	world_1 
select sum(surfacearea) from country where region = "Cuba"	world_1 
select sum(surfacearea) from country where region = "Carribean"	world_1 
select continent from country where name = "Anguilla"	world_1 
select continent from country where name = 'Anguilla'	world_1 
select distinct t2.region from city as t1 join country as t2 on t1.countrycode = t2.code where t1.name = "Kabul"	world_1 
select distinct t2.region from city as t1 join country as t2 on t1.countrycode = t2.code where t1.name = "Kabul"	world_1 
select t2.language from country as t1 join countrylanguage as t2 on t1.code = t2.countrycode where t1.name = "Aruba" group by t2.language order by count(*) desc limit 1	world_1 
select t2.language from country as t1 join countrylanguage as t2 on t1.code = t2.countrycode where t1.name = "Aruba" group by t2.language	world_1 
select population, lifeexpectancy from country where name = 'Brazil'	world_1 
select population, lifeexpectancy from country where name = 'Brazil'	world_1 
select region, population from country where name = 'Angola'	world_1 
select region, population from country where name = 'Angola'	world_1 
select avg(lifeexpectancy) from country where region = 'Central Africa'	world_1 
select avg(lifeexpectancy) from country where region = 'Central Africa'	world_1 
select name from country where continent = 'Asia' order by lifeexpectancy limit 1	world_1 
select name from country where continent = 'Asia' order by lifeexpectancy limit 1	world_1 
select sum(population), max(gnp) from country where continent = 'Asia'	world_1 
select population, gnp from country where continent = 'Asia' order by gnp desc limit 1	world_1 
select avg(lifeexpectancy) from country where continent = 'Africa' and governmentform = 'Republic'	world_1 
select avg(lifeexpectancy) from country where continent = "Africa" and governmentform = "Republic"	world_1 
select sum(surfacearea) from country where continent = "Asia" intersect select sum(surfacearea) from country where continent = "Europe"	world_1 
select sum(surfacearea) from country where continent = "Asia" or continent = "Europe"	world_1 
select sum(population) from city where district = 'Geunderland'	world_1 
select sum(population) from city where district = 'Geunderland'	world_1 
select avg(gnp), sum(population) from country where governmentform = 'United States'	world_1 
select avg(gnp), sum(population) from country where governmentform = "US Territory"	world_1 
select count(distinct language) from countrylanguage	world_1 
select count(distinct language) from countrylanguage	world_1 
select count(distinct governmentform) from country where continent = 'Africa'	world_1 
select count(distinct governmentform) from country where continent = 'Africa'	world_1 
select count(distinct t2.language) from country as t1 join countrylanguage as t2 on t1.code = t2.countrycode where t1.name = "Aruba"	world_1 
select count(distinct t2.language) from country as t1 join countrylanguage as t2 on t1.code = t2.countrycode where t1.name = "Aruba"	world_1 
select count(distinct language) from countrylanguage as t1 join country as t2 on t1.countrycode = t2.code where t2.name = "Afghanistan"	world_1 
select count(distinct language) from countrylanguage as t1 join country as t2 on t1.countrycode = t2.code where t2.name = 'Afghanistan'	world_1 
select t1.name from country as t1 join countrylanguage as t2 on t1.code= t2.countrycode group by t2.countrycode order by count(*) desc limit 1	world_1 
select t1.name from country as t1 join countrylanguage as t2 on t1.code = t2.countrycode group by t2.countrycode order by count(*) desc limit 1	world_1 
select continent from country group by continent order by count(*) desc limit 1	world_1 
select continent from country group by continent order by count(*) desc limit 1	world_1 
select count(*) from countrylanguage where language = "English" intersect select count(*) from countrylanguage where language = "Dutch"	world_1 
select count(*) from countrylanguage where language = "English" intersect select count(*) from countrylanguage where language = "Dutch"	world_1 
select t1.name from country as t1 join countrylanguage as t2 on t1.code = t2.countrycode where t2.language = 'English' intersect select t1.name from country as t1 join countrylanguage as t2 on t1.code = t2.countrycode where t2.language = 'French'	world_1 
select t1.name from country as t1 join countrylanguage as t2 on t1.code = t2.countrycode where t2.language = 'English' intersect select t1.name from country as t1 join countrylanguage as t2 on t1.code = t2.countrycode where t2.language = 'French'	world_1 
select t1.name from country as t1 join countrylanguage as t2 on t1.code = t2.countrycode where t2.language = 'English' intersect select t1.name from country as t1 join countrylanguage as t2 on t1.code = t2.countrycode where t2.language = 'French'	world_1 
select t1.name from country as t1 join countrylanguage as t2 on t1.code = t2.countrycode where t2.language = 'English' intersect select t1.name from country as t1 join countrylanguage as t2 on t1.code = t2.countrycode where t2.language = 'French'	world_1 
select count(distinct t1.continent) from country as t1 join countrylanguage as t2 on t1.code = t2.countrycode where t2.language = "Chinese"	world_1 
select count(*) from country as t1 join countrylanguage as t2 on t1.code = t2.countrycode where t2.language = "Chinese"	world_1 
select region from country where language = "English"	world_1 
select distinct region from country where language = "Dutch" or language = "English	world_1 
select countrycode	world_1 
select name from country as t1 join countrylanguage as t2 on t1.code = t2.countrycode where t2.language = "English" or t2.language = "Dutch"	world_1 
select t2.language from country as t1 join countrylanguage as t2 on t1.code = t2.countrycode where t1.continent = "Asia" group by t2.language order by count(*) desc limit 1	world_1 
select t2.language from country as t1 join countrylanguage as t2 on t1.code = t2.countrycode where t1.continent = "Asia" group by t2.language order by count(*) desc limit 1	world_1 
select language from countrylanguage where governmentform = 'Republic'	world_1 
select language from country	world_1 
select name from city as t1 join countrylanguage as t2 on t1.countrycode = t2.countrycode where t2.language = "English" group by t1.name order by count(*) desc limit 1	world_1 
select name from city as t1 join countrylanguage as t2 on t1.countrycode = t2.countrycode where t2.language = "English" group by t1.name order by count(*) desc limit 1	world_1 
select name, population, lifeexpectancy from country where continent = 'Asia' order by surfacearea desc limit 1	world_1 
select name, population, lifeexpectancy from country where continent = 'Asia' order by population desc limit 1	world_1 
select avg(lifeexpectancy) from country where language	world_1 
select avg(lifeexpectancy) from country where language!= 'Egypt	world_1 
select sum(t1.population) from country as t1 join countrylanguage as t2 on t1.code = t2.countrycode where t2.language!= "English"	world_1 
select sum(t1.population) from country as t1 join countrylanguage as t2 on t1.code = t2.countrycode where t2.language!= "English"	world_1 
select t2.language from country as t1 join countrylanguage as t2 on t1.code = t2.countrycode where t1.headofstate = "Batrix"	world_1 
select t2.language from country as t1 join countrylanguage as t2 on t1.code = t2.countrycode where t1.headofstate = 'Batrix'	world_1 
select sum(t2.language) from country as t1 join countrylanguage as t2 on t1.code = t2.countrycode where t1.governmentform < 1930	world_1 
select count(distinct language), t1.name from country as t1 join countrylanguage as t2 on t1.code = t2.countrycode where t1.governmentform < 1930 group by t1.name	world_1 
select name from country where surfacearea > (select max(surfacearea) from country where continent = 'Europe')	world_1 
select name from country where region > (select max(region) from country where continent = 'Europe')	world_1 
select name from country where population < (select min(population) from country where continent = 'Afghanistan')	world_1 
select name from country where population < (select min(population) from country where continent = 'Afghanistan')	world_1 
select name from country where population > (select max(population) from country where continent = 'Afghanistan')	world_1
select	world_1 
select code from country except select countrycode from countrylanguage where language = 'English'	world_1 
select code from country except select countrycode from countrylanguage where language = 'English'	world_1 
select countrycode from countrylanguage where language!= 'English'	world_1 
select countrycode from countrylanguage where language!= "English"	world_1 
select code from country except select code from country where governmentform!= 'Republic'	world_1 
select code from country except select countrycode from countrylanguage where language = 'English'	world_1 
select t1.name from city as t1 join countrylanguage as t2 on t1.countrycode = t2.countrycode where t2.language!= "English"	world_1 
select name from city where continent = "Europe" and	world_1 
select distinct t1.name from city as t1 join countrylanguage as t2 on t1.countrycode = t2.countrycode where t2.language = "Chinese"	world_1 
select distinct t1.name from city as t1 join countrylanguage as t2 on t1.countrycode = t2.countrycode where t2.language = 'Chinese' or t2.language = 'Asia'	world_1 
select name, indepyear, surfacearea from country order by population asc limit 1	world_1 
select name, indepyear, surfacearea from country order by population asc limit 1	world_1 
select population, name, headofstate from country order by surfacearea desc limit 1	world_1 
select name, population, headofstate from country order by surfacearea desc limit 1	world_1 
select t1.name, count(*) from country as t1 join countrylanguage as t2 on t1.code = t2.countrycode group by t1.code having count(*) >= 3	world_1 
select t1.name, count(*) from country as t1 join countrylanguage as t2 on t1.code = t2.countrycode where t2.language > 2 group by t1.code	world_1 
select count(*), district from city where population > (select avg(population) from city) group by district	world_1 
select count(*), district from city where population > (select avg(population) from city) group by district	world_1 
select t1.name, avg(t2.lifeexpectancy) from country as t1 join country as t2 on t1.code = t2.code group by t1.governmentform having avg(t2.lifeexpectancy) > 72	world_1 
select sum(population), governmentform from country group by governmentform having avg(lifeexpectancy) > 72	world_1 
select avg(lifeexpectancy), sum(population) from country where lifeexpectancy < 72 group by continent	world_1 
select continent, sum(lifeexpectancy), avg(lifeexpectancy) from country where lifeexpectancy < 72 group by continent	world_1 
select name, region from country order by surfacearea desc limit 5	world_1 
select name, surfacearea from country order by population desc limit 5	world_1 
select name from country order by population desc limit 3	world_1 
select name from country order by population desc limit 3	world_1 
select name from country order by population asc limit 3	world_1 
select name from country order by population asc limit 3	world_1 
select count(*) from country where continent = "East Asia"	world_1 
select count(*) from country where continent = "Asia"	world_1 
select name from country where continent = "Europe" and population = 80000	world_1 
select name from country where continent = "Europe" and population = 80000	world_1 
select sum(population), avg(population) from country where continent = 'North America' and avg(population) > 3000	world_1 
select sum(population), avg(surfacearea) from country where region = 'North America' and surfacearea > 3000	world_1 
select name from city where population between 160000 and 900000	world_1 
select name from city where population between 160000 and 900000	world_1 
select language from countrylanguage group by language order by count(*) desc limit 1	world_1 
select language from countrylanguage group by language order by count(*) desc limit 1	world_1 
select language, percentage from countrylanguage group by language	world_1 
select countrycode, language from countrylanguage group by countrycode	world_1 
select count(*) from countrylanguage where language = "Spanish" order by percentage desc limit 1	world_1 
select count(*) from countrylanguage where language = "Spain" group by language order by count(*) desc limit 1	world_1 
select countrycode from countrylanguage where language = "Spanish" group by countrycode order by count(*) desc limit 1	world_1 
select countrycode from countrylanguage where language = "Spanish" group by countrycode order by count(*) desc limit 1	world_1 
select count(*) from conductor	orchestra 
select count(*) from conductor	orchestra 
select name from conductor order by age asc	orchestra 
select name from conductor order by age	orchestra 
select name from conductor where nationality!= "USA"	orchestra 
select name from conductor where nationality!= "USA"	orchestra 
select record_company from orchestra order by year_of_founded desc	orchestra 
select record_company from orchestra order by year_of_founded desc	orchestra 
select avg(attendance) from show	orchestra 
select avg(attendance) from show	orchestra 
select max(share), min(share) from performance where type!= "Live final"	orchestra 
select max(share), min(share) from performance where type!= "Live final"	orchestra 
select count(distinct nationality) from conductor	orchestra 
select count(distinct nationality) from conductor	orchestra 
select name from conductor order by year_of_work desc	orchestra 
select name from conductor order by year_of_work desc	orchestra 
select name from conductor order by year_of_work desc limit 1	orchestra 
select name from conductor order by year_of_work desc limit 1	orchestra 
select t1.name, 220 from conductor as t1 join orchestra as t2 on t1.conductor_id = t2.conductor_id	orchestra 
select t1.name, t3.name from conductor as t1 join orchestra as t2 on t1.conductor_id = t2.conductor_id join	orchestra 
select t1.name from conductor as t1 join orchestra as t2 on t1.conductor_id = t2.conductor_id group by t1.name having count(*) > 1	orchestra 
select t1.name from conductor as t1 join orchestra as t2 on t1.conductor_id = t2.conductor_id group by t1.name having count(*) > 1	orchestra 
select t1.name from conductor as t1 join orchestra as t2 on t1.conductor_id = t2.conductor_id group by t1.name order by count(*) desc limit 1	orchestra 
select t1.name from conductor as t1 join orchestra as t2 on t1.conductor_id = t2.conductor_id group by t1.name order by count(*) desc limit 1	orchestra 
select t2.name from orchestra as t1 join conductor as t2 on t1.conductor_id = t2.conductor_id where t1.year_of_founded > 2008	orchestra 
select t2.name from orchestra as t1 join conductor as t2 on t1.conductor_id = t2.conductor_id where t1.year_of_founded > 2008	orchestra 
select record_company, count(*) from orchestra group by record_company	orchestra 
select record_company, count(*) from orchestra group by record_company	orchestra 
select major_record_format from orchestra order by count(*) asc	orchestra 
select major_record_format from orchestra group by major_record_format order by count(*) asc	orchestra 
select record_company from orchestra group by record_company order by count(*) desc limit 1	orchestra 
select record_company from orchestra group by record_company order by count(*) desc limit 1	orchestra 
select orchestra from orchestra where orchestra_id not in (select orchestra_id from performance)	orchestra 
select orchestra from orchestra where orchestra_id not in (select orchestra_id from performance)	orchestra 
select record_company from orchestra where year_of_founded < 2003 intersect select record_company from orchestra where year_of_founded > 2003	orchestra 
select record_company from orchestra where year_of_founded < 2003 intersect select record_company from orchestra where year_of_founded > 2003	orchestra 
select count(*) from orchestra where major_record_format = "CD" or major_record_format = "DVD"	orchestra 
select count(*) from orchestra where major_record_format = "CD" or major_record_format = "DVD"	orchestra 
select t2.year_of_founded from performance as t1 join Orchestra as t2 on t1.Orchestra_id = t2.orchestra_id group by t1.Orchestra_id having count(*) > 1	orchestra 
select t1.year_of_founded from orchestra as t1 join performance as t2 on t1.orchest	orchestra 
select count(*) from highschooler	network_1 
select count(*) from highschooler	network_1 
select name, grade from highschooler	network_1 
select name, grade from highschooler	network_1 
select distinct grade from highschooler	network_1 
select distinct grade from highschooler	network_1 
select grade from highschooler where name = 'Kyle'	network_1 
select grade from highschooler where name = 'Kyle'	network_1 
select name from highschooler where grade = 10	network_1 
select name from highschooler where grade = 10	network_1 
select id from highschooler where name = 'Kyle'	network_1 
select id from highschooler where name = 'Kyle'	network_1 
select count(*) from highschooler where grade = 9 or grade = 10	network_1 
select count(*) from highschooler where grade = 9 or grade = 10	network_1 
select grade, count(*) from highschooler group by grade	network_1 
select grade, count(*) from highschooler group by grade	network_1 
select grade from highschooler group by grade order by count(*) desc limit 1	network_1 
select grade from highschooler group by grade order by count(*) desc limit 1	network_1 
select grade from highschooler group by grade having count(*) >= 4	network_1 
select grade from highschooler group by grade having count(*) >= 4	network_1 
select student_id, count(*) from friend group by student_id	network_1 
select count(*) from friend	network_1 
select t1.name, count(*) from highschooler as t1 join friend as t2 on t1.id = t2.friend_id group by t2.friend_id	network_1 
select t1.name, count(*) from highschooler as t1 join friend as t2 on t1.id = t2.friend_id group by t2.friend_id	network_1 
select t1.name from highschooler as t1 join friend as t2 on t1.id = t2.friend_id group by t2.friend_id order by count(*) desc limit 1	network_1 
select t1.name from highschooler as t1 join friend as t2 on t1.id = t2.friend_id group by t2.friend_id order by count(*) desc limit 1	network_1 
select t1.name from highschooler as t1 join friend as t2 on t1.id = t2.friend_id group by t2.friend_id having count(*) >= 3	network_1 
select t1.name from highschooler as t1 join friend as t2 on t1.id = t2.friend_id group by t2.friend_id having count(*) >= 3	network_1 
select t3.name from highschooler as t1 join friend as t2 on t1.id = t2.friend_id join highschooler as t3 on t2.friend_id = t3.id where t1.name = 'Kyle'	network_1 
select t2.friend_id from highschooler as t1 join friend as t2 on t1.id = t2.friend_id where t1.name = "Kyle"	network_1 
select count(t2.friend_id) from highschooler as t1 join friend as t2 on t1.id = t2.friend_id where t1.name = "Kyle"	network_1 
select count(*) from highschooler as t1 join friend as t2 on t1.id = t2.friend_id where t1.name = "Kyle"	network_1 
select student_id from	network_1 
select id from highschooler except select student_id from friend	network_1 
select name from highschooler except select t1.name from highschooler as t1 join friend as t2 on t1.id = t2.friend_id	network_1 
select name from highschooler where id not in (select student_id from friend)	network_1 
select t1.id from highschooler as t1 join likes as t2 on t1.id = t2.student_id group by t1.id having count(*) = 2 intersect select t1.id from highschooler as t1 join likes as t2 on t1.id = t2.student_id group by t1.id	network_1 
select student_id from friend intersect select student_id from likes	network_1 
select t1.name from highschooler as t1 join likes as t2 on t1.id = t2.student_id	network_1 
select t1.name from highschooler as t1 join likes as t2 on t1.id = t2.student_id intersect select t1.name from highschooler as t1 join likes as t2 on t1.id = t2.student_id	network_1 
select count(*), student_id from likes group by student_id	network_1 
select student_id, count(*) from likes group by student_id	network_1 
select t1.name, t2.liked_id, count(*) from highschooler as t1 join likes as t2 on t1.id = 2 group by t2.liked_id	network_1 
select count(*), t1.name from highschooler as t1 join likes as t2 on t1.id = 2 group by t1.name	network_1 
select t1.name from highschooler as t1 join likes as t2 on t1.id = t2.friend_id	network_1 
select t1.name from highschooler as t1 join likes as t2 on t1.id = t2.student_id group by t2.student_id order by count(*) desc limit 1	network_1 
select t1.name from highschooler as t1 join likes as t2 on t1.id = t2.student_id group by t2.student_id having count(*) >= 2	network_1 
select t1.name from highschooler as t1 join likes as t2 on t1.id = t2.student_id group by t2.student_id having count(*) >= 2	network_1 
select t1.name from highschooler as t1 join friend as t2 on t1.id = t2.student_id where t1.grade > 5 group by t2.student_id having count(*) >= 2	network_1 
select t1.name from highschooler as t1 join friend as t2 on t1.id = t2.friend_id where t1.grade > 5 group by t2.friend_id having count(*) >= 2	network_1 
select count(t2.liked_id) from highschooler as t1 join likes as t2 on t1.id = t2.liked_id where t1.name = "Kyle"	network_1 
select count(*) from highschooler as t1 join likes as t2 on t1.id = t2.liked_id where t1.name = "Kyle"	network_1 
select avg(t1.grade) from highschooler as t1 join friend as t2 on t1.id = t2.friend_id	network_1 
select avg(t1.grade) from highschooler as t1 join friend as t2 on t1.id = t2.friend_id	network_1 
select min(grade) from highschooler where id not in (select student_id from friend)	network_1 
select grade from highschooler where id not in (select student_id from friend)	network_1 
select state from owners intersect select state from professionals	dog_kennels 
select state from owners intersect select state from professionals	dog_kennels 
select avg(age) from dogs as t1 join treatments as t2 on t1.dog_id = t2.dog_id	dog_kennels 
select avg(age) from dogs as t1 join treatments as t2 on t1.dog_id = t2.dog_id	dog_kennels 
select t1.professional_id, t1.last_name, t1.cell_number from professionals as t1 join treatments as t2 on t1.professional_id = t2.professional_id where t1.state = "Indiana" or t2.treatment_id > 2	dog_kennels 
select t1.professional_id, t1.last_name, t1.cell_number from professionals as t1 join treatments as t2 on t1.professional_id = t2.professional_id where t1.state = "Indiana" union select t1.professional_id, t1.last_name, t1.cell_number from professionals as t1 join treatments as t2 on t1.professional_id = t2.professional_id group by t1.professional_id having count(*) > 2	dog_kennels 
select t1.name from dogs as t1 join treatments as t2 on t1.dog_id = t2.dog_id where t2.cost_of_treatment > 1000	dog_kennels 
select t2.name from treatments as t1 join dogs as t2 on t1.dog_id = t2.owner_id where t1.cost_of_treatment > 1000	dog_kennels 
select first_name from professionals except select t1.first_name from professionals as t1 join dogs as t2 on t1.professional_id = t2.owner_id	dog_kennels 
select first_name from professionals except select t1.first_name from professionals as t1 join dogs as t2 on t1.professional_id = t2.owner_id	dog_kennels 
select professional_id, role_code, email_address from professionals except select t1.professional_id, t1.role_code, t1.email_address from professionals as t1 join treatments as t2 on t1.professional_id = t2.professional_id	dog_kennels 
select professional_id, role_code, email_address from professionals except select t1.professional_id, t1.role_code, t1.email_address from professionals as t1 join treatments as t2 on t1.professional_id = t2.professional_id join dogs as t3 on t2.dog_id = t3.dog_id	dog_kennels 
select t1.owner_id, t1.first_name, t1.last_name from owners as t1 join dogs as t2 on t1.owner_id = t2.owner_id group by t1.owner_id order by count(*) desc limit 1	dog_kennels 
select t1.owner_id, t1.first_name, t1.last_name from owners as t1 join dogs as t2 on t1.owner_id = t2.owner_id group by t1.owner_id order by count(*) desc limit 1	dog_kennels 
select t1.professional_id, t1.role_code, t1.first_name from professionals as t1 join treatments as t2 on t1.professional_id = t2.professional_id group by t1.professional_id having count(*) >= 2	dog_kennels 
select t1.professional_id, t1.role_code, t1.first_name from professionals as t1 join treatments as t2 on t1.professional_id = t2.professional_id group by t1.professional_id having count(*) >= 2	dog_kennels 
select t1.breed_name from breeds as t1 join dogs as t2 on t1.breed_code = t2.breed_code group by t1.breed_code order by count(*) desc limit 1	dog_kennels 
select t1.breed_name from breeds as t1 join dogs as t2 on t1.breed_code = t2.breed_code group by t1.breed_code order by count(*) desc limit 1	dog_kennels 
select t1.owner_id, t1.last_name from owners as t1 join treatments as t2 on t1.owner_id = t2.dog_id group by t1.owner_id order by count(*) desc limit 1	dog_kennels 
select t1.owner_id, t1.last_name from owners as t1 join treatments as t2 on t1.owner_id = t2.dog_id group by t1.owner_id order by sum(t2.cost_of_treatment) desc limit 1	dog_kennels 
select t1.treatment_type_description from treatment_types as t1 join treatments as t2 on t1.treatment_type_code = t2.treatment_type_code group by t2.treatment_type_code order by sum(t2.cost_of_treatment) asc limit 1	dog_kennels 
select t1.treatment_type_description from treatment_types as t1 join treatments as t2 on t1.treatment_type_code = t2.treatment_type_code group by t2.treatment_type_code order by sum(t2.cost_of_treatment) limit 1	dog_kennels 
select t1.owner_id, t1.zip_code from owners as t1 join charges as t2 on t1.owner_id = t2.charge_id group by t1.owner_id order by sum(t2.charge_amount) desc limit 1	dog_kennels 
select t1.owner_id, t1.zip_code from owners as t1 join dogs as t2 on t1.owner_id = t2.owner_id group by t1.owner_id order by sum(t2.cost_of_treatment	dog_kennels 
select t1.professional_id, t2.cell_number from treatments as t1 join professionals as t2 on t1.professional_id = t2.professional_id group by t1.professional_id having count(*) >= 2	dog_kennels 
select t1.professional_id, t2.cell_number from treatments as t1 join professionals as t2 on t1.professional_id = t2.professional_id group by t1.professional_id having count(*) >= 2	dog_kennels 
select t1.first_name, t1.last_name from professionals as t1 join treatments as t2 on t1.professional_id = t2.professional_id where t2.cost_of_treatment < (select avg(cost_of_treatment) from treatments)	dog_kennels 
select t1.first_name, t1.last_name from professionals as t1 join treatments as t2 on t1.professional_id = t2.professional_id where t2.cost_of_treatment < ( select avg(cost_of_treatment) from treatments )	dog_kennels 
select t1.date_of_treatment, t2.first_name from treatments as t1 join professionals as t2 on t1.professional_id = t2.professional_id	dog_kennels 
select t1.date_of_treatment, t2.first_name from treatments as t1 join professionals as t2 on t1.professional_id = t2.professional_id	dog_kennels 
select t1.cost_of_treatment, t2.treatment_type_description from treatments as t1 join treatment_types as t2 on t1.treatment_type_code = t2.treatment_type_code	dog_kennels 
select t1.cost_of_treatment, t2.treatment_type_description from treatments as t1 join treatment_types as t2 on t1.treatment_type_code = t2.treatment_type_code	dog_kennels 
select t1.first_name, t1.last_name, t2.size_code from owners as t1 join dogs as t2 on t1.owner_id = t2.owner_id	dog_kennels 
select t1.first_name, t1.last_name, t2.size_code from owners as t1 join dogs as t2 on t1.owner_id = t2.owner_id	dog_kennels 
select t1.first_name, t2.name from owners as t1 join dogs as t2 on t1.owner_id = t2.owner_id	dog_kennels 
select t1.first_name, t2.name from owners as t1 join dogs as t2 on t1.owner_id = t2.owner_id	dog_kennels 
select t1.name, t2.date_of_treatment from dogs as t1 join treatments as t2 on t1.dog_id = t2.dog_id where t1.breed_code = ( select t1.breed_code from breeds as t1 join treatment_types as t2 on t1.breed_code = t2.treatment_type_code where t1.breed_code = "rare")	dog_kennels 
select t1.name, t2.date_of_treatment from dogs as t1 join treatments as t2 on t1.dog_id = t2.dog_id where t1.breed_code = (select breed_code from breeds order by count(*) desc limit 1)	dog_kennels 
select t2.first_name, t2.name from owners as t1 join dogs as	dog_kennels 
select t1.first_name, t2.name from owners as t1 join dogs as t2 on t1.owner_id = t2.owner_id where t1.state = "Vetnam"	dog_kennels 
select date_arrived, date_departed from dogs as t1 join treatments as t2 on t1.dog_id = t2.dog_id	dog_kennels 
select t1.date_arrived, t1.date_departed from dogs as t1 join treatments as t2 on t1.dog_id = t2.dog_id	dog_kennels 
select t1.last_name from owners as t1 join dogs as t2 on t1.owner_id = t2.owner_id order by t2.age limit 1	dog_kennels 
select t1.last_name from owners as t1 join dogs as t2 on t1.owner_id = t2.owner_id order by t2.age limit 1	dog_kennels 
select email_address from professionals where state = "Hawaii" or state = "Wisconsin"	dog_kennels 
select email_address from professionals where state = "Hawaii" or state = "Wisconsin"	dog_kennels 
select date_arrived, date_departed from dogs	dog_kennels 
select date_arrived, date_departed from dogs	dog_kennels 
select count(distinct dog_id) from treatments	dog_kennels 
select count(distinct dog_id) from treatments	dog_kennels 
select count(distinct professional_id) from treatments	dog_kennels 
select count(distinct professional_id) from treatments	dog_kennels 
select role_code, street, city, state from professionals where city like '%west%'	dog_kennels 
select role_code, street, city, state from professionals where city like '%west%'	dog_kennels 
select first_name, last_name, email_address from owners where state like '%nor%'	dog_kennels 
select first_name, last_name, email_address from owners where state like '%north%'	dog_kennels 
select count(*) from dogs where age < ( select avg(age) from dogs )	dog_kennels 
select count(*) from dogs where age < ( select avg(age) from dogs )	dog_kennels 
select max(cost_of_treatment) from treatments order by date_of_treatment desc limit 1	dog_kennels 
select cost_of_treatment from treatments order by date_of_treatment desc limit 1	dog_kennels 
select count(*) from dogs where dog_id not in ( select dog_id from treatments )	dog_kennels 
select count(*) from dogs where dog_id not in ( select dog_id from treatments )	dog_kennels 
select count(*) from owners where owner_id not in ( select owner_id from dogs )	dog_kennels 
select count(*) from owners where owner_id not in (select owner_id from dogs)	dog_kennels 
select count(*) from professionals where professional_id not in ( select professional_id from treatments )	dog_kennels 
select count(*) from professionals where professional_id not in ( select professional_id from treatments )	dog_kennels 
select name, age, weight from dogs where abandoned_yn = 1	dog_kennels 
select name, age, weight from dogs where abandoned_yn = 1	dog_kennels 
select avg(age) from dogs	dog_kennels 
select avg(age) from dogs	dog_kennels 
select age from dogs order by age desc limit 1	dog_kennels 
select age from dogs order by age desc limit 1	dog_kennels 
select charge_type, charge_amount from charges group by charge_type	dog_kennels 
select charge_type, charge_amount from charges group by charge_type	dog_kennels 
select charge_type from charges order by charge_amount desc limit 1	dog_kennels 
select charge_amount from charges order by charge_type desc limit 1	dog_kennels 
select email_address, cell_number, home_phone from professionals	dog_kennels 
select email_address, cell_number, home_phone from professionals	dog_kennels 
select distinct breed_code, size_code from dogs	dog_kennels 
select distinct breed_code, size_code from dogs	dog_kennels 
select t1.first_name, t3.treatment_type_description from professionals as t1 join treatments as t2 on t1.professional_id = t2.professional_id join treatment_types as t3 on t2.treatment_type_code = t3.treatment_type_code	dog_kennels 
select t1.first_name, t3.treatment_type_description from professionals as t1 join treatments as t2 on t1.professional_id = t2.professional_id join treatment_types as t3 on t2.treatment_type_code = t3.treatment_type_code	dog_kennels 
select count(*) from singer	singer 
select count(*) from singer	singer 
select name from singer order by net_worth_millions asc	singer 
select name from singer order by net_worth_millions asc	singer 
select birth_year, citizenship from singer	singer 
select birth_year, citizenship from singer	singer 
select name from singer where citizenship!= 'France'	singer 
select name from singer where citizenship!= 'France'	singer 
select name from singer where birth_year = 1948 or birth_year = 1949	singer 
select name from singer where birth_year = 1948 or birth_year = 1949	singer 
select name from singer order by net_worth_millions desc limit 1	singer 
select name from singer order by net_worth_millions desc limit 1	singer 
select citizenship, count(*) from singer group by citizenship	singer 
select citizenship, count(*) from singer group by citizenship	singer 
select citizenship from singer group by citizenship order by count(*) desc limit 1	singer 
select citizenship from singer group by citizenship order by count(*) desc limit 1	singer 
select citizenship, max(net_worth_millions) from singer group by citizenship	singer 
select citizenship, max(net_worth_millions) from singer group by citizenship	singer 
select t3.title, t2.name from song as t1 join singer as t2 on t1.song_id = 2 join song as t3 on t1.song_id = t3.song_id	singer 
select t3.title, t2.name from song as t1 join singer as t2 on t1.song_id = 2 join song as t3 on t1.song_id = t3.song_id	singer 
select distinct t1.name from singer as t1 join song as t2 on t1.singer_id = t2.song_id where t2.sales > 300000	singer 
select distinct t1.name from singer as t1 join song as t2 on t1.singer_id = t2.song_id where t2.sales > 300000	singer 
select t1.name from singer as t1 join song as t2 on t1.singer_id = t2.song_id group by t2.song_id having count(*) > 1	singer 
select t1.name from singer as t1 join song as t2 on t1.singer_id = t2.song_id group by t2.song_id having count(*) > 1	singer 
select t1.name, sum(t2.sales) from singer as t1 join song as t2 on t1.name = t2.song_id group by t2.song_id	singer 
select t2.name, sum(t1.sales) from song as t1 join singer as t2 on t1.song_id = t2.singer_id group by t2.name	singer 
select name from singer where singer_id not in (select singer_id from song)	singer 
select name from singer where singer_id not in (select singer_id from song)	singer 
select citizenship from singer where birth_year < 1945 intersect select citizenship from singer where birth_year > 1956	singer 
select citizenship from singer where birth_year < 1945 intersect select citizenship from singer where birth_year > 1956	singer 
select count(*) from other_available_features	real_estate_properties 
select t1.feature_type_name from ref_feature_types as t1 join other_available_features as t2 on t1.feature_type_code = t2.feature_type_code where t2.feature_name = "AirCon"	real_estate_properties 
select t2.property_type_description from properties as t1 join ref_property_types as t2 on t1.property_type_code = t2.property_type_code	real_estate_properties 
select property_name from properties where property_type_code = 'House' or room_count > 1	real_estate_properties 
select issue_id from issue where type = "Georgia"	apache-pig 
select * from issue where status = "Closed" and status = "Resolved" union select * from issue where status = "Patch available" and status = "Closed"	apache-pig 
select t1.issue_id, t1.type, t1.description from issue as t1 join issue_component as t2 on t1.issue_id = t2.issue_id where t2.component = "impl"	apache-pig 
select issue_id from issue where updated_date between '2017-03-22' and '2017-03-23'	apache-pig 
select * from issue where issue_id = 'PIG-3599'	apache-pig 
select t1.issue_id from issue_comment as t1 join issue as t2 on t1.issue_id = t2.issue_id where t2.assignee = "Daniel Ward" and t2.status = "Open"	apache-pig 
select issue_id from issue where status = "In Progress"	apache-pig 
select t1.issue_id from issue as t1 join issue_comment as t2 on t1.issue_id = 2 join issue as t3 on t2.issue_id = t3.issue_id where t3.reporter = "John Stark" and t3.type = "Gitter"	apache-pig 
select issue_id from issue where priority = "Blocker" or priority = "Critical"	apache-pig 
select * from issue where updated_date > '2017-03-28'	apache-pig 
select distinct t1.assignee from issue as t1 join issue_changelog as t2 on t1.issue_id = t2.issue_id where t2.field = "Daniel Ward"	apache-pig 
select * from issue_attachment	apache-pig 
select issue_id, sum(summary) from issue where type = "Georgia"	apache-pig 
select issue_id, description from issue where type = "Georgia"	apache-pig 
select * from issue_component where component = "grunt" intersect select * from issue_component where component = "parser"	apache-pig 
select status from issue where issue_id = "PIG-3599"	apache-pig 
select issue_id, priority from issue where type = "Georgia"	apache-pig 
select issue_id, status, resolution, summary, description from issue where type = "Git" and priority = "Morning"	apache-pig 
select issue_id, type, priority from issue where status = "Open" order by type, priority	apache-pig 
select t1.field_type, t1.username from issue_changelog as t1 join issue_fix_version as t2 on t1.issue_id = (select t2.issue_id from issue_fix_version as t3 join issue_fix_version as t4 on t3.issue_id = t4.issue_id where t3.fix_version = '0.12.1' group by t3.issue_id having count(*) >= 1 )	apache-pig 
select issue_id, type, sum(description) from issue where status = "Open" and priority = "Major"	apache-pig 
select distinct assignee from issue where type = "Bug"	apache-pig 
select t1.name, count(*) from	apache-pig 
select commit_hash, message from	apache-pig 
select assignee from issue where issue_id = "PIG-3599"	apache-pig 
select count(*) from issue where type = "Improvement"	apache-pig 
select type from issue group by type order by count(*) desc limit 1	apache-pig 
select count(*) from issue where priority = "Blocker" or priority = "Critical"	apache-pig 
select file_path, count(*) from code_change group by file_path order by count(*) desc	apache-pig 
select assignee from issue group by assignee having count(*) = 1	apache-pig 
select assignee, count(*) from issue where status = "Open" group by assignee order by count(*) desc limit 1	apache-pig 
select count(*), t1.assignee from issue as t1 join issue_comment as t2 on t1.issue_id = t2.issue_id where t1.status = "Open" group by t1.assignee	apache-pig 
select count(*), status from issue group by status	apache-pig 
select t2.name, count(*) from issue as t1 join git_repository as t2 on t1.resolution = t2.git_repository_id group by t2.name	apache-pig 
select source_issue_id, target_issue_id from issue_link where name = 'Duplicate'	apache-pig 
select source_issue_id, target_issue_id from issue_link where name = 'Blocker'	apache-pig 
select count(*) from issue where status = "Open"	apache-pig 
select issue_id from issue where priority = "Blocker" or priority = "Critical"	apache-pig 
select count(*), assignee from issue where status = "Resolved" group by assignee	apache-pig 
select t1.display_name, t1.message from issue_comment as t1 join issue_comment as t2 on t1.issue_id = t2.issue_id where t2.issue_id = 'PIG-3599'	apache-pig 
select * from issue_comment as t1 join issue_fix_version as t2 on t1.issue_id = t2.issue_id where t2.issue_id = 'PIG-3592'	 apache-pig 
select count(*) from issue as t1 join issue_comment as t2 on t1.issue_id = t2.issue_id join issue_component as t3 on t2.issue_id = t3.issue_id where t3.component = "impl"	apache-pig 
select distinct assignee from issue_component as t1 join issue_component as t2 on t1.issue_id = t2.issue_id join issue as t3 on t2.issue_id = t3.issue_id where t2.component = 'impl'	apache-pig 
select reporter, issue_id from issue order by reporter asc	apache-pig 
select * from issue_changelog as t1 join issue_fix_version as t2 on t1.issue_id = t2.issue_id where t2.fix_version = '0.12.1'	apache-pig 
select issue_id, assignee from issue where resolved_date between "2014-09-08" and "2014-09-12"	apache-pig 
select distinct t1.file_path from code_change as t1 join issue_fix_version as t2 on t1.	apache-pig 
select * from issue where created_date < "2014-09-12"	apache-pig 
select * from issue where created_date = "2017-03-28"	apache-pig 
select issue_id from issue where resolved_date = '2013-10-23'	apache-pig 
select issue_id, count(*) from issue where resolved_date between '2015-03-01' and '2015-03-31' group by issue_id having count(*) >= 3	apache-pig 
select count(*) from issue where resolved_date < "2013-10-27"	apache-pig 
select * from issue where created_date > '2017-05-31'	apache-pig 
select issue_id from issue where resolved_date between '2017-10-01' and '2017-10-31'	apache-pig 
select issue_id from issue where created_date between '2017-01-01' and '2017-03-31'	apache-pig 
select issue_id, type, priority from issue where status = 'Open' and created_date between '2013-11-16' and '2013-11-28' order by type, priority	apache-pig 
select issue_id, status from issue where type = "Georgia"	apache-pig 
select issue_id, resolution from issue where type = "Georgia"	apache-pig 
select type from issue where issue_id = "PIG-3599"	apache-pig 
select resolved_date from issue where issue_id = 'PIG-3599'	apache-pig 
select content from issue_attachment as t1 join issue_component as t2 on t1.issue_id = t2.issue_id join issue_component as t3 on t2.issue_id = t3.issue_id	apache-pig 
select distinct t1.priority from issue as t1 join jira_repository as t2 on t1.	apache-pig 
select distinct status from issue where issue_id in (select distinct issue_id from issue_changelog where field_type = "PIG")	apache-pig 
select distinct t1.name from jira_repository as	apache-pig 
select distinct commit_hash from git_repository as t1 join change_set as t2 on t1.git_repository_id = t2.git_repository_id	apache-pig 
select distinct t2.name from change_set as t1 join issue_comment on t1.commit_hash = t2.commit_hASH join issue_comment as t3 on t1.commit_hash = t3.issue_id	apache-pig 
select distinct component from issue_component	apache-pig 
select count(*), t1.fix_version from issue_fix_version as t1 join issue as t2 on t1.issue_id = t2.issue_id where t2.resolution = 'Resolved' group by t1.fix_version	apache-pig 
select fix_version from issue_fix_version group by fix_version order by count(*) desc limit 1	apache-pig 
select status from issue group by status order by created_date_zoned desc limit 1	apache-pig 
select fix_version from issue_fix_version where issue_id = (select issue_id from issue_fix_version where issue_id = 'PIG-3599')	apache-pig 
select created_date, count(*) from issue group by created_date	apache-pig 
select updated_date, count(*) from issue group by updated_date	apache-pig 
select resolved_date, count(*) from issue group by resolved_date	apache-pig 
select committed_date, count(*) from change_set group by committed_date	apache-pig 
select t1.resolved_date, t1.issue_id from issue as t1 join issue as t2 on t1.resolved_date = t2.issue_id where t2.assignee = "Daniel Ward" order by t2.resolved_date desc	apache-pig 
select count(*) from issue where resolved_date between "2014-10-01" and "2014-10-31" and assignee = "John Stark"	apache-pig 
select count(*) from issue where created_date between '2015-01-01' and '2015-04-30'	apache-pig 
select issue_id, created_date from issue group by created_date order by count(*) desc limit 1	apache-pig 
select issue_id, count(*) from issue group by resolved_date order by count(*) desc limit 1	apache-pig 
select count(*) from issue as t1 join issue_changelog as t2 on t1.issue_id = t2.issue_id join jira_repository as t3 on t2.	apache-pig 
select count(distinct type) from issue	apache-pig 
select type, count(*) from issue group by type	apache-pig 
select count(distinct priority) from issue	apache-pig 
select count(*), t1.priority from issue as t1 join issue_changelog as t2 on t1.issue_id = t2.issue_id group by t1.priority	apache-pig 
select count(distinct status) from issue	apache-pig 
select count(*), t1.resolution from issue as t1 join git_repository as t2 on t1.resolution = t2.git_repository_id group by t1.resolution	apache-pig 
select count(distinct assignee), count(distinct t1.assignee) from issue as t1 join issue_changelog as t2 on t1.issue_id = t2.issue_id where t2.field = "assignee"	apache-pig 
select assignee, count(*), t2.assignee from jira_repository as t1 join issue as t2 on t2.assignee = 1 group by t2.assignee	apache-pig 
select count(distinct assignee_username) from issue	apache-pig 
select count(distinct assignee_username), count(distinct t1.assignee_username), count(distinct t1.assignee_username), count(distinct t1.assignee_username), count(distinct t1.assignee_username), count(distinct t1.assignee_username), count(distinct t1.assignee_username), count(distinct t1.assignee_username), count(distinct t1.assignee_username), count(distinct t1.assignee_username), count(distinct t1.assignee_username), count(distinct t1.assignee_username), count(distinct t1.assignee_username), count(distinct t1.assignee_username), count(distinct t1.assignee_	apache-pig 
select count(distinct reporter) from issue	apache-pig 
select t2.name, count(*) from issue_comment as t1 join	apache-pig 
select t1.name, count(*) from git_repository as t1 join issue as t2 on t1.git_repository_id = t2.git_repository_id	apache-pig 
select count(distinct reporter_username), count(distinct t1.name) from git_repository as t1 join issue_changelog as t2 on t1.git_repository_id = t2.git_repository_id	apache-pig 
select reporter_username, count(*) from issue group by reporter_username	apache-pig 
select count(*), t1.name from git_repository as t1 join change_set as t2 on t1.git_repository_id = t2.git_repository_id group by t1.name	apache-pig 
select count(distinct author_email) from change_set	apache-pig 
select t2.description, count(*) from issue_comment as t1 join issue as t2 on t1.issue_id = t2.issue_id group by t2.description	apache-pig 
select distinct username from issue_comment	apache-pig 
select count(distinct component) from issue_component	apache-pig 
select t2.component, count(*) from issue_component as t1 join issue_component as t2 on t1.issue_id = t2.issue_id where t2.issue_id in (select t1.issue_id from issue_comment as t3 join issue_component as t4 on t3.issue_id = t4.issue_id group by t1.issue_id)	apache-pig 
select count(distinct name) from issue_link	apache-pig 
select t1.name, count(*) from git_repository as t1 join issue_link as t2 on t1.git_repository_id = 2 group by t1.name	apache-pig 
select count(*) from issue where type = "Georgia"	apache-pig 
select distinct assignee from issue	apache-pig 
select distinct assignee_username from	apache-pig 
select distinct reporter from issue	apache-pig 
select distinct reporter_username from issue	apache-pig 
select count(distinct author_email) from change_set	apache-pig 
select t2.display_name, count(*) from issue_comment as t1 join issue_comment as t2 on t1.issue_id = t2.issue_id where t1.issue_id = 'PIG-3592' group by t1.issue_id	apache-pig 
select issue_id, created_date, resolved_date, commit_hash from issue_link join issue_comment as t1 join issue_changelog as t2 on t1.issue_id = t2.issue_id	apache-pig 
select distinct t1.name from issue_link as t1 join issue_link as t2 on t1.issue_i	apache-pig 
select count(*), t1.issue_id from issue as t1 join issue_link as t2 on t1.issue_id = t2.issue_id	apache-pig 
select count(*) from issue_link group by count(*) having count(*) >= 2	apache-pig 
select count(*) from issue_link group by count(*)	apache-pig 
select t2.username, count(distinct t1.issue_id) from issue_comment as t1 join issue_comment as t2 on t1.issue_id = t2.issue_id group by t2.username	apache-pig 
select issue_id, count(distinct username) from issue_comment group by issue_id	apache-pig 
select count(*), t1.issue_id from issue_comment as t1 join issue_comment as t2 on t1.issue_id = t2.issue_id group by t1.issue_id	apache-pig 
select t1.issue_id, t1.summary, t1.description from issue as t1 join issue_comment as t2 on t1.issue_id = t2.issue_id	apache-pig 
select t1.commit_hash from code_change as t1 join issue_comment as t2 on t1.commit_hash = 2 join issue_fix_version as t3 on t2.issue_id = t3.issue_id where t3.issue_id = 'PIG-3592' intersect select t1.commit_hash from code_change as t1 join issue_fix_version as t2 on t1.commit_hash = t2.issue_id join issue_fix_version as t3 on t2.issue_id = t3.issue_id where t3.issue_id = 'PIG-3592'	apache-pig 
select count(*), type from issue where type = "Bit" union select type from issue where type = "Initialization"	apache-pig 
select count(*) from issue_attachment as t1 join issue_fix_version as t2 on t1.issue_id = t2.issue_id where t2.issue_id = 'PIG-3599'	apache-pig 
select min(file_path) from issue_fix_version as t1 join issue_link as t2 on t1.issue_id = t2.issue_id	apache-pig 
select count(*) from issue as t1 join issue_link as t2 on t1.issue_id = t2.source_issue_id where t1.type = "Gitter" intersect select count(*) from issue as t1 join issue_link as t2 on t1.issue_id = t2.source_issue_id where t1.type = "Initialization"	apache-pig 
select source_issue_id, target_issue_id from issue_link where type = 'Gitter	apache-pig 
select distinct t1.name from issue_link as t1 join issue_link as t2 on t1.source_issue_id = (select t2.source_issue_id from issue_changelog as t3 join issue_link as t4 on t2.source_issue_id = t4.source_issue_id where t3.field = 'PIG')	apache-pig 
select t1.type, count(*) from issue as t1 join issue_link as t2 on t1.issue_id = t2.source_issue_id where t2.name = "Clothes" group by t1.type	apache-pig 
select t1.type from issue as t1 join issue_link as t2 on t1.issue_id = t2.source_issue_id where t2.name = "Clothes" intersect select t1.type from issue as t1 join issue_link as t2 on t1.issue_id = t2.source_issue_id where t2.name = "Clothes"	apache-pig 
select distinct type from issue	apache-pig 
select * from issue where type = "Georgia"	apache-pig 
select issue_id from issue except select t1.issue_id from issue as t1 join issue_changelog as t2 on t1.issue_id = t2.issue_id where t1.status!= "In Progress"	apache-pig 
select count( *) from issue_fix_version as t1 join issue_link as t2 on t1.issue_id = t2.issue_id	apache-pig 
select issue_id from issue where type = "buggy"	apache-pig 
select issue_id from issue where resolved_date = (select resolved_date from issue where status = 'Resolved' or status = 'Patch available')	apache-pig 
select issue_id, type, description from issue_component as t1 join issue_component as t2 on t1.issue_id = t2.issue_id	apache-pig 
select issue_id from issue where created_date between '2017-03-22' and '2017-03-23'	apache-pig 
select * from issue where issue_id = "PIG-3599"	apache-pig 
select t1.issue_id from issue as t1 join issue_comment as t2 on t1.issue_id = t2.issue_id where t2.display_name = "Daniel Ward"	apache-pig 
select status from issue group by status having count(*) >= 1	apache-pig 
select * from issue as t1 join issue_comment as t2 on t1.issue_id = 2 join issue as t3 on t2.issue_id = t3.issue_id where t3.description = "John Stark"	apache-pig 
select issue_id from issue where priority = "blocking" or priority = "Critical"	apache-pig 
select * from issue where created_date > '2017-03-28'	apache-pig 
select * from issue as t1 join issue as t2 on t1.issue_id = t2.issue_id where t1.assignee = "Daniel Ward"	apache-pig 
select distinct issue_id from issue_attachment	apache-pig 
select issue_id, sum(summary) from issue where type = "Georgia"	apache-pig 
select issue_id, description from issue where type = "Georgia"	apache-pig 
select t1.issue_id from issue_component as t1 join issue_component as t2 on t1.issue_id = t2.issue_id where t2.component = 'grunt' intersect select t1.issue_id from issue_component as t1 join issue_component as t2 on t1.issue_id = t2.issue_id where t2.component = 'parser'	apache-pig 
select status from issue where issue_id = "PIG-3599"	apache-pig 
select issue_id, priority from issue where type = "Ghost"	apache-pig 
select issue_id, status, summary, description from issue where type = "Georgia"	apache-pig 
select issue_id, status, summary, description from issue where type = "Georgia"	apache-pig 
select t1.name, t1.de	apache-pig 
select issue_id, type, summary, description from issue where status = "Open"	apache-pig 
select distinct t1.assignee_username from issue as t1 join issue_fix_version as t2 on t1.issue_id = t2.issue_id where t1.type = "Ghost"	apache-pig 
select count(*), t1.name from	apache-pig 
select commit_hash, message from change_set	apache-pig 
select assignee from issue where issue_id = "PIG-3599"	apache-pig 
select count(*) from issue	apache-pig 
select type from issue group by type order by count(*) desc limit 1	apache-pig 
select count(*) from issue where priority = "Blocker" or priority = "Critical"	apache-pig 
select file_path, count(*) from code_change group by file_path order by count(*) desc	apache-pig 
select assignee from issue group by assignee having count(*) = 1	apache-pig 
select assignee, count(*) from issue group by assignee	apache-pig 
select assignee, count(*) from issue group by assignee	apache-pig 
select count(*), type from issue group by type	apache-pig 
select count(*), t1.resolution from issue as t1 join issue_changelog as t2 on t1.issue_id = t2.issue_id group by t1.resolution	apache-pig 
select name from issue_link where name like '%duplicate%'	apache-pig 
select t1.name from issue_link as t1 join issue_link as t2 on t1.source_issue_id = t2.source_issue_id where t2.name = 'Blocker'	apache-pig 
select count(*) from issue where status!= "Resolved"	apache-pig 
select distinct issue_id from issue where priority = "blocking" or priority = "Critical"	apache-pig 
select count(*), t1.assignee from issue as t1 join issue_fix_version as t2 on t1.issue_id = t2.issue_id group by t1.assignee	apache-pig 
select t2.assignee, t3.description from issue_comment as t1 join issue as t2 on t1.issue_id = t2.issue_id join	apache-pig 
select t1.assignee from issue as t1 join issue_fix_version as t2 on t1.issue_id = t2.issue_id where t2.issue_id = "PIG-3592"	apache-pig 
select count(*) from issue_component where component = 'impl'	apache-pig 
select t1.assignee_username from issue as t1 join issue_component as t2 on t1.issue_id = t2.issue_id where t2.component = "imp"	apache-pig 
select t1.name, t2.issue_id, t1.name from issue as t3 join issue_comment as t4 on t1.issue_id = t4.issue_id join jira_repository as t5 on t3.	apache-pig 
select * from issue_fix_version where fix_version = '0.12.1'	apache-pig 
select issue_id, assignee from issue where resolved_date between "2014-09-08" and "2014-09-12"	apache-pig 
select distinct * from issue_fix_version as t1 join issue_fix_version as t2 on t1.issue_id = t2.issue_id where t2.fix_version = '0.12.1'	apache-pig 
select * from issue where created_date < "2014-09-12"	apache-pig 
select * from issue where created_date = "2017-03-28" and resolved_date = "2017-03-28"	apache-pig 
select issue_id from issue where resolved_date = "2013-10-23"	apache-pig 
select assignee_username from issue where resolved_date between '2015-03-01' and '2015-03-31' group by assignee_username having count(*) >= 3	apache-pig 
select count(*) from issue where resolved_date < "2013-10-27"	apache-pig 
select * from issue where created_date > '2017-05-31' and resolved_date < '2017-05-31'	apache-pig 
select issue_id from issue where resolved_date between '2017-10-01' and '2017-10-31'	apache-pig 
select issue_id from issue where created_date between '2017-01-01' and '2017-03-31'	apache-pig 
select issue_id, type, priority from issue where created_date > '2013-11-16' and created_date <= '2013-11-28' order by type, priority	apache-pig 
select	apache-pig 
select	apache-pig 
select type from issue where issue_id = "PIG-3599"	apache-pig 
select resolved_date from issue where issue_id = 'PIG-3599'	apache-pig 
select issue.name from issue as t1 join issue_fix_version as t2 on t1.issue_id = t2.issue_id join issue_component as t3 on t2.issue_id = t3.issue_id join	apache-pig 
select priority from issue group by priority order by count(*) asc limit 1	apache-pig 
select distinct status from issue	apache-pig 
select type from issue group by type having count(*) >= 2	apache-pig 
select * from	apache-pig 
select t1.name from issue_comment as t2 join change_set as t3 join issue_comment as t4 on t1.issue_id = t3.issue_id	apache-pig 
select component from issue_component where field = "Apply to jira_repository" and	apache-pig 
select fix_version, count(*) from issue_fix_version group by fix_version	apache-pig 
select fix_version from issue_fix_version group by fix_version order by count(*) desc limit 1	apache-pig 
select status from issue order by created_date desc limit 1	apache-pig 
select fix_version from issue_fix_version where issue_id = (select issue_id from issue_fix_version where issue_id = 'PIG-3599')	apache-pig 
select issue_id, created_date, created_date_zoned from issue group by created_date_zoned	apache-pig 
select created_date, created_date_zoned from issue group by created_date_zoned	apache-pig 
select resolved_date from issue order by resolved_date desc limit 1	apache-pig 
select count(*), git_repository_id from change_set group by git_repository_id	apache-pig 
select resolved_date, issue_id from issue where assignee = "Daniel Ward" order by resolved_date	apache-pig 
select count(*) from issue as t1 join issue_comment as t2 on t1.issue_id = t2.issue_id where t2.display_name = "John Stark" and t1.resolution = "2014-10-05"	apache-pig 
select count(*) from issue where created_date = "2015-04-19 15:06:20" and updated_date = "2015-03-15 00:33:18"	apache-pig 
select created_date from issue group by created_date order by count(*) desc limit 1	apache-pig 
select resolved_date from issue group by resolved_date order by count(*) desc limit 1	apache-pig 
select count(*) from issue	apache-pig 
select count(distinct type) from issue	apache-pig 
select type, count(*) from issue group by type	apache-pig 
select count(distinct priority) from issue	apache-pig 
select count(*), priority from issue group by priority	apache-pig 
select count(distinct status) from issue	apache-pig 
select distinct t2.resolution from jira_repository as t1 join issue as t2 on t1.key = (select t1.key from jira_repository as t3 join issue_changelog as t4 on t2.issue_id = t4.issue_id join jira_repository as t5 on t3.	apache-pig 
select count(*) from issue_comment as t1 join issue_comment as t2 on t1.issue_id = t2.issue_id group by t1.issue_id	apache-pig 
select count(*) from jira_repository where key = 'PIG'	apache-pig 
select count(*) from issue as t1 join issue_comment as t2 on t1.issue_id = t2.issue_id join issue_component as t3 on t2.issue_id = t3.issue_id group by t3.issue_id	apache-pig 
select count(*), assignee_username from issue group by assignee_username	apache-pig 
select count(*) from jira_repository where key = "PIG"	apache-pig 
select	apache-pig 
select count(*), t1.reporter_username from issue as t1 join issue_changelog as t2 on t1.issue_id = t2.issue_id group by t1.reporter_username	apache-pig 
select count(*) from issue_changelog as t1 join issue as t2 on t1.issue_id = t2.issue_id join	apache-pig 
select count(*), t1.username from issue_comment as t1 join issue_comment as t2 on t1.issue_id = t2.issue_id group by t1.username	apache-pig 
select count(*) from change_set	apache-pig 
select count(*) from git_repository as t1 join change_set as t2 on t1.git_repository_id = t2.git_repository_id group by t2.git_repository_id	apache-pig 
select count(*), t1.name from git_repository as t1 join issue_comment as t2 on t1.git_repository_id = t2.git_repository_id	apache-pig 
select distinct t1.username from issue_comment as t1 join issue_comment as t2 on t1.issue_id = t2.issue_id where t2.issue_id in (select t4.issue_id from issue_comment as t3 join issue_comment as t4 on t3.issue_id = t4.issue_id where t4.issue_id in (select t4.issue_id from issue_comment as t5 join issue_comment as t6 on t5.issue_id = t4.issue_id where t4.issue_id in (select t4.issue_id from issue_comment as t5 join issue_comment as t8 on t5.issue_id = t4.issue_id where t4.issue_id in (select t4.issue_id from issue_comment as t8 join issue_comment as t9 on t5.issue_id = t4.issue_id where t4.issue_id in (select t4.issue_id from issue_comment as t9 join issue_com	apache-pig 
select count(*) from jira_repository where key = 'PIG'	apache-pig 
select count(distinct component) from issue_component	apache-pig 
select count(distinct issue_id), t1.name, count(distinct t2.name) from issue_link as t1 join issue_link as t2 on t1.issue_	apache-pig 
select count(*) from issue_link group by count(*)	apache-pig 
select count(*) from issue where type = "Bitcoin"	apache-pig 
select count(distinct assignee), t1.name from git_repository as t1 join issue_changelog as t2 on t1.git_repository_id = 2 join issue as t3 on t2.issue_id = 3 join issue_changelog as t4 on t3.issue_id = t4.issue_id where t4.field = "assignee"	apache-pig 
select distinct t1.assignee_username from issue as t1 join issue_attachment as t2 on t1.issue_id = t2.issue_id join issue_comment as t3 on t2.issue_id = t3.issue_id	apache-pig 
select distinct reporter from issue	apache-pig 
select distinct t1.username from issue_comment as t1 join issue_comment as t2 on t1.issue_id = t2.issue_id where t2.issue_id in (select t4.issue_id from issue_comment as t3 join issue_comment as t4 on t3.issue_id = t4.issue_id where t4.issue_id in (select t4.issue_id from issue_comment as t5 join issue_comment as t6 on t5.issue_id = t4.issue_id where t4.issue_id in (select t4.issue_id from issue_comment as t5 join issue_comment as t6 on t5.issue_id = t4.issue_id where t4.issue_id in (select t4.issue_id from issue_comment as t5 join issue_comment as t6 on t5.issue_id = t4.issue_id where t4.issue_id in (select t4.issue_id from issue_comment as t5 join issue_comment as t8 on t5.issue_id = t4.issue_id where t4.issue_id in (select t4.issue_id from issue_comment as t8 join	apache-pig 
select distinct t1.name from git_repository as t1 join change_set as t2 on t1.git_repository_id = t2.git_repository_id	apache-pig 
select count(*) from issue_comment as t1 join issue_fix_version as t2 on t1.issue_id = t2.issue_id where t2.issue_id = 'PIG-3592' group by t1.issue_id	apache-pig 
select t1.issue_id, t1.created_date, t1.resolved_date from issue as t1 join issue_comment as t2 on t1.issue_id = t2.issue_id group by t1.issue_id	apache-pig 
select issue.issue_id from issue_link join issue_comment as t1 join issue_fix_version as t2 on t1.issue_id = t2.issue_id join issue_comment as t3 on t2.issue_id =	apache-pig 
select count(*) from issue_comment where issue_id not in ( select issue_id from issue_link	apache-pig 
select count(*) from issue group by issue_id having count(*) > 1	apache-pig 
select count(*) from issue_link group by count(*) having count(*) = 1	apache-pig 
select t2.username, count(*) from issue_comment as t1 join issue_comment as t2 on t1.issue_id = t2.issue_id group by t2.username	apache-pig 
select count(distinct username) from issue_comment	apache-pig 
select t1.issue_id, count(*) from issue_comment as t1 join issue_comment as t2 on t1.issue_id = t2.issue_id group by t1.issue_id	apache-pig 
select t1.issue_id, t1.summary, t1.description from issue as t1 join issue_comment as t2 on t1.issue_id = t2.issue_id	apache-pig 
select commit_hash from issue_comment join issue_fix_version as t1 join issue_comment as t2 on t1.issue_id = t2.issue_id join issue_fix_version as t3 on t1.fix_version = t3.issue_id join issue as t4 on t3.issue_id = t4.issue_id and t4.resolved_date = t4.issue_id	apache-pig 
select	apache-pig 
select count(distinct t1.file_path) from code_change as t1 join issue_link as t2 on t1.file_path = (select t2.source_issue_id from issue_fix_version as t3 join issue_link as t4 on t3.issue_id = t2.target_issue_id where t3.issue_id = 'PIG-3599')	apache-pig 
select count(*) from issue as t1 join issue_fix_version as t2 on t1.issue_id = t2.issue_id where t1.type = "Ghost"	apache-pig 
select count(*) from issue where type = "Bitcher" intersect select count(*) from issue where type = "Initial"	apache-pig 
select issue_id from issue where type = "Git" intersect select issue_id from issue where type = "Initialization"	apache-pig 
select distinct(t1.name) from issue_link as t1 join issue_comment as t2 on t1.source_issue_id = t2.issue_id join issue_component as t3 on t2.issue_id = t3.issue_id group by t1.name	apache-pig 
select t1.type, count(*) from issue as t1 join issue_link as t2 on t1.issue_id = t2.target_issue_id where t2.name = "Clothes" group by t1.type	apache-pig 
select distinct t1.type from issue as t1 join issue_link as t2 on t1.issue_id = t2.target_issue_id where t2.name = "Clothes"	apache-pig 
select distinct type from issue	apache-pig 
select * from issue where type = "Git"	apache-pig 
select status from issue where status!= "In Progress"	apache-pig 
select count(*) from issue as t1 join issue_fix_version as t2 on t1.issue_id = t2.issue_id where t1.type = "Git"	apache-pig 
