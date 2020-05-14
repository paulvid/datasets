drop database if exists worldwidebank cascade;
Create database worldwidebank;

drop database if exists finance cascade;
Create database finance;

drop database if exists claim cascade;
create database claim;

drop database if exists cost_savings cascade;
Create database cost_savings;

---------

use worldwidebank;

DROP TABLE IF EXISTS worldwidebank.us_customers;

CREATE  EXTERNAL TABLE worldwidebank.us_customers(
 number string,
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
 nationalid string,
 mrn string,
 insuranceid string,
 eyecolor string,
 occupation string,
 company string,
 vehicle string,
 domain string,
 bloodtype string,
 weight double,
 height int,
 latitude double,
 longitude double)
ROW FORMAT DELIMITED FIELDS TERMINATED BY ','
STORED AS TEXTFILE
LOCATION 's3a://{PREFIX}-cdp-bucket/worldwidebank/us_customers/'
tblproperties("skip.header.line.count"="1");




DROP TABLE IF EXISTS worldwidebank.ww_customers;

CREATE EXTERNAL TABLE worldwidebank.ww_customers(
  gender string,
  title string,
  givenname string,
  middleinitial string,
  surname string,
  number int,
  nameset string,
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
  browser string,
  telephonenumber string,
  telephonecountrycode int,
  mothersmaiden string,
  birthday string,
  age int,
  tropicalzodiac string,
  cctype string,
  ccnumber bigint,
  cvv2 int,
  ccexpires string,
  nationalid string,
  ups string,
  mrn bigint,
  insuranceid int,
  eyecolor string,
  occupation string,
  company string,
  vehicle string,
  domain string,
  bloodtype string,
  weight double,
  kilograms double,
  feetinches string,
  height int,
  guid string,
  latitude double,
  longitude double)
ROW FORMAT DELIMITED FIELDS TERMINATED BY ','
STORED AS TEXTFILE
LOCATION 's3a://{PREFIX}-cdp-bucket/worldwidebank/ww_customers/'
tblproperties("skip.header.line.count"="1");


DROP TABLE IF EXISTS worldwidebank.eu_countries;

CREATE EXTERNAL TABLE worldwidebank.eu_countries(
  countryname string,
  countrycode string,
  region string)
ROW FORMAT DELIMITED FIELDS TERMINATED BY ','
STORED AS TEXTFILE
LOCATION 's3a://{PREFIX}-cdp-bucket/worldwidebank/eu_countries/';


-----

use finance;

DROP TABLE IF EXISTS finance.tax_2015;

CREATE EXTERNAL TABLE  finance.tax_2015(
  ssn string,
  fed_tax double,
  state_tax double,
  local_tax double)
ROW FORMAT DELIMITED FIELDS TERMINATED BY ','
STORED AS TEXTFILE
LOCATION 's3a://{PREFIX}-cdp-bucket/worldwidebank/tax_2015/';


use cost_savings;

DROP TABLE IF EXISTS cost_savings.claim_savings;

CREATE  EXTERNAL TABLE cost_savings.claim_savings(
`reportdate` date,
`name` string,
`sequenceid` int,
`claimid` int,
`costsavings` int,
`eligibilitycode` int,
`latitude` double,
`longitude` double)
ROW FORMAT DELIMITED FIELDS TERMINATED BY ','
STORED AS TEXTFILE
LOCATION 's3a://{PREFIX}-cdp-bucket/worldwidebank/claim_savings/';


-----

use claim;

-- INSERT OVERWRITE LOCAL DIRECTORY '~/provider_summary.csv' 
-- ROW FORMAT DELIMITED FIELDS TERMINATED BY ',' 
-- SELECT * FROM provider_summary;

DROP TABLE IF EXISTS claim.provider_summary;

CREATE  EXTERNAL TABLE claim.provider_summary(
`providerid` string,
`providername` string,
`providerstreetaddress` string,
`providercity` string,
`providerstate` string,
`providerzip` string,
`providerreferralregion` string,
`totaldischarges` int,
`averagecoveredcharges` decimal(10,2),
`averagetotalpayments` decimal(10,2),
`averagemedicarepayments` decimal(10,2))
ROW FORMAT DELIMITED FIELDS TERMINATED BY ','
STORED AS TEXTFILE
LOCATION 's3a://{PREFIX}-cdp-bucket/worldwidebank/provider_summary/';

