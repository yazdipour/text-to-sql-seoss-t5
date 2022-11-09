select count(*) from singer
select count(*) from singer
select name, country from singer order by birthday
select name, country from singer order by birthday desc
select avg(singer_id), min(singer_id), max(singer_id) from singer where country = 'F'
select avg(singer_id), min(singer_id), max(singer_id) from singer where country = 'F'
select song_name, song_release_year from singer order by birthday desc limit 1
select song_name, song_release_year from singer order by birthday desc limit 1
select distinct country from singer where birthday like "2001%"
select distinct country from singer where birthday = 2001
select country, count(*) from singer group by country
select country, count(*) from singer group by country
select song_name from singer where birthday > (select avg(birthday) from singer)
select song_name from singer where birthday > (select avg(birthday) from singer)
select location, name from stadium where capacity between 5000 and 10000
select location, name from stadium where capacity between 5000 and 10000
select avg(capacity), max(capacity) from stadium
select avg(capacity), max(capacity) from stadium
select name, capacity from stadium order by average desc limit 1
select name, capacity from stadium order by average desc limit 1
select count(*) from concert where year > 2014
select count(*) from concert where year > 2014
select t2.name, count(*) from concert as t1 join stadium as t2 on t1.stadium_id = t2.stadium_id group by t1.stadium_id
select t2.name, count(*) from concert as t1 join stadium as t2 on t1.stadium_id = t2.stadium_id group by t1.stadium_id
select t2.name, t2.capacity from concert as t1 join stadium as t2 on t1.stadium_id = t2.stadium_id where t1.year >= 2014 group by t1.stadium_id order by count(*) desc limit 1
select t2.name, t2.highest, t2.average from concert as t1 join stadium as t2 on t1.stadium_id = t2.stadium_id where t1.year > 2013 group by t1.stadium_id order by count(*) desc limit 1
select concert_name, year from concert order by year desc limit 1
select concert_name from concert order by year asc limit 1
select highest from stadium
select lowest from stadium where stadium_id not in (select stadium_id from concert)
select country from singer where birthday like "1981" or birthday like "911"
select average from stadium except select t1.average from stadium as t1 join concert as t2 on t1.stadium_id = t2.stadium_id where t2.year = 2014
select lowest from stadium except select t1.lowest from stadium as t1 join concert as t2 on t1.stadium_id = t2.stadium_id where t2.year = 2014
select t2.concert_name, t2.theme, count(*) from singer_in_concert as t1 join concert as t2 on t1.concert_id = t2.concert_id group by t1.concert_id
select t2.concert_name, t2.theme, count(*) from singer_in_concert as t1 join concert as t2 on t1.concert_id = t2.concert_id group by t1.concert_id
select t2.name, count(*) from singer_in_concert as t1 join singer as t2 on t1.singer_id = t2.singer_id group by t1.singer_id
select t2.name, count(*) from singer_in_concert as t1 join singer as t2 on t1.singer_id = t2.singer_id group by t1.singer_id
select t3.name from singer_in_concert as t1 join concert as t2 on t1.concert_id = t2.concert_id join singer as t3 on t1.singer_id = t3.singer_id where t2.year > 2014
select t3.name from singer_in_concert as t1 join concert as t2 on t1.concert_id = t2.concert_id join singer as t3 on t1.singer_id = t3.singer_id where t2.year < 2014
select name, country from singer where song_name like "%hey%"
select name, country from singer where song_name like "%hey%"
select t2.lowest, t2.highest from concert as t1 join stadium as t2 on t1.stadium_id = t2.stadium_id where t1.year = 2014 intersect select t2.lowest, t2.highest from concert as t1 join stadium as t2 on t1.stadium_id = t2.stadium_id where t1.year = 2015
select t2.lowest, t2.highest from concert as t1 join stadium as t2 on t1.stadium_id = t2.stadium_id where t1.year = 2014 intersect select t2.lowest, t2.highest from concert as t1 join stadium as t2 on t1.stadium_id = t2.stadium_id where t1.year = 2015
select count(*) from concert as t1 join stadium as t2 on t1.stadium_id = t2.stadium_id order by t2.capacity desc limit 1
select count(*) from concert as t1 join stadium as t2 on t1.stadium_id = t2.stadium_id order by t2.capacity desc limit 1
select count(*) from pets where weight > 10
select count(*) from pets where weight > 10
select weight from pets order by birthdate asc limit 1
select min(weight) from pets
select max(weight), pettype from pets group by pettype
select max(weight), pettype from pets group by pettype
select count(*) from student as t1 join has_pet as t2 on t1.stuid = t2.stuid where t1.age > 20
select count(*) from student as t1 join has_pet as t2 on t1.stuid = t2.stuid where t1.age > 20
select count(*) from has_pet as t1 join pets as t2 on t1.petid = t2.petid join student as t3 on t1.stuid = t3.stuid where t3.sex = 'F'
select count(*) from has_pet as t1 join pets as t2 on t1.petid = t2.petid join student as t3 on t1.stuid = t3.stuid where t3.sex = 'F'
select count(distinct pettype) from pets
select count(distinct pettype) from pets
select t2.fname from has_pet as t1 join student as t2 on t1.stuid = t2.stuid join pets as t3 on t1.petid = t3.petid where t3.pettype = 'kitten' or t3.pettype = 'puppy'
select t1.fname from student as t1 join has_pet as t2 on t1.stuid = t2.stuid join pets as t3 on t2.petid = t3.petid where t3.pettype = 'kitten' or t3.pettype = 'puppy'
select t1.fname from student as t1 join has_pet as t2 on t1.stuid = t2.stuid join pets as t3 on t2.petid = t3.petid where t3.pettype = 'Kitten' intersect select t1.fname from student as t1 join has_pet as t2 on t1.stuid = t2.stuid join pets as t3 on t2.petid = t3.petid where t3.pettype = 'Puppy'
select t2.fname from has_pet as t1 join student as t2 on t1.stuid = t2.stuid join pets as t3 on t1.petid = t3.petid where t3.pettype = 'kitten' intersect select t2.fname from has_pet as t1 join student as t2 on t1.stuid = t2.stuid join pets as t3 on t1.petid = t3.petid where t3.pettype = 'puppy'
select major, age from student except select t1.major, t1.age from student as t1 join has_pet as t2 on t1.stuid = t2.stuid where t2.petid in (select stuid from has_pet as t3 join pets as t4 on t3.petid = t4.petid where t4.pettype = 'kitten')
select major, age from student where stuid not in (select stuid from has_pet)
select stuid from student except select stuid from has_pet where petid in (select petid from pets where pettype = 'kitten')
select stuid from student except select stuid from has_pet where petid in (select petid from pets where pettype = 'kitten')
select fname, age from student where stuid not in (select t1.stuid from has_pet as t1 join pets as t2 on t1.petid = t2.petid where t2.pettype = 'dog')
select t1.fname from student as t1 join has_pet as t2 on t1.stuid = t2.stuid where t1.sex = "M" and t2.petid not in (select t1.stuid from has_pet as t3 join pets as t4 on t3.petid = t4.petid where t4.pettype = "dog" or t4.pettype = "kitten")
select pettype, weight from pets order by birthdate desc limit 1
select pettype, weight from pets order by birthdate desc limit 1
select petid, weight from pets where birthdate > 2020
select petid, weight from pets where birthdate > 2020
select pettype, avg(petid), max(petid) from pets group by pettype
select pettype, avg(petid), max(petid) from pets group by pettype
select pettype, avg(petid), max(petid) from pets group by pettype
select pettype, avg(weight) from pets group by pettype
select t1.fname, t1.age from student as t1 join has_pet as t2 on t1.stuid = t2.stuid join pets as t3 on t2.petid = t3.petid
select distinct t1.fname, t1.age from student as t1 join has_pet as t2 on t1.stuid = t2.stuid
select t2.petid from has_pet as t1 join pets as t2 on t1.petid = t2.petid join student as t3 on t1.stuid = t3.stuid where t3.lname = 'Smith'
select t2.petid from has_pet as t1 join pets as t2 on t1.petid = t2.petid join student as t3 on t1.stuid = t3.stuid where t3.lname = 'Smith'
select count(*), stuid from has_pet group by stuid
select stuid, count(*) from has_pet group by stuid
select t1.fname, t1.sex from student as t1 join has_pet as t2 on t1.stuid = t2.stuid group by t2.stuid having count(*) > 1
select t1.fname, t1.sex from student as t1 join has_pet as t2 on t1.stuid = t2.stuid group by t1.stuid having count(*) > 1
select t2.lname from has_pet as t1 join student as t2 on t1.stuid = t2.stuid join pets as t3 on t1.petid = t3.petid where t3.birthdate = 2001
select t2.lname from has_pet as t1 join student as t2 on t1.stuid = t2.stuid join pets as t3 on t1.petid = t3.petid where t3.birthdate = 2001
select avg(age) from student where stuid not in (select stuid from has_pet)
select avg(age) from student where stuid not in (select stuid from has_pet)
select count(*) from continents
select count(*) from continents
select t1.continent, t1.continent, count(*) from continents as t1 join countries as t2 on t1.continent = t2.continent group by t1.continent
select continent, countryname, count(*) from countries group by continent
select count(*) from countries
select count(*) from countries
select t1.fullname, t1.maker, count(*) from car_makers as t1 join model_list as t2 on t1.id = t2.maker group by t1.maker
select t1.fullname, t1.maker, count(*) from car_makers as t1 join model_list as t2 on t1.id = t2.maker group by t1.maker
select t2.model from cars_data as t1 join model_list as t2 on t1.id = t2.modelid order by t1.horsepower asc limit 1
select t2.model from cars_data as t1 join model_list as t2 on t1.id = t2.modelid order by t1.horsepower asc limit 1
select t2.model from cars_data as t1 join model_list as t2 on t1.id = t2.modelid where t1.weight < (select avg(weight) from cars_data)
select t2.model from cars_data as t1 join model_list as t2 on t1.id = t2.modelid where t1.weight < (select avg(weight) from cars_data)
select distinct t1.maker from car_makers as t1 join cars_data as t2 on t1.id = t2.makeid
select distinct t1.maker from car_makers as t1 join cars_data as t2 on t1.maker = t2.id where t2.year >= 2
select t2.make, t1.year from cars_data as t1 join car_names as t2 on t1.id = t2.makeid order by t1.year limit 1
select t1.maker, t2.year from car_makers as t1 join cars_data as t2 on t1.maker = t2.id order by t2.year limit 1
select distinct model from model_list where modelid not in (select id from cars_data where year < 1980)
select distinct t2.model from cars_data as t1 join model_list as t2 on t1.id = t2.modelid where t1.year < 1980
select t2.continent, count(*) from countries as t1 join continents as t2 on t1.continent = t2.contid group by t1.continent
select t1.continent, count(*) from continents as t1 join car_makers as t2 on t1.contid = t2.country group by t1.continent
select t1.countryname from countries as t1 join car_makers as t2 on t1.countryid = t2.country group by t1.countryid order by count(*) desc limit 1
select t1.countryname from countries as t1 join car_makers as t2 on t1.countryid = t2.country group by t1.countryid order by count(*) desc limit 1
select count(*), t1.fullname from car_makers as t1 join model_list as t2 on t1.id = t2.maker group by t1.maker
select count(*), t1.maker from car_makers as t1 join model_list as t2 on t1.id = t2.maker where t1.fullname!= "id" group by t1.maker
select avg(t2.accelerate) from car_names as t1 join cars_data as t2 on t1.makeid = t2.id where t1.make = "amc hornet sportabout (sw)"
select t2.accelerate from car_names as t1 join cars_data as t2 on t1.makeid = t2.id where t1.make = "amc hornet sportabout (sw)"
select count(*) from car_makers where country = "Japan"
select count(*) from car_makers where country = "Japan"
select count(*) from continents as t1 join countries as t2 on t1.continent = t2.countryid where t1.continent = 'America'
select count(*) from model_list as t1 join car_makers as t2 on t1.maker = t2.id where t2.country = "United States"
select avg(mpg) from cars_data where cylinders = 4
select avg(mpg) from cars_data where cylinders = 4
select min(weight) from cars_data where cylinders = 8 and year = 1974
select min(weight) from cars_data where year = 1974 and cylinders = 8
select maker, model from model_list
select maker, model from model_list
select t1.country, t1.maker from car_makers as t1 join countries as t2 on t1.country = t2.countryid
select t1.countryname, t1.countryid from countries as t1 join car_makers as t2 on t1.countryid = t2.country
select count(*) from cars_data where horsepower > 150
select count(*) from cars_data where horsepower > 150
select avg(weight), year from cars_data group by year
select avg(weight), year from cars_data group by year
select t2.countryname from car_makers as t1 join countries as t2 on t1.country = t2.countryid group by t2.countryid having count(*) >= 3
select t2.countryname from car_makers as t1 join countries as t2 on t1.country = t2.countryid group by t1.country having count(*) >= 3
select max(horsepower), t2.make from cars_data as t1 join car_names as t2 on t1.id = t2.makeid where t1.cylinders = 3
select max(horsepower) from cars_data where cylinders = 3 intersect select make from car_names group by make having count(*) >= 2
select t2.model from cars_data as t1 join model_list as t2 on t1.id = t2.modelid order by t1.mpg desc limit 1
select t2.model from cars_data as t1 join car_names as t2 on t1.id = t2.makeid order by t1.mpg desc limit 1
select avg(horsepower) from cars_data where year < 1980
select avg(horsepower) from cars_data where year < 1980
select avg(edispl) from cars_data as t1 join model_list as t2 on
select avg(edispl) from cars_data where t1.id in (select t1.id from cars_data as t1 join continents as t2 on t1.continent
select max(accelerate), cylinders from cars_data group by cylinders
select max(accelerate), cylinders from cars_data group by cylinders
select model from model_list group by model order by count(*) desc limit 1
select model from model_list group by model order by count(*) desc limit 1
select count(*) from cars_data where cylinders > 4
select count(*) from cars_data where cylinders > 4
select count(*) from cars_data where year = (select max(year) from cars_data)
select count(*) from cars_data where year = (select max(year) from cars_data)
select count(*) from model_list as t1 join car_makers as t2 on t1.maker = t2.id where t2.maker = "American Motor"
select count(*) from model_list as t1 join car_makers as t2 on t1.maker = t2.id where t2.maker = "American Motor"
select t2.fullname, t1.maker from model_list as t1 join car_makers as t2 on t1.maker = t2.id group by t1.maker having count(*) > 3
select t1.fullname, t1.maker from car_makers as t1 join model_list as t2 on t1.id = t2.maker group by t1.maker having count(*) > 3
select distinct t1.model from model_list as t1 join car_makers as t2 on t1.maker = t2.id where t2.fullname = 'General Motors' or t1.we
select distinct model from model_list as t1 join car_makers as t2 on t1.maker = t2.id where t2.fullname = "General Motors" union select distinct model from model_list as t1 join cars_data as t2 on t1.model = t2.id where t2.weight > 3500
select year from cars_data where weight Between 3000 and 4000
select distinct year from cars_data where weight < 4000 intersect select distinct year from cars_data where weight > 3000
select horsepower from cars_data order by accelerate desc limit 1
select horsepower from cars_data order by accelerate desc limit 1
select count(*) from cars_data as t1 join car_names as t2 on t1.id = t2.makeid where t1.accelerate = (select min(accelerate) from cars_data)
select cylinders from cars_data where accelerate = (select min(accelerate) from cars_data)
select count(*) from cars_data where accelerate > (select max(horsepower) from cars_data)
select count(*) from cars_data where accelerate > (select max(horsepower) from cars_data)
select count(*) from car_makers group by country having count(*) > 2
select count(*) from car_makers group by country having count(*) > 2
select count(*) from cars_data where cylinders > 6
select count(*) from cars_data where cylinders > 6
select t2.model from cars_data as t1 join model_list as t2 on t1.id = t2.modelid where t1.cylinders = 4 order by t1.horsepower desc limit 1
select t2.model from cars_data as t1 join model_list as t2 on t1.id = t2.modelid where t1.cylinders = 4 order by t1.horsepower desc limit 1
select make, t1.id from cars_data as t1 join car_names as t2 on t1.id = t2.makeid where t1.horsepower > (select min(horsepower) from cars_data) except select t1.make from car_names as t1 join cars_data as t2 on t1.make = t2.id where t2.cylinders > 3
select distinct t1.make, t2.make from car_names as t2 join cars_data as t3 on t2.makeid = t3.id join cars_data as t4 on t3.id = t4.id
select max(mpg) from cars_data where id in (select id from cars_data where cylinders = 8 union select id from cars_data where year < 1980)
select max(mpg) from cars_data where cylinders = 8 union select max(mpg) from cars_data where year < 1980
select model from model_list where weight < 3500 and make!= 'Ford Motor
select distinct t2.model from model_list as t1 join car_names as t2 on t1.modelid = t2.makeid where
select countryname from countries where countryid not in (select country from car_makers)
select countryname from countries where countryid not in (select country from car_makers)
select t1.id, t1.maker from car_makers as t1 join model_list as t2 on t1.id = t2.maker where t2.model = 2 intersect select t1.id, t1.maker from car_makers as t1 join model_list as t2 on t1.id = t2.maker group by t1.id having count(*) > 3
select t1.id, t1.maker from car_makers as t1 join model_list as t2 on t1.id = t2.modelid group by t1.maker having count(*) >= 2 intersect select t1.id, t1.maker from car_makers as t1 join car_names as t2 on t1.id = t2.makeid group by t1.maker having count(*) > 3
select t1.countryid, t1.countryname from countries as t1 join car_makers as t2 on t1.countryid = t2.country group by t1.countryid having count(*) > 3 union select t1.countryid, t1.countryname from countries as t1 join model_list as t2 on t1.countryid = t2.countryid
select t1.countryid, t1.countryname from countries as t1 join car_makers as t2 on t1.countryid = t2.country group by t1.countryid having count(*) > 3 union select t1.countryid, t1.countryname from countries as t1 join car_makers as t2 on t1.countryid = t2.country where t2.maker = (select max(maker) from car_makers)
select country from airlines where abbreviation = "JetBlue"
select country from airlines where abbreviation = "JetBlue"
select abbreviation from airlines where abbreviation = "JetBlue"
select abbreviation from airlines where abbreviation = "JetBlue"
select airline, abbreviation from airlines where country = 'USA'
select airline, abbreviation from airlines where country = 'USA'
select airportcode, airportname from airports where city = 'Jackson'
select airportcode, airportname from airports where city = "Syracuse"
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
select airportname from airports where airportname like '%jackson%'
select airportname from airports where city = "Jackson"
select count(*) from flights where sourceairport = 'APG'
select count(*) from flights where sourceairport = 'APG'
select count(*) from flights as t1 join airports as t2 on t1.destairport = t2.airport
select count(*) from flights as t1 join airports as t2 on t1.sourceairport = t2.sourceairport
select count(*) from flights where sourceairport = "Jackson"
select count(*) from flights where sourceairport = 'Jackson'
select count(*) from flights where sourceairport like "%jackson%"
select count(*) from flights where sourceairport = 'Jackson'
select count(*) from flights where sourceairport = 'Syracuse' and destairport = 'Ashley'
select count(*) from flights where sourceairport = "Syracuse" and destairport = "Ashley"
select count(*) from airlines as t1 join flights as t2 on t1.uid = t2.airline where t1.abbreviation = 'JetBlue'
select count(*) from airlines as t1 join flights as t2 on t1.uid = t2.airline where t1.abbreviation = "JetBlue"
select count(*) from flights as t1 join airports as t2 on t1.sourceairport = t2.airport
select count(*) from flights as t1 join airports as t2 on t1.sourceairport = t2.airport
select count(*) from flights where destairport = 'AHD' and airline = 'JetBlue'
select count(*) from flights where sourceairport = "AHD" and airline = "JetBlue"
select count(*) from flights as t1 join airports as t2 on t1.sourceairport = t2.airport
select count(*) from flights as t1 join airports as t2 on t1.sourceairport = t2.airport
select t2.city from flights as t1 join airports as t2 on t1.sourceairport = t2.airport
select city from airports group by city order by count(*) desc limit 1
select t2.city from flights as t1 join airports as t2 on t1.sourceairport = t2.airport
select t2.city from flights as t1 join airports as t2 on t1.sourceairport = t2.airportcode group by t2.city order by count(*) desc limit 1
select t2.airportcode from flights as t1 join airports as t2 on t1.sourceairport= t2.airportcode group by t1.sourceairport order by count(*) desc limit 1
select t1.airportcode from airports as t1 join flights as t2 on t1.airport
select t1.airportcode from airports as t1 join flights as t2 on t1.airport
select t1.airportname from airports as t1 join flights as t2 on t1.airportcode = t2.sourceairport group by t2.sourceairport order by count(*) asc limit 1
select t1.airline from flights as t1 join airlines as t2 on t1.airline = t2.uid group by t1.airline order by count(*) desc limit 1
select t1.airline from flights as t1 join airlines as t2 on t1.airline = t2.uid group by t1.airline order by count(*) desc limit 1
select t1.abbreviation, t1.country from airlines as t1 join flights as t2 on t1.uid = t2.airline group by t2.airline order by count(*) asc limit 1
select t1.abbreviation, t1.country from airlines as t1 join flights as t2 on t1.abbreviation = t2.airline group by t2.airline order by count(*) asc limit 1
select t1.airline from airlines as t1 join flights as t2 on t1.uid = t2.airline where t2.sourceairport = 'AHD'
select t1.airline from airlines as t1 join flights as t2 on t1.uid = t2.airline where t2.sourceairport = "AHD"
select t1.airline from airlines as t1 join flights as t2 on t1.uid = t2.airline where t2.sourceairport = 'AHD'
select t1.airline from airlines as t1 join flights as t2 on t1.uid = t2.airline where t2.destairport = 'AHD'
select t1.airline from airlines as t1 join flights as t2 on t1.uid = t2.airline where t2.sourceairport = 'APG' intersect select t1.airline from airlines as t1 join flights as t2 on t1.uid = t2.airline where t2.sourceairport = 'CVO'
select t1.airline from airlines as t1 join flights as t2 on t1.uid = t2.airline where t2.sourceairport = 'APG' intersect select t1.airline from airlines as t1 join flights as t2 on t1.uid = t2.airline where t2.destairport = 'CVO'
select t1.airline from airlines as t1 join flights as t2 on t1.uid = t2.airline where t2.sourceairport = 'CVO' except select t1.airline from airlines as t1 join flights as t2 on t1.uid = t2.airline where t2.sourceairport = 'APG'
select t1.airline from airlines as t1 join flights as t2 on t1.uid = t2.airline where t2.sourceairport = 'CVO' except select t1.airline from airlines as t1 join flights as t2 on t1.uid = t2.airline where t2.sourceairport = 'APG'
select t1.airline from airlines as t1 join flights as t2 on t1.uid = t2.airline group by t2.airline having count(*) >= 10
select t1.airline from airlines as t1 join flights as t2 on t1.uid = t2.airline group by t1.airline having count(*) >= 10
select airline from flights group by airline having count(*) < 200
select airline from flights group by airline having count(*) < 200
select t1.flightno from flights as t1 join airlines as t2 on t1.airline = t2.uid where t2.abbreviation = "JetBlue"
select t1.flightno from flights as t1 join airlines as t2 on t1.airline = t2.uid where t2.abbreviation = "JetBlue"
select flightno from flights where sourceairport = "APG"
select flightno from flights where sourceairport = "APG"
select flightno from flights where sourceairport = "APG"
select flightno from flights where sourceairport = "APG"
select flightno from flights where sourceairport = "Jackson"
select flightno from flights where sourceairport = "Jackson"
select t1.flightno from flights as t1 join airports as t2 on t1.sourceairport =
select flightno from flights where sourceairport = "Jackson"
select count(*) from flights where sourceairport like "%syracuse%" or destairport like "%jackson%"
select count(*) from flights where sourceairport = "Syracuse" or destairport = "Jacksonville"
select airportname from airports where airportcode not in (select sourceairport, destairport from flights)
select airport
select count(*) from documents
select count(*) from documents
select document_id, document_name, document_description from documents
select document_id, document_name, document_description from documents
select document_name, template_id from documents where document_description like '%w%'
select document_name, template_id from documents where document_description like '%w%'
select document_description from documents where document_name = "Robbin CV" and template_id in ( select template_id from templates group by template_id order by count(*) desc limit 1 )
select document_description, document_id, template_id from documents where document_name = "Robbin CV"
select count(distinct template_id) from documents
select count(distinct template_id) from documents
select count(*) from templates as t1 join documents as t2 on t1.template_id = t2.template_id where t1.template_type_code = "PPT"
select count(*) from templates as t1 join documents as t2 on t1.template_id = t2.template_id where t1.template_type_code = "PPT"
select template_id, count(*) from documents group by template_id
select template_id, count(*) from documents group by template_id
select date_effective_from from templates group by date_effective_to order by count(*) desc limit 1
select t1.date_effective_from, t1.date_effective_to from templates as t1 join documents as t2 on t1.template_id = t2.template_id group by t1.template_id order by count(*) desc limit 1
select template_id from documents group by template_id having count(*) > 1
select template_id from documents group by template_id having count(*) > 1
select template_id from templates except select template_id from documents
select template_id from templates except select template_id from documents
select count(*) from templates
select count(*) from templates
select date_effective_from, template_type_code from templates
select date_effective_from, template_type_code from templates
select distinct date_effective_from, date_effective_to from templates
select date_effective_from, date_effective_to from templates
select date_effective_from, date_effective_to from templates where template_type_code = "PP" or template_type_code = "PPT"
select date_effective_from from templates where template_type_code = "PP" or template_type_code = "PPT"
select date_effective_from from templates where template_type_code = "CV"
select date_effective_from from templates where template_type_code = "CV"
select date_effective_from, template_type_code from templates where version_number > 5
select date_effective_from, template_type_code from templates where version_number > 5
select date_effective_from, count(*) from templates group by date_effective_from
select date_effective_from, count(*) from templates group by date_effective_to
select date_effective_from from templates group by date_effective_to order by count(*) desc limit 1
select date_effective_from from templates group by date_effective_to order by count(*) desc limit 1
select date_effective_from from templates group by date_effective_to having count(*) < 3
select date_effective_to from templates group by date_effective_to having count(*) < 3
select version_number, date_effective_from, date_effective_to from templates order by version_number asc limit 1
select version_number, date_effective_from, date_effective_to from templates order by version_number asc limit 1
select t2.date_effective_from, t2.date_effective_to from documents as t1 join templates as t2 on t1.template_id = t2.template_id where t1.document_name = "Data base"
select t2.date_effective_from from documents as t1 join templates as t2 on t1.template_id = t2.template_id where t1.document_name = "Data base"
select document_name, document_id from documents as t1 join templates as t2 on t1.template_id = t2.template_id where t2.template_type_code = "BK"
select document_name from documents as t1 join templates as t2 on t1.template_id = t2.template_id where t2.template_type_code = "BK"
select date_effective_from, date_effective_to, count(*) from templates group by template_type_code
select t1.date_effective_from, t1.date_effective_to, count(*) from templates as t1 join documents as t2 on t1.template_id = t2.template_id group by t1.template_type_code
select t1.date_effective_from from templates as t1 join documents as t2 on t1.template_id = t2.template_id group by t1.date_effective_to order by count(*) desc limit 1
select date_effective_from from templates group by date_effective_to order by count(*) desc limit 1
select date_effective_from, date_effective_to from templates except select t1.date_effective_from, t1.date_effective_to from templates as t1 join documents as t2 on t1.template_id = t2.template_id
select date_effective_from, date_effective_to from templates except select t1.date_effective_from, t1.date_effective_to from templates as t1 join documents as t2 on t1.template_id = t2.template_id
select template_type_code, template_type_description from ref_template_types
select template_type_code, template_type_description from ref_template_types
select template_type_description from ref_template_types where template_type_code = "AD"
select template_type_description from ref_template_types where template_type_code = "AD"
select template_type_code from ref_template_types where template_type_description = "Book"
select template_type_code from ref_template_types where template_type_description = "Book"
select distinct t1.template_type_description from ref_template_types as t1 join templates as t2 on t1.template_type_code = t2.template_type_code join documents as t3 on t2.template_id = t3.template_id
select distinct t1.template_type_description from ref_template_types as t1 join templates as t2 on t1.template_type_code = t2.template_type_code join documents as t3 on t2.template_id = t3.template_id
select t1.date_effective_from, t1.date_effective_to from templates as t1 join ref_template_types as t2 on t1.template_type_code = t2.template_type_code where t2.template_type_description = "Presentation"
select t1.date_effective_from from templates as t1 join ref_template_types as t2 on t1.template_type_code = t2.template_type_code where t2.template_type_description = "Presentation"
select t1.first_name, t1.last_name from players as t1 join matches as t2 on t1.player_id = t2.loser_id
select t1.first_name, t1.last_name, t1.player_id from players as t1 join matches as t2 on t1.player_id =
select loser_age, winner_age from matches
select loser_age, winner_age from matches
select first_name, birth_date from players where country_code = 'USA'
select first_name, birth_date from players where country_code = 'USA'
select avg(loser_age), avg(winner_age) from matches
select avg(loser_age), avg(winner_age) from matches
select avg(winner_rank), t1.loser_rank from matches as t1 join rankings as t2 on t1.loser_id = t2.player_id group by t1.loser_id
select avg(loser_rank), winner_rank from matches group by winner_rank
select max(winner_rank), min(loser_rank) from matches group by winner_rank
select t1.winner_rank, t1.loser_rank from matches as t1 join rankings as t2 on t1.winner_id = t2.player_id
select count(distinct country_code) from players
select count(distinct country_code) from players
select count(distinct loser_name) from matches
select count(distinct loser_name) from matches
select tourney_name from matches group by tourney_name having count(*) > 10
select tourney_name from matches group by tourney_id having count(*) > 10
select t1.winner_name, t1.loser_name from matches as t1 join players as t2 on t1.winner_id = t2.player_id where t1.year = 2013 intersect select t1.winner_name, t1.loser_name from matches as t1 join players as t2 on t1.loser_id = t2.player_id where t1.year = 2016
select t1.winner_name, t1.loser_name from matches as t1 join players as t2 on t1.winner_id = t2.player_id where t1.year = 2013 intersect select t1.winner_name, t1.loser_name from matches as t1 join players as t2 on t1.loser_id = t2.player_id where t1.year = 2016
select t1.first_name, t1.last_name from players as t1 join matches as t2 on t1.player_id =
select winner_name, loser_name from matches where year = 2013 or year = 2016
select t1.country_code, t1.first_name from players as t1 join matches as t2 on t1.player_id = t2.winner_id where t2.tourney_name = "WTA Championships" intersect select t1.country_code, t1.first_name from players as t1 join matches as t2 on t1.player_id = t2.winner_id join matches as t3 on t2.tourney_id = t3.winner_id where t2.tourney_name = "Australian Open"
select t1.first_name, t1.country_code from players as t1 join matches as t2 on t1.player_id = t2.winner_id where t2.tourney_name = 'WTA Championships' intersect select t1.first_name, t1.country_code from players as t1 join matches as t2 on t1.player_id = t2.winner_id where t2.tourney_name = 'Australian Open'
select first_name, country_code from players order by birth_date desc limit 1
select first_name, country_code from players order by birth_date desc limit 1
select first_name, last_name from players order by birth_date

select first_name, last_name from players where hand = 'L' order by birth_date
select first_name, last_name from players where hand = 'L' order by birth_date
select t1.first_name, t1.country_code from players as t1 join rankings as t2 on t1.player_id = t2.player_id group by t2.player_id order by count(*) desc limit 1
select t1.first_name, t1.country_code from players as t1 join rankings as t2 on t1.player_id = t2.player_id group by t2.player_id order by count(*) desc limit 1
select year from matches group by year order by count(*) desc limit 1
select year from matches group by year order by count(*) desc limit 1
select t1.winner_name, t1.winner_rank_points from matches as t1 join rankings as t2 on t1.winner_id = t2.player_id group by t2.player_id order by count(*) desc limit 1
select t1.winner_name, t1.winner_rank_points from matches as t1 join rankings as t2 on t1.winner_id = t2.player_id group by t2.player_id order by count(*) desc limit 1
select winner_name, loser_name from matches where tourney_name = "Australian Open" and winner_rank_points = (select max(winner_rank_points) from matches where tourney_name = "Australian Open")
select t1.winner_name, t1.loser_name from matches as t1 join rankings as t2 on t1.winner_id = t2.player_id where t1.tourney_name = "Australian Open"
select best_of, loser_name from matches order by minutes desc limit 1
select t1.winner_name, t1.loser_name from matches as t1 join players as t2 on t1.loser_id = t2.player_id order by t1.minutes desc limit 1
select t1.first_name, avg(t2.ranking) from players as t1 join rankings as t2 on t1.player_id = t2.player_id group by t1.player_id
select t1.first_name, avg(t2.ranking) from players as t1 join rankings as t2 on t1.player_id = t2.player_id group by t1.first_name
select sum(ranking_points), t1.first_name, t1.last_name from players as t1 join rankings as t2 on t1.player_id = t2.player_id group by t1.player_id
select t1.first_name, t1.last_name, sum(t2.ranking_points) from players as t1 join rankings as t2 on t1.player_id = t2.player_id group by t1.player_id
select country_code, count(*) from players group by country_code
select country_code, count(*) from players group by country_code
select country_code from players group by country_code order by count(*) desc limit 1
select country_code from players group by country_code order by count(*) desc limit 1
select country_code from players group by country_code having count(*) > 50
select country_code from players group by country_code having count(*) > 50
select ranking_date, count(*) from rankings group by ranking_date
select ranking_date, sum(tours) from rankings group by ranking_date
select count(*), year from matches group by year
select count(*), year from matches group by year
select winner_name, winner_rank from matches order by winner_age asc limit 3
select winner_name, winner_rank from matches order by winner_age asc limit 3
select count(distinct winner_hand) from matches where tourney_name = "WTA Championships" and winner_hand = "L"
select count(*) from matches where winner_hand = 'L' and tourney_name = 'WTA Championships'
select winner_name, birth_date from matches as t1 join rankings as t2 on t1.winner_ioc = t2.winner_id
select t1.first_name, t1.last_name, t1.birth_date from players as t1 join matches as t2 on t1.player_id = t2.winner_id group by t2.winner_id order by count(*) desc limit 1
select hand, count(*) from players group by hand
select hand, count(*) from players group by hand
select distinct line_1 from addresses
select line_1 from addresses order by line_3
select count(*) from show where if_first_show = 'T'
select count(*) from show where if_first_show = 'T'
select name from conductor order by birthday asc
select name from conductor order by birthday asc
select name from conductor where nationality = 'USA'
select name from conductor where nationality = 'USA'
select record_company from orchestra order by year_of_founded asc
select record_company from orchestra order by year_of_founded asc
select avg(attendance) from show where if_first_show!= 'F'
select avg(attendance) from show where if_first_show!= 'F'
select max(share), min(share) from performance where type!= "Live final"
select max(share), min(share) from performance where type!= "Live final"
select count(distinct nationality) from conductor
select count(distinct nationality) from conductor
select name from conductor order by birthday asc
select name from conductor order by birthday asc
select name from conductor order by year_of_work desc
select name from conductor order by year_of_work desc
select t2.name, t1.orchestra from orchestra as t1 join conductor as t2 on t1.conductor_id = t2.conductor_id
select t2.name, t1.orchestra from orchestra as t1 join conductor as t2 on t1.conductor_id = t2.conductor_id
select t2.name from orchestra as t1 join conductor as t2 on t1.conductor_id = t2.conductor_id group by t2.name having count(*) > 1
select t1.name from conductor as t1 join orchestra as t2 on t1.conductor_id = t2.conductor_id group by t2.conductor_id having count(*) > 1
select t2.name from orchestra as t1 join conductor as t2 on t1.conductor_id = t2.conductor_id group by t2.name order by count(*) desc limit 1
select t2.name from orchestra as t1 join conductor as t2 on t1.conductor_id = t2.conductor_id group by t2.name order by count(*) desc limit 1
select t2.name from orchestra as t1 join conductor as t2 on t1.conductor_id = t2.conductor_id order by t1.year_of_work
select t2.name from orchestra as t1 join conductor as t2 on t1.conductor_id = t2.conductor_id order by t1.year_of_work
select record_company, count(*) from orchestra group by record_company
select record_company, count(*) from orchestra group by record_company
select major_record_format from orchestra order by year_of_founded asc
select major_record_format from orchestra order by year_of_founded asc
select record_company from orchestra order by year_of_founded asc
select record_company from orchestra order by year_of_founded desc limit 1
select orchestra from orchestra where orchestra_id not in (select orchestra_id from performance)
select orchestra from orchestra where orchestra_id not in (select orchestra_id from performance)
select record_company from orchestra where year_of_founded < 2003
select record_company from orchestra where year_of_founded > 2003 intersect select record_company from orchestra where year_of_founded < 2003
select count(*) from show where result = "Glebe Park"
select count(*) from show where result = "Glebe Park"
select t1.type from performance as t1 join show as t2 on t1.performance_id = t2.performance_id group by t2.performance_id having count(*) > 1
select type from performance group by type having count(*) > 1
select state from owners intersect select state from professionals
select state from owners intersect select state from professionals
select avg(age) from dogs where dog_id in ( select dog_id from treatments )
select avg(age) from dogs as t1 join treatments as t2 on t1.dog_id = t2.dog_id
select t1.professional_id, t1.last_name, t1.cell_number from professionals as t1 join treatments as t2 on t1.professional_id = t2.professional_id group by t1.professional_id having t1.state = 'Indiana' union select t1.professional_id, t1.last_name, t1.cell_number from professionals as t1 join treatments as t2 on t1.professional_id = t2.professional_id group by t1.professional_id having count(*) > 2
select t1.professional_id, t1.last_name, t1.cell_number from professionals as t1 join treatments as t2 on t1.professional_id = t2.professional_id group by t1.professional_id having t1.state = "Indiana" union select t1.professional_id, t1.last_name, t1.cell_number from professionals as t1 join treatments as t2 on t1.professional_id = t2.professional_id group by t1.professional_id having count(*) > 2
select name from dogs except select t2.name from treatments as t1 join dogs as t2 on t1.dog_id = t2.dog_id where t1.cost_of_treatment > 1000
select t2.name from treatments as t1 join dogs as t2 on t1.dog_id = t2.dog_id where t1.cost_of_treatment > 1000
select first_name from professionals union select first_name from owners except select t2.first_name from dogs as t1 join professionals as t2 on t1.dog_id = t2.professional_id
select first_name from professionals union select first_name from owners except select t2.first_name from dogs as t1 join professionals as t2 on t1.dog_id = t2.professional_id
select professional_id, first_name, last_name from professionals except select t1.professional_id, t2.first_name from treatments as t1 join professionals as t2 on t1.professional_id = t2.professional_id
select professional_id, first_name, last_name from professionals except select t1.professional_id, t2.first_name from treatments as t1 join professionals as t2 on t1.professional_id = t2.professional_id
select t1.owner_id, t2.first_name from dogs as t1 join owners as t2 on t1.owner_id = t2.owner_id group by t1.owner_id order by count(*) desc limit 1
select t1.owner_id, t2.first_name from dogs as t1 join owners as t2 on t1.owner_id = t2.owner_id group by t1.owner_id order by count(*) desc limit 1
select t1.professional_id, t1.home_phone, t1.email_address from professionals as t1 join treatments as t2 on t1.professional_id = t2.professional_id group by t1.professional_id having count(*) >= 2
select t1.professional_id, t1.home_phone, t1.email_address from professionals as t1 join treatments as t2 on t1.professional_id = t2.professional_id group by t1.professional_id having count(*) >= 2
select t1.breed_name from breeds as t1 join dogs as t2 on t1.breed_code = t2.breed_code group by t1.breed_code order by count(*) desc limit 1
select t2.breed_name from dogs as t1 join breeds as t2 on t1.breed_code = t2.breed_code group by t1.breed_code order by count(*) desc limit 1
select t1.owner_id, t1.last_name from owners as t1 join dogs as t2 on t1.owner_id = t2.owner_id group by t1.owner_id order by count(*) desc limit 1
select t1.owner_id, t1.last_name from owners as t1 join dogs as t2 on t1.owner_id = t2.owner_id join treatments as t3 on t3.dog_id = t2.dog_id group by t1.owner_id order by sum(t3.cost_of_treatment) desc limit 1
select t1.treatment_type_description from treatment_types as t1 join treatments as t2 on t1.treatment_type_code = t2.treatment_type_code group by t1.treatment_type_code order by sum(t2.cost_of_treatment) asc limit 1
select t1.treatment_type_description from treatment_types as t1 join treatments as t2 on t1.treatment_type_code = t2.treatment_type_code group by t1.treatment_type_code order by sum(t2.cost_of_treatment) asc limit 1
select t1.owner_id, t1.zip_code from owners as t1 join dogs as t2 on t1.owner_id = t2.owner_id group by t1.owner_id order by sum(t2.charge_amount
select t1.owner_id, t1.zip_code from owners as t1 join dogs as t2 on t1.owner_id = t2.owner_id group by t1.owner_id order by sum(t2.cost_of_treatment
select t1.professional_id, t1.first_name from professionals as t1 join treatments as t2 on t1.professional_id = t2.professional_id group by t1.professional_id having count(*) >= 2
select t1.professional_id, t1.home_phone, t1.email_address from professionals as t1 join treatments as t2 on t1.professional_id = t2.professional_id group by t1.professional_id having count(*) >= 2
select t1.first_name, t1.last_name from professionals as t1 join treatments as t2 on t1.professional_id = t2.professional_id where t2.cost_of_treatment < ( select avg(cost_of_treatment) from treatments)
select t2.first_name, t2.last_name from treatments as t1 join professionals as t2 on t1.professional_id = t2.professional_id where t1.cost_of_treatment < ( select avg(cost_of_treatment) from treatments)
select date_of_treatment, t3.first_name, t3.last_name from treatments as t1 join professionals as t2 on t1.professional_id = t2.professional_id join treatment_types as
select t1.date_of_treatment, t2.first_name, t2.last_name from treatments as t1 join professionals as t2 on t1.professional_id = t2.professional_id
select t1.cost_of_treatment, t2.treatment_type_description from treatments as t1 join treatment_types as t2 on t1.treatment_type_code = t2.treatment_type_code
select t1.cost_of_treatment, t2.treatment_type_description from treatments as t1 join treatment_types as t2 on t1.treatment_type_code = t2.treatment_type_code
select t2.first_name, t2.last_name, t1.size_code from dogs as t1 join owners as t2 on t1.owner_id = t2.owner_id
select t1.first_name, t1.last_name, t2.size_code from owners as t1 join dogs as t2 on t1.owner_id = t2.owner_id
select t2.first_name, t2.last_name from dogs as t1 join owners as t2 on t1.owner_id = t2.owner_id join dogs as t3 on t1.dog_id = t3.dog_id
select t2.first_name, t2.last_name from dogs as t1 join owners as t2 on t1.owner_id = t2.owner_id join breeds as t3 on t1.breed_code = t3.breed_code
select t2.name, t1.date_of_treatment from treatments as t1 join dogs as t2 on t1.dog_id = t2.dog_id where t2.breed_code = (select breed_code from dogs group by breed_code order by count(*) desc limit 1)
select name, date_of_treatment from treatments as t1 join dogs as t2 on t1.dog_id = t2.dog_id where t2.breed_code = (select breed_code from dogs group by breed_code order by count(*) desc limit 1)
select first_name, name from owners as t1 join dogs as t2 on t1.owner_id = t2.owner_id where t1.state = 'VA'
select t2.first_name, t3.name from dogs as t1 join owners as t2 on t1.owner_id = t2.owner_id join dogs as t3 on t1.dog_id = t3.dog_id where t2.state = 'VA'
select t1.date_of_treatment from treatments as t1 join dogs as t2 on t1.dog_id = t2.dog_id order by t2.date_arrived - t2.date_departed
select date_of_treatment, date_arrived from treatments as t1 join dogs as t2 on t1.dog_id = t2.dog_id order by t2.date_arrived, t2.date_departed
select t2.last_name from dogs as t1 join owners as t2 on t1.owner_id = t2.owner_id order by t1.age asc limit 1
dog
select email_address from professionals where state = "HI" or state = "WI"
select email_address from professionals where state = "HI" or state = "WI"
select date_arrived, date_departed from dogs where abandoned_yn = '1'
select date_arrived, date_departed from dogs where abandoned_yn = '1'
select count(*) from treatments
select count(*) from treatments
select count(distinct professional_id) from treatments
select count(distinct professional_id) from treatments
select first_name, last_name from professionals where city like "%west%"
select first_name, last_name from professionals where city like "%west%"
select first_name, last_name from owners where state like '%north%'
select first_name, last_name from owners where state like "%north%"
select count(*) from dogs where age < (select avg(age) from dogs)
select count(*) from dogs where age < (select avg(age) from dogs)
select max(cost_of_treatment) from treatments
select cost_of_treatment from treatments order by date_of_treatment desc limit 1
select count(*) from dogs where abandoned_yn not in ( select dog_id from treatments )
select count(*) from treatments
select count(*) from owners where owner_id not in ( select owner_id from dogs where abandoned_yn = '1' )
select count(*) from owners where owner_id not in ( select owner_id from dogs where abandoned_yn = '1' )
select count(*) from professionals where professional_id not in ( select professional_id from treatments )
select count(*) from professionals where professional_id not in ( select professional_id from treatments )
select name, age, weight from dogs where abandoned_yn = '1'
select name, age, weight from dogs where abandoned_yn = '1'
select avg(age) from dogs where abandoned_yn = '1'
select avg(age) from dogs where abandoned_yn = 1
select age from dogs order by age desc limit 1
select age from dogs order by age desc limit 1
select charge_type, charge_amount from charges group by charge_type
select charge_type, charge_amount from charges group by charge_type
select charge_type, max(charge_amount) from charges group by charge_type
select charge_amount from charges order by charge_type desc limit 1
select email_address, first_name, last_name from professionals
select email_address, first_name, last_name from professionals
select count(distinct breed_code), count(distinct size_code) from dogs
select distinct breed_code, size_code from dogs
select t1.first_name, t1.last_name, t3.treatment_type_description from professionals as t1 join treatments as t2 on t1.professional_id = t2.professional_id join treatment_types as t3 on t2.treatment_type_code = t3.treatment_type_code
select t1.first_name, t1.last_name, t3.treatment_type_description from professionals as t1 join treatments as t2 on t1.professional_id = t2.professional_id join treatment_types as t3 on t2.treatment_type_code = t3.treatment_type_code
select count(*) from singer
select count(*) from singer
select name from singer order by birth_year asc
select name from singer order by birth_year asc
select birth_year, citizenship from singer
select birth_year, citizenship from singer
select name from singer where name!= "French"
select name from singer where citizenship!= "French"
select name from singer where birth_year <
select name from singer where birth_year <
select name from singer order by birth_year asc limit 1
select name from singer order by birth_year asc limit 1
select citizenship, count(*) from singer group by citizenship
select citizenship, count(*) from singer group by citizenship
select citizenship from singer group by citizenship order by count(*) desc limit 1
select citizenship from singer group by citizenship order by count(*) desc limit 1
select citizenship, max(net_worth_millions) from singer group by citizenship
select citizenship, max(net_worth_millions) from singer group by citizenship
select title from song order by sales desc limit 1
select title from song order by sales desc limit 1
select distinct t1.name from singer as t1 join song as t2 on t1.singer_id = t2.singer_id where t2.sales > 300000
select distinct t1.name from singer as t1 join song as t2 on t1.singer_id = t2.singer_id where t2.sales > 300000
select t1.name from singer as t1 join song as t2 on t1.singer_id = t2.singer_id group by t2.singer_id having count(*) > 1
select t1.name from singer as t1 join song as t2 on t1.singer_id = t2.singer_id group by t2.singer_id having count(*) > 1
select t2.name, max(t1.highest_position) from song as t1 join singer as t2 on t1.singer_id = t2.singer_id group by t2.singer_id
select max(highest_position), t1.name from singer as t1 join song as t2 on t1.singer_id = t2.singer_id group by t1.name
select name from singer where singer_id not in (select singer_id from song)
select name from singer where singer_id not in (select singer_id from song)
select citizenship from singer where birth_year <= 1945 or birth_year > 1945
select citizenship from singer where birth_year <
