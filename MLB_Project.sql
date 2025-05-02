CREATE DATABASE MLB_Project;
USE MLB_Project;

CREATE TABLE Person (
    PersonID INT PRIMARY KEY,
    Name VARCHAR(100),
    DateOfBirth DATE,
    Nationality VARCHAR(50)
);

CREATE TABLE Player (
    PersonID INT PRIMARY KEY,
    Position VARCHAR(50),
    Bats VARCHAR(10),
    Throws VARCHAR(10),
    FOREIGN KEY (PersonID) REFERENCES Person(PersonID)
);

CREATE TABLE Coach (
    PersonID INT PRIMARY KEY,
    FOREIGN KEY (PersonID) REFERENCES Person(PersonID)
);

CREATE TABLE Manager (
    PersonID INT PRIMARY KEY,
    FOREIGN KEY (PersonID) REFERENCES Person(PersonID)
);

CREATE TABLE Team (
    TeamID INT PRIMARY KEY,
    TeamName VARCHAR(100),
    City VARCHAR(100),
    Division VARCHAR(50),
    League VARCHAR(50)
);

CREATE TABLE Contract (
    ContractID INT PRIMARY KEY,
    PlayerID INT,
    TeamID INT,
    StartDate DATE,
    EndDate DATE,
    Salary DECIMAL(10,2),
    FOREIGN KEY (PlayerID) REFERENCES Player(PersonID),
    FOREIGN KEY (TeamID) REFERENCES Team(TeamID)
);

CREATE TABLE Season (
    SeasonID INT PRIMARY KEY,
    Year INT,
    LeagueChampion VARCHAR(100),
    MVP VARCHAR(100)
);

CREATE TABLE Game (
    GameID INT PRIMARY KEY,
    Date DATE,
    HomeTeamID INT,
    AwayTeamID INT,
    Stadium VARCHAR(100),
    FinalScore VARCHAR(10),
    SeasonID INT,
    FOREIGN KEY (HomeTeamID) REFERENCES Team(TeamID),
    FOREIGN KEY (AwayTeamID) REFERENCES Team(TeamID),
    FOREIGN KEY (SeasonID) REFERENCES Season(SeasonID)
);

CREATE TABLE PlayerStats (
    PlayerID INT,
    GameID INT,
    AtBats INT,
    Hits INT,
    Runs INT,
    HomeRuns INT,
    RBIs INT,
    Strikeouts INT,
    Walks INT,
    Errors INT,
    InningsPitched DECIMAL(5,2),
    PRIMARY KEY (PlayerID, GameID),
    FOREIGN KEY (PlayerID) REFERENCES Player(PersonID),
    FOREIGN KEY (GameID) REFERENCES Game(GameID)
    );

-- Teams
INSERT INTO Team (TeamID, TeamName, City, Division, League) VALUES (1, 'Toronto Blue Jays', 'Toronto', 'AL East', 'American');
INSERT INTO Team VALUES (2, 'New York Yankees', 'New York', 'AL East', 'American');

-- Seasons
INSERT INTO Season (SeasonID, Year, LeagueChampion, MVP) VALUES (2025, 2025, 'Houston Astros', 'Shohei Ohtani');

-- Games
INSERT INTO Game (GameID, Date, HomeTeamID, AwayTeamID, Stadium, FinalScore, SeasonID) VALUES (1001, '2024-03-28', 1, 2, 'Rogers Centre', '5-3', 2024);
INSERT INTO Game VALUES (1002, '2024-03-30', 2, 1, 'Yankee Stadium', '4-2', 2024);

-- SEASON
INSERT INTO Season (SeasonID, Year, LeagueChampion, MVP)
VALUES (2024, 2024, 'Los Angeles Dodgers', 'Shohei Ohtani');
INSERT INTO Season VALUES (2023, 2023, 'Texas Rangers', 'Shohei Ohtani');

-- MANAGERS & COACHES (Blue Jays)
INSERT INTO Person VALUES (1001, 'John Schneider', '1980-02-14', 'USA');
INSERT INTO Manager VALUES (1001);

INSERT INTO Person (PersonID, Name, DateOfBirth, Nationality) VALUES (1002, 'Don Mattingly', '1961-04-20', 'USA');
INSERT INTO Coach (PersonID) VALUES (1002);

INSERT INTO Person VALUES (1003, 'Guillermo Martínez', '1984-11-05', 'USA');
INSERT INTO Coach VALUES (1003);

INSERT INTO Person VALUES (1004, 'Pete Walker', '1969-04-08', 'USA');
INSERT INTO Coach VALUES (1004);

INSERT INTO Person VALUES (1005, 'Mark Budzinski', '1973-08-20', 'USA');
INSERT INTO Coach VALUES (1005);

INSERT INTO Person VALUES (1006, 'Luis Rivera', '1964-01-03', 'Puerto Rico');
INSERT INTO Coach VALUES (1006);

