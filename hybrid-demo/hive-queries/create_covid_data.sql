create database if not exists worldwidebank;


use worldwidebank;

CREATE EXTERNAL TABLE if not exists worldwidebank.covid_cases_ext(
    FIPS int,
    Admin2 string,
    Province_State string,
    Country_Region string,
    Last_Update string,
    Lat string,
    Long_  string,
    Confirmed  string,
    Deaths  string,
    Recovered  string,
    Active  string,
    Combined_Key  string)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'

WITH SERDEPROPERTIES (
   "separatorChar" = "\,",
   "quoteChar"     = "\""
)
STORED AS TEXTFILE
LOCATION 's3a://pvi-e2e-cdp-bucket/raw/covid_cases/'
tblproperties("skip.header.line.count"="1");


CREATE EXTERNAL TABLE if not exists worldwidebank.us_geocodes_by_county_ext(
    zip int,
    primary_city string,
    state string,
    latitude int,
    longitude int,
    county string,
    type string,
    world_region string,
    country string,
    decommissioned string,
    estimated_population string,
    notes string)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'

WITH SERDEPROPERTIES (
   "separatorChar" = "\,",
   "quoteChar"     = "\""
)
STORED AS TEXTFILE
LOCATION 's3a://pvi-e2e-cdp-bucket/raw/us_geocodes_by_county/'
tblproperties("skip.header.line.count"="1");



create table worldwidebank.covid_cases as select * from covid_cases_ext;
create table worldwidebank.us_geocodes_by_county as select * from us_geocodes_by_county_ext;
CREATE MATERIALIZED VIEW worldwidebank.employees_and_cases_per_state as (select locations.stname as state, employees_per_state.num_employees, sum(covid_cases.confirmed) as confirmed_cases from locations, employees_per_state,  covid_cases where employees_per_state.STNAME = locations.STNAME  and covid_cases.province_state = locations.stname  and employees_per_state.STNAME = covid_cases.province_state group by locations.stname, employees_per_state.num_employees);