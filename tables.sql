-- User's table 
create table db_user (
    id_user number (10),
    id_score number(10) constraint idscore_user_nn not null,
    id_record number(10) constraint idrecord_user_nn not null,
    id_sale_record number(10) constraint id_salerecord_user_nn not null,
    id_shopping_car number(10) constraint id_shoppingcar_user_nn not null,
    id_person number(10) constraint idperson_user_nn not null,
    id_favorite number(10) constraint idfavorite_user_nn not null
);

alter table db_user 
    add constraint pk_user PRIMARY KEY (id_user)
    using index
    tablespace admind pctfree 20
    storage (initial 10k next 10k pctincrease 0);

alter table db_user
    add constraint fk_user_score foreign key (id_score)
    references Score(id_score);
    
alter table db_user
    add constraint fk_user_record foreign key (id_record)
    references purchase_record(id_record);    
    
alter table db_user
    add constraint fk_user_salerecord foreign key (id_sale_record)
    references sale_record(id_sale_record);   
    
alter table db_user
    add constraint fk_user_shopping foreign key (id_shopping_car)
    references shopping_car(id_shopping_car);  
    
alter table db_user
    add constraint fk_user_favorite foreign key (id_favorite)
    references favorite_clock_list(id_favorite);   
    
alter table db_user
    add constraint fk_user_person foreign key (id_person)
    references person(id_person);
------------------------------------------------------------------
-- Person's table
create table person(
        id_person number (10),
        first_name varchar2 (20) constraint first_name_nn not null,
        last_name varchar2 (20) constraint last_name_nn not null,
        person_photo bfile constraint person_photo_nn not null,
        born_date date constraint born_date_nn not null,
        user_name varchar2 (20) constraint user_name_nn not null,
        user_password varchar2 (20) constraint password_nn not null,
        id_country number (10) constraint idcountry_person_nn not null,
        identification_number number (10) constraint identification_person_nn not null
);

alter table person 
    add constraint pk_person PRIMARY KEY (id_person)
    using index
    tablespace admind pctfree 20
    storage (initial 10k next 10k pctincrease 0);

alter table person
    add constraint fk_person_country foreign key (id_country)
    references country(id_country);

alter table person
    add constraint fk_person_identification foreign key (identification_number)
    references identification(id_identification);
------------------------------------------------------------------
-- Phone's table
create table phone(
    phone_number NUMBER (8) CONSTRAINT phone_number_nn NOT NULL,
    id_person NUMBER (10) CONSTRAINT idperson_phone_nn NOT NULL
);

alter table phone 
    add constraint pk_phone PRIMARY KEY (phone_number)
    using index
    tablespace admind pctfree 20
    storage (initial 10k next 10k pctincrease 0);

alter table phone   
    add constraint fk_phone_person foreign key (id_person)
    references Person(id_person);
    
------------------------------------------------------------------
-- Nationality's Table
create table nationality (
    id_nationality number (10),
    nationality_name varchar2(30) constraint nationality_name_nn not null,
    constraint nationality_name_uk UNIQUE (nationality_name)
);

alter table nationality
    add constraint pk_nationality primary key (id_nationality)
    using index
    tablespace admind pctfree 20
    storage (initial 10k next 10k pctincrease 0);
    
--------------------------------------------------------------------
-- Email's table
create table email(
    email_address VARCHAR2 (40) constraint email_nn not null,
    id_person number (10) constraint idperson_email_nn not null
);

alter table email
    add constraint pk_email primary key (email_address)
    using index
    tablespace admind pctfree 20
    storage (initial 10k next 10k pctincrease 0);

alter table email
    add constraint fk_email_person foreign key (id_person)
    references Person(id_person);
------------------------------------------------------------
--Payment method table
create table payment_method(
    id_payment number (10),
    payment_name varchar2 (30) constraint payment_name_nn not null
);

alter table payment_method
    add constraint pk_payment_method primary key (id_payment)
    using index
    tablespace admind pctfree 20
    storage (initial 10k next 10k pctincrease 0);
    