-- MANAGERS & COACHES (Yankees)
INSERT INTO Person VALUES (2001, 'Aaron Boone', '1973-03-09', 'USA');
INSERT INTO Manager VALUES (2001);

INSERT INTO Person VALUES (2002, 'Carlos Mendoza', '1980-11-27', 'Venezuela');
INSERT INTO Coach VALUES (2002);

INSERT INTO Person VALUES (2003, 'Dillon Lawson', '1985-06-15', 'USA');
INSERT INTO Coach VALUES (2003);

INSERT INTO Person VALUES (2004, 'Matt Blake', '1985-05-14', 'USA');
INSERT INTO Coach VALUES (2004);

INSERT INTO Person VALUES (2005, 'Travis Chapman', '1978-06-05', 'USA');
INSERT INTO Coach VALUES (2005);

INSERT INTO Person VALUES (2006, 'Luis Rojas', '1981-09-01', 'Dominican Republic');
INSERT INTO Coach VALUES (2006);

-- BLUE JAYS 26-MAN ROSTER
INSERT INTO Person (PersonID, Name, DateOfBirth, Nationality) 
VALUES (1101, 'Bo Bichette', '1998-03-05', 'USA');
INSERT INTO Person VALUES (1102, 'Vladimir Guerrero Jr.', '1999-03-16', 'Canada');
INSERT INTO Person VALUES (1103, 'George Springer', '1989-09-19', 'USA');
INSERT INTO Person VALUES (1104, 'Alejandro Kirk', '1998-11-06', 'Mexico');
INSERT INTO Person VALUES (1105, 'Tyler Heineman', '1991-06-19', 'USA');
INSERT INTO Person VALUES (1106, 'Andres Gimenez', '1998-09-04', 'Venezuela');
INSERT INTO Person VALUES (1107, 'Ernie Clement', '1996-03-22', 'USA');
INSERT INTO Person VALUES (1108, 'Will Wagner', '1998-07-29', 'USA');
INSERT INTO Person VALUES (1109, 'Anthony Santander', '1994-10-19', 'Venezuela');
INSERT INTO Person VALUES (1110, 'Myles Straw', '1994-10-17', 'USA');
INSERT INTO Person VALUES (1111, 'Nathan Lukes', '1994-07-12', 'USA');
INSERT INTO Person VALUES (1112, 'Alan Roden', '1999-04-29', 'USA');
INSERT INTO Person VALUES (1113, 'Davis Schneider', '1999-06-03', 'USA');
INSERT INTO Person VALUES (1114, 'José Berríos', '1994-05-27', 'Puerto Rico');
INSERT INTO Person VALUES (1115, 'Kevin Gausman', '1991-01-06', 'USA');
INSERT INTO Person VALUES (1116, 'Max Scherzer', '1984-07-27', 'USA');
INSERT INTO Person VALUES (1117, 'Chris Bassitt', '1989-02-22', 'USA');
INSERT INTO Person VALUES (1118, 'Bowden Francis', '1996-04-18', 'USA');
INSERT INTO Person VALUES (1119, 'Nick Sandlin', '1997-01-10', 'USA');
INSERT INTO Person VALUES (1120, 'Yimi García', '1990-08-18', 'Dominican Republic');
INSERT INTO Person VALUES (1121, 'Jeff Hoffman', '1993-01-08', 'USA');
INSERT INTO Person VALUES (1122, 'Nate Pearson', '1996-08-20', 'USA');
INSERT INTO Person VALUES (1123, 'Wes Parsons', '1992-09-06', 'USA');
INSERT INTO Player VALUES (1101, 'Shortstop', 'Right', 'Right');
INSERT INTO Player VALUES (1102, 'First Base', 'Right', 'Right');
INSERT INTO Player VALUES (1103, 'Outfield', 'Right', 'Right');
INSERT INTO Player VALUES (1104, 'Catcher', 'Right', 'Right');
INSERT INTO Player VALUES (1105, 'Catcher', 'Switch', 'Right');
INSERT INTO Player VALUES (1106, 'Second Base', 'Left', 'Right');
INSERT INTO Player VALUES (1107, 'Utility', 'Right', 'Right');
INSERT INTO Player VALUES (1108, 'Infield', 'Left', 'Right');
INSERT INTO Player VALUES (1109, 'Outfield', 'Switch', 'Right');
INSERT INTO Player VALUES (1110, 'Outfield', 'Right', 'Right');
INSERT INTO Player VALUES (1111, 'Outfield', 'Left', 'Left');
INSERT INTO Player VALUES (1112, 'Outfield', 'Left', 'Right');
INSERT INTO Player VALUES (1113, 'Infield', 'Right', 'Right');
INSERT INTO Player VALUES (1114, 'Pitcher', 'Right', 'Right');
INSERT INTO Player VALUES (1115, 'Pitcher', 'Right', 'Right');
INSERT INTO Player VALUES (1116, 'Pitcher', 'Right', 'Right');
INSERT INTO Player VALUES (1117, 'Pitcher', 'Right', 'Right');
INSERT INTO Player VALUES (1118, 'Pitcher', 'Right', 'Right');
INSERT INTO Player VALUES (1119, 'Pitcher', 'Right', 'Right');
INSERT INTO Player VALUES (1120, 'Pitcher', 'Right', 'Right');
INSERT INTO Player VALUES (1121, 'Pitcher', 'Right', 'Right');
INSERT INTO Player VALUES (1122, 'Pitcher', 'Right', 'Right');
INSERT INTO Player VALUES (1123, 'Pitcher', 'Right', 'Right');

