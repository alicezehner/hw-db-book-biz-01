-- create database

DROP DATABASE IF EXISTS `BookDB`;
CREATE DATABASE IF NOT EXISTS `BookDB`;
USE `BookDB`;

-- create table

CREATE TABLE `Authors`(
	`AuthorId`	int	not NULL AUTO_INCREMENT,
    `FirstName` varchar(20),
    `LastName`  varchar(20) not NULL,
    PRIMARY KEY (AuthorId)
);
CREATE TABLE `Genres`(
	`GenreId`	int	not NULL AUTO_INCREMENT,
    `Genre` varchar(20) not NULL,
    PRIMARY KEY (GenreId)
);
CREATE TABLE `Orders`(
	`OrderId`	int not NULL AUTO_INCREMENT,
    `CustomerId`int	not NULL,
    PRIMARY KEY (OrderId)
);
CREATE TABLE `Editors`(
	`EditorId`	int	not NULL AUTO_INCREMENT,
    `FirstName` varchar(20),
    `LastName`  varchar(20) not NULL,
    PRIMARY KEY (EditorId)
);
CREATE TABLE `Publishers`(
	`PublisherId`	int	not NULL AUTO_INCREMENT,
    `Name` varchar(50) not NULL,
    PRIMARY KEY (PublisherId)
);
CREATE TABLE `Books`(
	`BookId`	int not NULL AUTO_INCREMENT,
    `Title` varchar(50) not NULL,
    `PublisherId` int not NULL,
    `Price` DEC(6, 2),
    `Royalty` dec(3,3),
    PRIMARY KEY (BookId),
    FOREIGN KEY (PublisherId) REFERENCES Publishers(PublisherId)
);
CREATE TABLE `Book_Genres`(
	`BookId`	int	not NULL,
    `GenreId`	int not NULL,
    FOREIGN KEY (BookId) REFERENCES Books(BookId),
    FOREIGN KEY (GenreId) REFERENCES Genres(GenreId)
);
CREATE TABLE `Book_Authors`(
	`BookId`	int	not NULL,
    `AuthorId` 	int not NULL,
    FOREIGN KEY (BookId) REFERENCES Books(BookId),
    FOREIGN KEY (AuthorId) REFERENCES Authors(AuthorId)
);
CREATE TABLE `Book_Editors`(
	`BookId`	int	not NULL,
    `EditorId` 	int not NULL,
    FOREIGN KEY (BookId) REFERENCES Books(BookId),
    FOREIGN KEY (EditorId) REFERENCES Editors(EditorId)
);
CREATE TABLE `Order_Details`(
	`OrderId` int not NULL,
    `BookId` int not NULL,
	FOREIGN KEY (OrderId) REFERENCES Orders(OrderId),
    FOREIGN KEY (BookId) REFERENCES Books(BookId));