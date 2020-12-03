create database if not exists worldwidebank;


use worldwidebank;

CREATE EXTERNAL TABLE if not exists worldwidebank.employees_ext(
 number int,
 location int,
 gender string,
 title string,
 givenname string,
 middleinitial string,
 surname string,
 streetaddress string, 
 city string,
 state string,
 statefull string,
 zipcode string,
 country string,
 countryfull string,
 emailaddress string,
 username string,
 password string,
 telephonenumber string,
 telephonecountrycode string,
 mothersmaiden string,
 birthday string,
 age int,
 tropicalzodiac string,
 cctype string,
 ccnumber string,
 cvv2 string,
 ccexpires string,
 ssn string,
 insuranceid string,
 salary string,
 bloodtype string,
 weight double,
 height int)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'

WITH SERDEPROPERTIES (
   "separatorChar" = "\,",
   "quoteChar"     = "\""
)
STORED AS TEXTFILE
LOCATION 's3a://pvi-e2e-cdp-bucket/raw/employees/'
tblproperties("skip.header.line.count"="1");




CREATE EXTERNAL TABLE if not exists worldwidebank.locations_ext(
    LOCATION_ID int,
    ADDRESS string,
    BKCLASS string,
    CBSA string,
    CBSA_DIV string,
    CBSA_DIV_FLG string,
    CBSA_DIV_NO string,
    CBSA_METRO string,
    CBSA_METRO_FLG string,
    CBSA_METRO_NAME string,
    CBSA_MICRO_FLG string,
    CBSA_NO string,
    CERT string,
    CITY string,
    COUNTY string,
    CSA string,
    CSA_FLG string,
    CSA_NO string,
    ESTYMD string,
    FI_UNINUM string,
    MAINOFF string,
    NAME string,
    OFFNAME string,
    OFFNUM string,
    RUNDATE string,
    SERVTYPE string,
    STALP string,
    STCNTY string,
    STNAME string,
    UNINUM string,
    ZIP int)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'

WITH SERDEPROPERTIES (
   "separatorChar" = "\,",
   "quoteChar"     = "\""
)
STORED AS TEXTFILE
LOCATION 's3a://pvi-e2e-cdp-bucket/raw/locations/'
tblproperties("skip.header.line.count"="1");


create table worldwidebank.employees as select * from worldwidebank.employees_ext;
create table worldwidebank.locations as select * from worldwidebank.locations_ext;

CREATE MATERIALIZED VIEW worldwidebank.employees_per_state as select locations.stname, count(*) as num_employees from employees, locations where employees.location=locations.location_id GROUP BY locations.stname;