-- YANKEES 26-MAN ROSTER
INSERT INTO Person VALUES (1201, 'Aaron Judge', '1992-04-26', 'USA');
INSERT INTO Person VALUES (1202, 'Giancarlo Stanton', '1989-11-08', 'USA');
INSERT INTO Person VALUES (1203, 'Paul Goldschmidt', '1987-09-10', 'USA');
INSERT INTO Person VALUES (1204, 'Jazz Chisholm Jr.', '1998-02-01', 'Bahamas');
INSERT INTO Person VALUES (1205, 'Anthony Volpe', '2001-04-28', 'USA');
INSERT INTO Person VALUES (1206, 'Oswaldo Cabrera', '1999-03-01', 'Venezuela');
INSERT INTO Person VALUES (1207, 'Ben Rice', '1998-02-09', 'USA');
INSERT INTO Person VALUES (1208, 'Cody Bellinger', '1995-07-13', 'USA');
INSERT INTO Person VALUES (1209, 'Jasson Domínguez', '2003-02-07', 'Dominican Republic');
INSERT INTO Person VALUES (1210, 'Alex Verdugo', '1996-05-15', 'USA');
INSERT INTO Person VALUES (1211, 'Trent Grisham', '1996-11-01', 'USA');
INSERT INTO Person VALUES (1212, 'Austin Wells', '1999-07-12', 'USA');
INSERT INTO Person VALUES (1213, 'J.C. Escarra', '1994-11-27', 'USA');
INSERT INTO Person VALUES (1214, 'Carlos Rodón', '1992-12-10', 'USA');
INSERT INTO Person VALUES (1215, 'Clarke Schmidt', '1996-02-20', 'USA');
INSERT INTO Person VALUES (1216, 'Max Fried', '1994-01-18', 'USA');
INSERT INTO Person VALUES (1217, 'Carlos Carrasco', '1987-03-21', 'Venezuela');
INSERT INTO Person VALUES (1218, 'Will Warren', '1999-06-16', 'USA');
INSERT INTO Person VALUES (1219, 'Ian Hamilton', '1995-06-16', 'USA');
INSERT INTO Person VALUES (1220, 'Tim Hill', '1990-02-10', 'USA');
INSERT INTO Person VALUES (1221, 'Mark Leiter Jr.', '1991-03-13', 'USA');
INSERT INTO Person VALUES (1222, 'Tyler Matzek', '1990-10-19', 'USA');
INSERT INTO Person VALUES (1223, 'Devin Williams', '1994-09-21', 'USA');
INSERT INTO Person VALUES (1224, 'Ryan Yarbrough', '1992-12-31', 'USA');
INSERT INTO Player VALUES (1201, 'Outfield', 'Right', 'Right');
INSERT INTO Player VALUES (1202, 'Outfield', 'Right', 'Right');
INSERT INTO Player VALUES (1203, 'First Base', 'Right', 'Right');
INSERT INTO Player VALUES (1204, 'Second Base', 'Left', 'Right');
INSERT INTO Player VALUES (1205, 'Shortstop', 'Right', 'Right');
INSERT INTO Player VALUES (1206, 'Utility', 'Switch', 'Right');
INSERT INTO Player VALUES (1207, 'Catcher', 'Left', 'Right');
INSERT INTO Player VALUES (1208, 'Outfield', 'Left', 'Left');
INSERT INTO Player VALUES (1209, 'Outfield', 'Switch', 'Right');
INSERT INTO Player VALUES (1210, 'Outfield', 'Left', 'Left');
INSERT INTO Player VALUES (1211, 'Outfield', 'Left', 'Left');
INSERT INTO Player VALUES (1212, 'Catcher', 'Left', 'Right');
INSERT INTO Player VALUES (1213, 'Catcher', 'Left', 'Right');
INSERT INTO Player VALUES (1214, 'Pitcher', 'Left', 'Left');
INSERT INTO Player VALUES (1215, 'Pitcher', 'Right', 'Right');
INSERT INTO Player VALUES (1216, 'Pitcher', 'Left', 'Left');
INSERT INTO Player VALUES (1217, 'Pitcher', 'Right', 'Right');
INSERT INTO Player VALUES (1218, 'Pitcher', 'Right', 'Right');
INSERT INTO Player VALUES (1219, 'Pitcher', 'Right', 'Right');
INSERT INTO Player VALUES (1220, 'Pitcher', 'Left', 'Left');
INSERT INTO Player VALUES (1221, 'Pitcher', 'Right', 'Right');
INSERT INTO Player VALUES (1222, 'Pitcher', 'Left', 'Left');
INSERT INTO Player VALUES (1223, 'Pitcher', 'Right', 'Right');
INSERT INTO Player VALUES (1224, 'Pitcher', 'Left', 'Left');