------------------------------------------------------------------------
-- Message table
create table message(
    id_message number(10),
    message_description varchar2 (500) constraint message_description_nn not null,
    messsage_subject varchar2 (100) constraint message_subject_nn not null,
    id_user number(10) constraint iduser_message_nn not null
);

alter table message
    add constraint pk_message primary key (id_message)
    using index
    tablespace admind pctfree 20
    storage (initial 10k next 10k pctincrease 0);
    
alter table message 
    add constraint fk_message_user foreign key (id_user)
    references db_user(id_user);
    
------------------------------------------------------------------------------------
--Photo's table
create table photo(
    id_photo number (10),
    photo_description varchar2 (500) constraint photo_description_nn not null
);

alter table photo
    add constraint pk_photo primary key (id_photo)
    using index
    tablespace admind pctfree 20
    storage (initial 10k next 10k pctincrease 0);
------------------------------------------------------------------------------------
-- Card's table
create table card(
    card_number number (16),
    expire_date date constraint expire_date_nn not null,
    card_type varchar2 (20) constraint card_type_nn not null,
    card_name varchar2 (30) constraint card_name_nn not null,
    id_user number(10) constraint iduser_card_nn not null
);

alter table card
    add constraint pk_card primary key (card_number)
    using index
    tablespace admind pctfree 20
    storage (initial 10k next 10k pctincrease 0);
    
alter table card 
    add constraint fk_card foreign key (id_user)
    references db_user(id_user);
------------------------------------------------------------------------------------
-- Parameter's table
create table parameter(
    id_parameter number (30),
    parameter_value number (30) constraint parameter_value_nn not null,
    parameter_description varchar2(500) constraint parameter_description_nn not null     
);

alter table parameter
    add constraint pk_parameter primary key (id_parameter)
    using index
    tablespace admind pctfree 20
    storage (initial 10k next 10k pctincrease 0);
------------------------------------------------------------------------------------
-- Identification's table
create table identification(
    id_identification number (9),
    identification_type varchar2 (30) constraint identification_type_nn not null
);

alter table identification
    add constraint pk_identification primary key (id_identification)
    using index
    tablespace admind pctfree 20
    storage (initial 10k next 10k pctincrease 0);
------------------------------------------------------------------------------------
-- Favorite clock list table
create table favorite_clock_list(
    id_favorite number (10)
);

alter table favorite_clock_list
    add constraint pk_favorite primary key (id_favorite)
    using index
    tablespace admind pctfree 20
    storage (initial 10k next 10k pctincrease 0);
------------------------------------------------------------------------------------ 
create table userxmessage(
    id_user number(10),
    id_message number(10)
);

alter table userxmessage
    add constraint pk_userxmessage primary key (id_user, id_message)
    using index
    tablespace admind pctfree 20
    storage (initial 10k next 10k pctincrease 0);
------------------------------------------------------------------------------------

create table sale(
    id_sale number (10),
    sale_total_price number (10) constraint total_price_nn not null,
    constraint total_price_min check (sale_total_price > 0),
    sale_date date default sysdate constraint sale_date_nn not null,
    id_user number (10) constraint id_user not null
);

alter table sale
    add constraint pk_sale primary key (id_sale)
    using index
    tablespace admind pctfree 20
    storage (initial 10k next 10k pctincrease 0);

alter table sale
    add constraint fk_sale_user foreign key (id_user)
    references db_user(id_user);

------------------------------------------------------------------------------------
create table district(
    id_district number(10),
    district_name varchar2(30) constraint district_name_nn not null,
    constraint district_name_uk unique (district_name)
);

alter table district
    add constraint pk_district_name primary key (id_district)
    using index
    tablespace admind pctfree 20
    storage (initial 10k next 10k pctincrease 0);
------------------------------------------------------------------------------------
create table canton(
    id_canton number (10),
    canton_name varchar2 (40) constraint canton_name_nn not null,
    constraint canton_name_uk unique(canton_name),
    id_district number (10) constraint id_district_canton_nn not null
);

alter table canton
    add constraint pk_canton primary key (id_canton)
    using index
    tablespace admind pctfree 20
    storage (initial 10k next 10k pctincrease 0);
    
alter table canton
    add constraint fk_canton_district foreign key (id_district)
    references district(id_district);
    

