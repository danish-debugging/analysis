select count(*) from world.covid_data;

select * from world.covid_data limit 10;

# range of dates selected 1st oct to 20th Nov
select min(covid_data.`Date Announced`) from world.covid_data; select max(covid_data.`Date Announced`) from world.covid_data;

select distinct(covid_data.`Date Announced`) as Date_reported, count(*) as no_of_records from world.covid_data
group by Date_reported order by Date_reported;

Select distinct(covid_data.`age bracket`) from world.covid_data;

Select distinct(covid_data.gender) from world.covid_data;

select count(gender) from world.covid_data;

Select distinct(covid_data.gender) as gender, count(*) as no_of_records
from world.covid_data group by gender;

Select distinct(covid_data.`Detected state`) from world.covid_data;

Select distinct(covid_data.`Detected state`) from world.covid_data
order by world.covid_data.`Detected State`;

Select distinct(covid_data.`Detected state`), covid_data.`state code` from world.covid_data
order by world.covid_data.`State code`,world.covid_data.`Detected State`;

# data cleaning is required
# keeping all the state names consistent
# take a backup - Version control

drop table world.covid_clean_data;
create table world.covid_clean_data as select * from world.covid_data;
#SET SQL_SAFE_UPDATES = 0;

update world.covid_clean_data set world.covid_clean_data.`Detected state` = 'Andhra Pradesh' where world.covid_clean_data.`State code` = 'AP';

#copy pasting existing lines with new table
Select distinct(world.covid_clean_data.`Detected state`), world.covid_clean_data.`state code`
from world.covid_clean_data
order by world.covid_clean_data.`State code`,world.covid_clean_data.`Detected State`;

select distinct(world.covid_clean_data.`Current Status`) from world.covid_clean_data;

#performing similar operation using case when statement update world.covid_clean_data
set covid_clean_data.`Current Status` =
case
when world.covid_clean_data.`Current Status` = 'migrated_other' then 'Others'
else world.covid_clean_data.`Current Status`
end;

select distinct(world.covid_clean_data.`Current Status`) from world.covid_clean_data describe world.covid_clean_data;