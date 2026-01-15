CREATE DATABASE	IF NOT EXISTS College;
USE College;

CREATE TABLE Students (
	Roll_no INT,
    Name VARCHAR(30),
    Age INT
);

INSERT INTO Students
VALUES
(101, "Wali", 23),
(102, "Mohd", 21);

SELECT * FROM students;

SHOW TABLES;						# show table from a particular db
SHOW DATABASES;			

CREATE DATABASE IF NOT EXISTS Instagram;
USE Instagram;
CREATE TABLE Users(
	ID INT PRIMARY KEY,
	Name VARCHAR (30) NOT NULL,
    Age INT,
    Email VARCHAR (50) UNIQUE,
    Followers INT,
    Followings INT,
    CONSTRAINT CHECK (Age >= 18)
);
INSERT INTO Users (ID, Name, Age, Email, Followers, Followings)
VALUES
(1, 'Aarav Sharma', 22, 'aarav.sharma@gmail.com', 1200, 350),
(2, 'Neha Verma', 24, 'neha.verma@gmail.com', 980, 410),
(3, 'Rohit Khan', 21, 'rohit.khan@gmail.com', 560, 300),
(4, 'Priya Singh', 23, 'priya.singh@gmail.com', 2100, 520),
(5, 'Aditya Mehra', 25, 'aditya.mehra@gmail.com', 750, 280),
(6, 'Simran Kaur', 22, 'simran.kaur@gmail.com', 1650, 450);

SELECT * FROM Users;
SELECT DISTINCT Age FROM Users;				# DISTINCT gives unique values 

SELECT Name, Followers
FROM Users
WHERE Followers >= 1000
LIMIT 2;

SELECT Name, Age, Followers
FROM Users
ORDER BY Followers ASC;

SELECT MAX(Followers)
FROM Users;
# if we want to display name and age as well of that user
SELECT Name, Age, Followers
FROM Users
WHERE Followers = (SELECT MAX(Followers) FROM Users);

SELECT Age, MAX(Followers)
FROM Users
GROUP BY Age;

SELECT Age, MAX(Followers)
FROM Users
GROUP BY Age
HAVING MAX(Followers) > 900;			/* WHERE is for table, HAVING is for GROUP */

/* general order of writing query
SELECT,
FROM,
WHERE,
GROUP BY,
HAVING,
ORDER BY;
*/

UPDATE Users
SET Followers = 2150
Where Name = "Priya Singh";

SET SQL_SAFE_UPDATES = 0;			/* we have to do this, we cannot directly update tables */

ALTER TABLE Users
ADD COLUMN City VARCHAR(30);
ALTER TABLE Users
DROP COLUMN City;
ALTER TABLE Users
RENAME TO Insta_users;
ALTER TABLE Users
CHANGE COLUMN City User_city VARCHAR(30);
ALTER TABLE Users
MODIFY Followers INT DEFAULT 0;


CREATE TABLE Posts(
	Id INT PRIMARY KEY,
    Content VARCHAR (50),
    user_id INT,
    FOREIGN KEY (user_id) REFERENCES Users(ID)
);
INSERT INTO Posts (Id, Content, user_id)
VALUES
(101, 'My first Instagram post', 1),
(102, 'Learning SQL is fun', 2),
(103, 'Good morning everyone', 3),
(104, 'Travel diaries', 4),
(105, 'Coding late night', 1),
(106, 'Workout motivation', 6);

SELECT * FROM Posts;
