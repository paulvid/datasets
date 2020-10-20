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
ROW FORMAT DELIMITED FIELDS TERMINATED BY ','
STORED AS TEXTFILE
LOCATION '/user/viz_user/vizbank/raw/employees/'
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
ROW FORMAT DELIMITED FIELDS TERMINATED BY ','
STORED AS TEXTFILE
LOCATION '/user/viz_user/vizbank/raw/locations/'
tblproperties("skip.header.line.count"="1");

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
ROW FORMAT DELIMITED FIELDS TERMINATED BY ','
STORED AS TEXTFILE
LOCATION '/user/viz_user/vizbank/raw/covid_cases/'
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
ROW FORMAT DELIMITED FIELDS TERMINATED BY ','
STORED AS TEXTFILE
LOCATION '/user/viz_user/vizbank/raw/us_geocodes_by_county/'
tblproperties("skip.header.line.count"="1");