-- CONTRACTS
INSERT INTO Contract (ContractID, PlayerID, TeamID, StartDate, EndDate, Salary) VALUES
(1, 1101, 1, '2023-04-01', '2026-10-31', 12500000.00);
INSERT INTO Contract VALUES (2, 1102, 1, '2022-03-01', '2028-10-31', 14500000.00);
INSERT INTO Contract VALUES (3, 1201, 2, '2021-02-15', '2029-10-31', 30000000.00);
INSERT INTO Contract VALUES (4, 1202, 2, '2020-01-10', '2025-10-31', 25000000.00);

-- PLAYER STATS for GameID 1001
INSERT INTO PlayerStats (PlayerID, GameID, AtBats, Hits, Runs, HomeRuns, RBIs, Strikeouts, Walks, Errors, InningsPitched) VALUES
(1101, 1001, 4, 2, 1, 1, 2, 0, 1, 0, 0.0);
INSERT INTO PlayerStats VALUES (1102, 1001, 3, 1, 0, 0, 1, 1, 1, 0, 0.0);
INSERT INTO PlayerStats VALUES (1201, 1001, 4, 1, 1, 1, 1, 1, 0, 0, 0.0);
INSERT INTO PlayerStats VALUES (1202, 1001, 3, 0, 0, 0, 0, 2, 0, 0, 0.0); 

-- Table and Records
DESC Person;
SELECT * FROM Person;

DESC Player;
SELECT * FROM Player;

DESC Coach;
SELECT * FROM Coach;

DESC Manager;
SELECT * FROM Manager;

DESC Team;
SELECT * FROM Team;

DESC Contract;
SELECT * FROM Contract;

DESC Season;
SELECT * FROM Season;

DESC Game;
SELECT * FROM Game;

DESC PlayerStats;
SELECT * FROM PlayerStats;

-- Queries
SELECT Name FROM Person
WHERE PersonID IN (SELECT PersonID FROM Player);

SELECT p.Name, c.StartDate, c.EndDate, c.Salary
FROM Person p
JOIN Contract c ON p.PersonID = c.PlayerID
WHERE p.Name = 'Bo Bichette';

SELECT p.Name
FROM Player pl
JOIN Person p ON pl.PersonID = p.PersonID
LEFT JOIN PlayerStats ps ON pl.PersonID = ps.PlayerID
WHERE ps.PlayerID IS NULL;

SELECT p.Name
FROM PlayerStats ps
JOIN Player pl ON ps.PlayerID = pl.PersonID
JOIN Person p ON p.PersonID = pl.PersonID
WHERE ps.GameID = 1001;

SELECT GameID, Date, FinalScore
FROM Game
WHERE (HomeTeamID = 1 AND AwayTeamID = 2) OR (HomeTeamID = 2 AND AwayTeamID = 1);

SELECT p.Name, ps.HomeRuns
FROM PlayerStats ps
JOIN Player pl ON ps.PlayerID = pl.PersonID
JOIN Person p ON p.PersonID = pl.PersonID
WHERE ps.GameID = 1001 AND ps.HomeRuns > 0;

SELECT t.TeamName, AVG(c.Salary) AS AvgSalary
FROM Contract c
JOIN Team t ON c.TeamID = t.TeamID
GROUP BY t.TeamName;

SELECT t.TeamName, COUNT(c.PlayerID) AS PlayerCount
FROM Contract c
JOIN Team t ON c.TeamID = t.TeamID
GROUP BY t.TeamName;

SELECT p.Name, SUM(ps.RBIs) AS TotalRBIs
FROM PlayerStats ps
JOIN Person p ON ps.PlayerID = p.PersonID
GROUP BY p.Name
ORDER BY TotalRBIs DESC;

SELECT g.GameID, g.Date, t1.TeamName AS HomeTeam, t2.TeamName AS AwayTeam, g.FinalScore
FROM Game g
JOIN Team t1 ON g.HomeTeamID = t1.TeamID
JOIN Team t2 ON g.AwayTeamID = t2.TeamID;