------------------------------------------------------------------------------------
create table province(
    id_province number (10),
    province_name varchar2 (40) constraint province_name_nn not null,
    constraint province_name_uk unique(province_name),
    id_canton number (10) constraint id_province_canton_nn not null
);

alter table province
    add constraint pk_province primary key (id_province)
    using index
    tablespace admind pctfree 20
    storage (initial 10k next 10k pctincrease 0);
    
alter table province
    add constraint fk_province_canton foreign key (id_canton)
    references canton(id_canton);
------------------------------------------------------------------------------------
create table country(
    id_country number (10),
    country_name varchar2 (40) constraint country_name_nn not null,
    constraint country_name_uk unique(country_name),
    id_province number (10) constraint id_country_province_nn not null
);

alter table country
    add constraint pk_country primary key (id_country)
    using index
    tablespace admind pctfree 20
    storage (initial 10k next 10k pctincrease 0);
    
alter table country
    add constraint fk_country_province foreign key (id_country)
    references province(id_province);
------------------------------------------------------------------------------------
create table messagexemail(
    id_message number (10),
    email_address varchar2 (40) constraint email_message_nn not null,
    constraint email_message_unique unique (email_address)
);

alter table messagexemail 
    add constraint pk_messagexemail primary key (id_message, email_address)
    using index
    tablespace admind pctfree 20
    storage (initial 10k next 10k pctincrease 0);
    
alter table messagexemail
    add constraint fk_idmessage_email foreign key (id_message)
    references message(id_message);
    
alter table messagexemail
    add constraint fk_emailaddress_email foreign key (email_address)
    references email(email_address);
------------------------------------------------------------------------------------
create table status(
    id_status number (10),
    status_description varchar2 (30) constraint status_description_nn not null,
    constraint status_description_uk unique (status_description)
);

alter table status 
    add constraint pk_status primary key (id_status)
    using index
    tablespace admind pctfree 20
    storage (initial 10k next 10k pctincrease 0);
------------------------------------------------------------------------------------
create table score(
    id_score number(10),
    star_number float(10) constraint star_number_nn not null,
    constraint star_number_min check (star_number >= 0),
    constraint star_number_max check (star_number <= 5),
    score_average float(10) constraint score_average_nn not null
);

alter table score 
    add constraint pk_score primary key (id_score)
    using index
    tablespace admind pctfree 20
    storage (initial 10k next 10k pctincrease 0);
------------------------------------------------------------------------------------
create table commentary(
    id_comment number(10),
    comment_description varchar2(500) constraint comment_description_nn not null,
    id_score number(10) constraint idscore_comment_nn not null
);
alter table commentary 
    add constraint pk_comment primary key (id_comment)
    using index
    tablespace admind pctfree 20
    storage (initial 10k next 10k pctincrease 0);
    
alter table commentary
    add constraint fk_idscore_comment foreign key (id_score)
    references score(id_score);

------------------------------------------------------------------------------------
create table category(
    id_category number(10),
    category_description varchar2(50) constraint category_description_nn not null
);

alter table category 
    add constraint pk_category primary key (id_category)
    using index
    tablespace admind pctfree 20
    storage (initial 10k next 10k pctincrease 0);
------------------------------------------------------------------------------------
create table purchase_record(
    id_record number (15),
    purchase_amount number(15) constraint purchase_amount_nn not null,
    constraint purchase_amount_min check(purchase_amount > 0)
);

alter table purchase_record 
    add constraint pk_purchase_record primary key (id_record)
    using index
    tablespace admind pctfree 20
    storage (initial 10k next 10k pctincrease 0);
------------------------------------------------------------------------------------
create table shipping_type(
    id_shipping number(10),
    shipping_description varchar2 (200) constraint shipping_description_nn not null
);

alter table shipping_type 
    add constraint pk_shipping primary key (id_shipping)
    using index
    tablespace admind pctfree 20
    storage (initial 10k next 10k pctincrease 0);
------------------------------------------------------------------------------------
create table brand(
    id_brand number(10),
    brand_name varchar2(30) constraint brand_name_nn not null,
    constraint brand_name_uk unique(brand_name)
);

