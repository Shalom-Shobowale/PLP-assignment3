create database if not exists db_Hospital;
use db_Hospital;

create table patient(
first_name varchar(50) not null,
last_name varchar(50) not null,
date_of_birth date not null,
gender enum("Male", "Female") not null,
spoken_language varchar(50) not null,
patient_id int primary key auto_increment
);

create table provider(
first_name varchar(50) not null,
last_name varchar(50) not null,
provider_speciality varchar(50) not null,
email_address varchar(50) unique,
phone_number varchar(50) unique,
date_join date not null,
provider_id int primary key auto_increment
);

create table visits(
date_of_visit date not null,
date_scheduled date not null,
visit_department_id int not null,
visit_type varchar(50) not null,
blood_pressure_systollic int,
blood_pressure_diastollic decimal,
pulse decimal,
visit_status varchar(50) not null,
visit_id int primary key auto_increment,
patient_id int,
provider_id int,
foreign key(patient_id) references patient(patient_id) on delete cascade,
foreign key(provider_id) references provider(provider_id) on delete cascade
);

create table  ed_visits(
acuity int not null,
reason_for_visit varchar(50) not null,
disposition varchar(50) not null,
patient_id int,
visit_id int,
foreign key(patient_id) references patient(patient_id) on delete cascade,
foreign key(visit_id) references visits(visit_id) on delete cascade,
ed_visit_id int primary key auto_increment
);

create table addmission(
addmission_date date not null,
discharge_date date not null,
discharge_disposition varchar(50) not null,
service varchar(50) not null,
patient_id int,
primary_diagnosis varchar(50) not null,
foreign key(patient_id) references patient(patient_id) on delete cascade,
admission_id int primary key auto_increment
);

create table Discharge(
admission_id int,
patient_id int,
discharge_date date not null,
discharge_disposition varchar(50) not null,
foreign key(patient_id) references patient(patient_id) on delete cascade,
foreign key(admission_id) references addmission(admission_id) on delete cascade,
discharge_id int primary key auto_increment
);
