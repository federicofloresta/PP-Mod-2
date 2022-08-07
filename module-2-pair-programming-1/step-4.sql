-- select the park name, campground name, open_from_mm, open_to_mm & daily_fee ordered by park name and then campground name
Select p.name, c.name,c.open_from_mm, c.open_to_mm, c.daily_fee from campground c join park p using(park_id) order by p.name, c.name;

-- select the park name and the total number of campgrounds for each park ordered by park name
select p.name, Count(campground_id) from park p join campground c using(park_id) group by p.name order by p.name;


-- select the park name, campground name, site number, max occupancy, accessible, max rv length, utilities where the campground name is 'Blackwoods'
select p.name, c.name, s.site_number,s.max_occupancy, s.max_rv_length, s.utilities from site s join campground c using(campground_id) 
join park p using(park_id) where c.name = 'Blackwoods';
/*
  select park name, campground, total number of sites (column alias 'number_of_sites') ordered by park
  -------------------------------------------------
    Acadia	Blackwoods	276
    Acadia	Seawall	198
    Acadia	Schoodic Woods	92
    Arches	"Devil's Garden"	49
    Arches	Canyon Wren Group Site	1
    Arches	Juniper Group Site	1
    Cuyahoga Valley	The Unnamed Primitive Campsites	5
  -------------------------------------------------
*/
select p.name, c.name, Count(s.site_id) as number_of_sites from park p join campground c using(park_id) join site s using(campground_id) 
group by c.name, p.name order by p.name, number_of_sites DESC;

-- select site number, reservation name, reservation from and to date ordered by reservation from date
select s.site_number, r.name, r.from_date, r.to_date from reservation r join site s using(site_id) order by r.from_date;


/*
  select campground name, total number of reservations for each campground ordered by total reservations desc
  -------------------------------------------------
    Seawall	13
    Blackwoods	9
    "Devil's Garden"	7
    Schoodic Woods	7
    The Unnamed Primitive Campsites	5
    Canyon Wren Group Site	4
    Juniper Group Site	4
  -------------------------------------------------
*/
select c.name, count(r.reservation_id) as total_reservations from campground c join site s using(campground_id) join reservation r using(site_id) 
group by c.name order by total_reservations DESC; 