alter table brand 
    add constraint pk_brand primary key (id_brand)
    using index
    tablespace admind pctfree 20
    storage (initial 10k next 10k pctincrease 0);
------------------------------------------------------------------------------------
create table sale_record(
    id_sale_record number(10),
    sale_amount number (30) constraint sale_amount_nn not null,
    constraint sale_amount_min check(sale_amount > 0)
);

alter table sale_record 
    add constraint pk_sale_record primary key (id_sale_record)
    using index
    tablespace admind pctfree 20
    storage (initial 10k next 10k pctincrease 0);
------------------------------------------------------------------------------------
create table vintage_classification(
    id_vintage number(10),
    vintage_description varchar2(30) constraint vintage_description_nn not null
);

alter table VINTAGE_CLASSIFICATION 
    add constraint pk_vintage primary key (id_vintage)
    using index
    tablespace admind pctfree 20
    storage (initial 10k next 10k pctincrease 0);
------------------------------------------------------------------------------------
create table shopping_car(
    id_shopping_car number(10)
);

alter table shopping_car 
    add constraint pk_shopping_car primary key (id_shopping_car)
    using index
    tablespace admind pctfree 20
    storage (initial 10k next 10k pctincrease 0);
------------------------------------------------------------------------------------
create table purchase(
    id_purchase number(10),
    total_amount number(10) constraint total_amount_nn not null,
    constraint total_amount_min check (total_amount > 0),
    purchase_date date default sysdate constraint purchase_date_nn not null,
    id_user number(10) constraint iduser_purchase_nn not null,
    id_purchase_record number(10) constraint id_purchase_record_purchase_nn not null
);

alter table purchase 
    add constraint pk_purchase primary key (id_purchase)
    using index
    tablespace admind pctfree 20
    storage (initial 10k next 10k pctincrease 0);
    
alter table purchase
    add constraint fk_purchase_precord foreign key(id_purchase_record)
    references purchase_record(id_record);
    
alter table purchase
    add constraint fk_purchase_user foreign key(id_user)
    references db_user(id_user);
------------------------------------------------------------------------------------
create table personxnationality(
    id_person number(10),
    id_nationality number(10) constraint id_person_nationality_nn not null
);

alter table personxnationality 
    add constraint pk_personxnationality primary key (id_person, id_nationality)
    using index
    tablespace admind pctfree 20
    storage (initial 10k next 10k pctincrease 0);
    
alter table personxnationality
    add constraint fk_pxn_id_person foreign key(id_person)
    references person(id_person);
    
alter table personxnationality
    add constraint fk_pxn_nationality foreign key(id_nationality)
    references nationality(id_nationality);

------------------------------------------------------------------------------------
create table userxpayment_method(
    id_user number(10),
    id_payment number (10)
);

alter table userxpayment_method 
    add constraint pk_userxpayment_method primary key (id_user, id_payment)
    using index
    tablespace admind pctfree 20
    storage (initial 10k next 10k pctincrease 0);
    
alter table userxpayment_method
    add constraint fk_uxp_id_user foreign key(id_user)
    references db_user(id_user);
    
alter table userxpayment_method
    add constraint fk_uxp_id_payment foreign key(id_payment)
    references payment_method(id_payment);

------------------------------------------------------------------------------------
create table administrator(
    id_administrator number(10),
    salary number (30) constraint salary_nn not null,
    constraint salary_min check(salary > 0),
    id_person number (10) constraint id_person_admin_nn not null
);

alter table administrator 
    add constraint pk_administrator primary key (id_administrator)
    using index
    tablespace admind pctfree 20
    storage (initial 10k next 10k pctincrease 0);
    
alter table administrator
    add constraint fk_administrator_person foreign key(id_person)
    references person(id_person); 
