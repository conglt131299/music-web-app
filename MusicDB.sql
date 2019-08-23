create database MusicDB
use MusicDB

create table [User] (
	username varchar(30) not null primary key,
	password varchar(30),
	name nvarchar(100),
	email varchar(100),
	gender bit,
	dob date
);

create table Song (
	id int not null primary key,
	name nvarchar(100),
	image_link varchar(100),
	song_link varchar(100)
);

create table Artist (
	id int not null primary key,
	name nvarchar(50),
);

create table Song_Artist (
	id int not null primary key,
	song_id int foreign key references Song(id),
	artist_id int foreign key references Artist(id),
	view_count int
);

drop table [User];
