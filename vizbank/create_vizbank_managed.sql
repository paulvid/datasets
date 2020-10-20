
create table worldwidebank.employees as select * from employees_ext;
create table worldwidebank.locations as select * from locations_ext;
create table worldwidebank.covid_cases as select * from covid_cases_ext;
create table worldwidebank.us_geocodes_by_county as select * from us_geocodes_by_county_ext;


CREATE MATERIALIZED VIEW worldwidebank.employees_per_state as select locations.stname, count(*) as num_employees from employees, locations where employees.location=locations.location_id GROUP BY locations.stname;
CREATE MATERIALIZED VIEW worldwidebank.employees_and_cases_per_state as (select locations.stname as state, employees_per_state.num_employees, sum(covid_cases.confirmed) as confirmed_cases from locations, employees_per_state,  covid_cases where employees_per_state.STNAME = locations.STNAME  and covid_cases.province_state = locations.stname  and employees_per_state.STNAME = covid_cases.province_state group by locations.stname, employees_per_state.num_employees);