------------------------------------------------------------------------------------
create table clock(
    id_clock number(10),
    clock_model varchar2(20) constraint clock_model_nn not null,
    clock_price number(30) constraint clock_price_nn not null,
    constraint clock_price_min check(clock_price > 0),
    clock_description varchar2(30) constraint clock_description_nn not null,
    clock_name varchar2(30) constraint clock_name_nn not null,
    fabrication_date date constraint fabrication_date_nn not null,
    id_category number(10) constraint idcategory_clock_nn not null,
    id_sale number(10) constraint idsale_clock_nn not null,
    id_record number(10) constraint idrecord_clock_nn not null,
    id_sale_record number(10) constraint id_salerecord_clock_nn not null,
    id_purchase number(10) constraint idpurchase_clock_nn not null,
    id_shopping_car number(10) constraint id_shoppingcar_clock_nn not null,
    id_score number(10) constraint idscore_clock_nn not null,
    id_user number(10) constraint iduser_clock_nn not null,
    id_status number(10) constraint idstatuse_clock_nn not null,
    id_vintage number(10) constraint idvintage_clock_nn not null,
    id_brand number(10) constraint idbrand_clock_nn not null,
    id_shipping number(10) constraint idshipping_clock_nn not null
);

alter table clock 
    add constraint pk_clock primary key (id_clock)
    using index
    tablespace admind pctfree 20
    storage (initial 10k next 10k pctincrease 0);
    
alter table clock
    add constraint fk_clock_score foreign key(id_score)
    references score(id_score); 
    
alter table clock
    add constraint fk_clock_sale foreign key(id_sale)
    references sale(id_sale); 
    
alter table clock
    add constraint fk_clock_precord foreign key(id_record)
    references purchase_record(id_record); 
    
alter table clock
    add constraint fk_clock_srecord foreign key(id_sale_record)
    references sale_record(id_sale_record); 
    
alter table clock
    add constraint fk_clock_purchase foreign key(id_purchase)
    references purchase(id_purchase); 
    
alter table clock
    add constraint fk_clock_shopping foreign key(id_shopping_car)
    references shopping_car(id_shopping_car); 
    
alter table clock
    add constraint fk_clock_user foreign key(id_user)
    references db_user(id_user); 
    
alter table clock
    add constraint fk_clock_category foreign key(id_category)
    references category(id_category);
    
alter table clock
    add constraint fk_clock_status foreign key(id_status)
    references status(id_status); 
    
alter table clock
    add constraint fk_clock_vintage foreign key(id_vintage)
    references vintage_classification(id_vintage); 
    
alter table clock
    add constraint fk_clock_shipping foreign key(id_shipping)
    references shipping_type(id_shipping); 
    
alter table clock
    add constraint fk_clock_brand foreign key(id_brand)
    references brand(id_brand);
------------------------------------------------------------------------------------
create table clockxfavorite_clock_list(
    id_clock number(10),
    id_favorite number(10)
);

alter table clockxfavorite_clock_list 
    add constraint pk_clockxfavorite_clock_list primary key (id_clock, id_favorite)
    using index
    tablespace admind pctfree 20
    storage (initial 10k next 10k pctincrease 0);
    
alter table clockxfavorite_clock_list
    add constraint fk_cxf_idclock foreign key(id_clock)
    references clock(id_clock); 

alter table clockxfavorite_clock_list
    add constraint fk_cxf_idfavorite foreign key(id_favorite)
    references favorite_clock_list(id_favorite);
------------------------------------------------------------------------------------
create table clockxphoto(
    id_clock number(10),
    id_photo number(10)
);

alter table clockxphoto 
    add constraint pk_clockXphoto primary key (id_clock, id_photo)
    using index
    tablespace admind pctfree 20
    storage (initial 10k next 10k pctincrease 0);
    
alter table clockxphoto
    add constraint fk_clockXphoto_idclock foreign key(id_clock)
    references clock(id_clock); 

alter table clockxphoto
    add constraint fk_clockxphoto_idphoto foreign key(id_photo)
    references photo(id_photo);
------------------------------------------------------------------------------------
create table administratorxclock(
    id_administrator number(10),
    id_clock number (10)
);
alter table administratorxclock 
    add constraint administratorxclock primary key (id_administrator, id_clock)
    using index
    tablespace admind pctfree 20
    storage (initial 10k next 10k pctincrease 0);
    
alter table administratorxclock
    add constraint fk_administratorxclock_idclock foreign key(id_clock)
    references clock(id_clock); 

alter table administratorxclock
    add constraint fk_administratorxclock_idadmin foreign key(id_administrator)
    references administrator(id_administrator);