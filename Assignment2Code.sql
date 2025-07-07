-- __/\\\\\\\\\\\__/\\\\\_____/\\\__/\\\\\\\\\\\\\\\____/\\\\\_________/\\\\\\\\
\_________/\\\\\\\________/\\\\\\\________/\\\\\\\________/\\\\\\\\\
\________________/\\\\\\\\\_______/\\\\\\\\\_____
-- _\/////\\\///__\/\\\\\\___\/\\\_\/\\\///////////___/\\\///\\\_____/\\\///////\\
\_____/\\\/////\\\____/\\\/////\\\____/\\\/////\\\____/\\\///////\\\_____________/\
\\\\\\\\\\\\___/\\\///////\\\___
-- _____\/\\\_____\/\\\/\\\__\/\\\_\/\\\____________/\\\/__\///\\\__\///
______\//\\\___/\\\____\//\\\__/\\\____\//\\\__/\\\____\//\\\__\///______/\\
\_____________/\\\/////////\\\_\///______\//\\\__
-- _____\/\\\_____\/\\\//\\\_\/\\\_\/\\\\\\\\\\\___/\\\______\//\\\___________/\
\\/___\/\\\_____\/\\\_\/\\\_____\/\\\_\/\\\_____\/\\\_________/\\\//
_____________\/\\\_______\/\\\___________/\\\/___
-- _____\/\\\_____\/\\\\//\\\\/\\\_\/\\\///////___\/\\\_______\/\\\________/\\
\//_____\/\\\_____\/\\\_\/\\\_____\/\\\_\/\\\_____\/\\\________\////\\
\____________\/\\\\\\\\\\\\\\\________/\\\//_____
-- _____\/\\\_____\/\\\_\//\\\/\\\_\/\\\__________\//\\\______/\\\______/\\
\//________\/\\\_____\/\\\_\/\\\_____\/\\\_\/\\\_____\/\\\___________\//\\
\___________\/\\\/////////\\\_____/\\\//________
-- _____\/\\\_____\/\\\__\//\\\\\\_\/\\\___________\///\\\__/\\\______/\\\/
___________\//\\\____/\\\__\//\\\____/\\\__\//\\\____/\\\___/\\\______/\\
\____________\/\\\_______\/\\\___/\\\/___________
-- __/\\\\\\\\\\\_\/\\\___\//\\\\\_\/\\\_____________\///\\\\\/______/\\\\\\
\\\\\\\\\__\///\\\\\\\/____\///\\\\\\\/____\///\\\\\\\/___\///\\\\\\\\\/
_____________\/\\\_______\/\\\__/\\\\\\\\\\\\\\\_
--
_\///////////__\///_____\/////__\///________________\/////_______\///////////////
_____\///////________\///////________\///////_______\/////////_______________\///
________\///__\///////////////__
-- Your Name: Collin Teo
-- Your Student Number: 1615869
-- By submitting, you declare that this work was completed entirely by yourself.
--
___________________________________________________________________________________
___________________________________________________________________________________
______________________________________
-- BEGIN Q1
SELECT electric_vehicle.model_name,electric_vehicle.battery_capacity
FROM electric_vehicle
WHERE electric_vehicle.battery_capacity=(
SELECT MAX(battery_capacity) from electric_vehicle
);
-- END Q1
--
___________________________________________________________________________________
___________________________________________________________________________________
______________________________________
-- BEGIN Q2
SELECT DISTINCT charging_station.station_id,charging_station.state,
charging_station.postcode
FROM charging_station
INNER JOIN outlet ON
charging_station.station_id=outlet.station_id
WHERE charging_rate>=100
ORDER BY charging_station.station_id;
-- END Q2
--
___________________________________________________________________________________
___________________________________________________________________________________
______________________________________
-- BEGIN Q3
SELECT charging_station.station_id FROM charging_station
WHERE charging_station.station_id NOT IN
(
SELECT station_id FROM facility
);
-- END Q3
--
___________________________________________________________________________________
___________________________________________________________________________________
______________________________________
-- BEGIN Q4
SELECT person.license_num,person.person_name, COUNT(electric_vehicle.license_num)
as total_num_of_cars_with_no_charge_event_registered_to_person from
electric_vehicle
LEFT JOIN charging_event ON
charging_event.vin = electric_vehicle.vin
INNER JOIN person ON
electric_vehicle.license_num= person.license_num
WHERE charging_event.VIN IS NULL
GROUP BY person.person_name,person.license_num;
-- END Q4
--
___________________________________________________________________________________
___________________________________________________________________________________
______________________________________
-- BEGIN Q5
SELECT DISTINCT coupon.facility_id from coupon
WHERE coupon.facility_id NOT IN
(
SELECT DISTINCT coupon.facility_id FROM coupon
INNER JOIN charging_event ON
coupon.coupon_id= charging_event.coupon_id
WHERE DATE(requested_at)=DATE('2025-01-01')
);
-- END Q5
--
___________________________________________________________________________________
___________________________________________________________________________________
______________________________________
-- BEGIN Q6
SELECT electric_vehicle.model_name,electric_vehicle.model_year,
company.company_name,
ROUND(AVG(charging_event.kwh),2) as rounded_average_kwh
from electric_vehicle
INNER JOIN charging_event ON
electric_vehicle.vin= charging_event.vin
AND charging_event.kwh IS NOT NULL
INNER JOIN outlet ON
outlet.station_id= charging_event.station_id
and outlet.outlet_number=charging_event.outlet_number
INNER JOIN company ON
company.abn=electric_vehicle.abn
WHERE outlet.charging_rate>68 and charging_event.kwh IS NOT NULL
GROUP BY electric_vehicle.model_name,electric_vehicle.model_year,
company.company_name
HAVING AVG(charging_event.kwh)>50;
-- END Q6
--
___________________________________________________________________________________
___________________________________________________________________________________
______________________________________
-- BEGIN Q7
SELECT COUNT(electric_vehicle.vin) FROM electric_vehicle
WHERE electric_vehicle.abn IN (
SELECT abn from company
WHERE abn=1 OR parent_abn=1
OR parent_abn IN (
SELECT abn from company
WHERE parent_abn=1
)
);
-- END Q7
--
___________________________________________________________________________________
___________________________________________________________________________________
______________________________________
-- BEGIN Q8
SELECT DISTINCT electric_vehicle.vin from electric_vehicle
INNER JOIN charging_event ON
charging_event.vin= electric_vehicle.vin
WHERE charging_event.vin NOT IN
(
SELECT electric_vehicle.vin from electric_vehicle
INNER JOIN charging_event ON
charging_event.vin= electric_vehicle.vin and
charging_event.license_num=electric_vehicle.license_num
);
-- END Q8
--
___________________________________________________________________________________
___________________________________________________________________________________
______________________________________
-- BEGIN Q9
SELECT ce1.license_num,ce1.vin FROM charging_event as ce1
#Join every entity that's involved
INNER JOIN electric_vehicle as ev1 ON
ce1.vin= ev1.vin
INNER JOIN charging_station as cs1 ON
ce1.station_id=cs1.station_id
INNER JOIN company_owns_station as cos1 ON
cos1.station_id=cs1.station_id
INNER JOIN company as cmp1 ON
cmp1.abn=cos1.abn
WHERE
cs1.postcode>=3000 AND cs1.postcode<4000
AND
ev1.abn=cmp1.abn
AND NOT EXISTS(
#Get that outlet that the specific person hasn't charged in
SELECT * FROM outlet as o2
INNER JOIN charging_station as cs2 ON
o2.station_id= cs2.station_id
INNER JOIN company_owns_station as cos2 ON
cs2.station_id = cos2.station_id
WHERE cs2.postcode>=3000 AND cs2.postcode<4000
AND cos2.abn=ev1.abn
AND NOT EXISTS (
#Check if person has charged in that specific outlet
SELECT * FROM charging_event ce2
WHERE ce2.vin = ce1.vin
AND ce2.license_num = ce1.license_num
AND ce2.station_id = o2.station_id
AND ce2.outlet_number = o2.outlet_number
)
)
GROUP BY ce1.license_num,ce1.vin;
-- END Q9
--
___________________________________________________________________________________
___________________________________________________________________________________
______________________________________
-- BEGIN Q10
SELECT ROUND(SUM(charging_event.kwh* outlet.price_kwh*(1-IFNULL(coupon.discount,
0))),2) as total_income
FROM charging_station
INNER JOIN outlet ON
outlet.station_id= charging_station.station_id
and outlet.outlet_number=2
INNER JOIN charging_event ON
charging_event.station_id=outlet.station_id
and charging_event.outlet_number=2
LEFT JOIN coupon ON
coupon.coupon_id= charging_event.coupon_id
WHERE charging_station.street ='125 Collins Street'
and DATE(requested_at)<=DATE('2025-01-31')
GROUP BY outlet.station_id;
-- END Q10
--
___________________________________________________________________________________
___________________________________________________________________________________
______________________________________
-- END OF ASSIGNMENT Do not write below this line
