INSERT INTO dbo.ConferenceDivision (Conference, Division)
VALUES
    ('AFC', 'North'),
    ('AFC', 'South'),
    ('AFC', 'East'),
    ('AFC', 'West'),
    ('NFC', 'North'),
    ('NFC', 'South'),
    ('NFC', 'East'),
    ('NFC', 'West');
GO

INSERT INTO dbo.Stadium (StadiumName, StadiumLocation)
VALUES
    ('M&T Bank Stadium', 'Baltimore, Maryland'),
    ('Paycor Stadium', 'Cincinnati, Ohio'),
    ('Huntington Bank Field', 'Cleveland, Ohio'),
    ('Acrisure Stadium', 'Pittsburgh, Pennsylvania'),
    ('NRG Stadium', 'Houston, Texas'),
    ('Lucas Oil Stadium', 'Indianapolis, Indiana'),
    ('EverBank Stadium', 'Jacksonville, Florida'),
    ('Nissan Stadium', 'Nashville, Tennessee'),
    ('Highmark Stadium', 'Orchard Park, New York'),
    ('Hard Rock Stadium', 'Miami Gardens, Florida'),
    ('Gillette Stadium', 'Foxborough, Massachusetts'),
    ('MetLife Stadium', 'East Rutherford, New Jersey'),
    ('Empower Field at Mile High', 'Denver, Colorado'),
    ('GEHA Field at Arrowhead Stadium', 'Kansas City, Missouri'),
    ('Allegiant Stadium', 'Las Vegas, Nevada'),
    ('SoFi Stadium', 'Inglewood, California'),
    ('Soldier Field', 'Chicago, Illinois'),
    ('Ford Field', 'Detroit, Michigan'),
    ('Lambeau Field', 'Green Bay, Wisconsin'),
    ('U.S. Bank Stadium', 'Minneapolis, Minnesota'),
    ('Mercedes-Benz Stadium', 'Atlanta, Georgia'),
    ('Bank of America Stadium', 'Charlotte, North Carolina'),
    ('Caesars Superdome', 'New Orleans, Louisiana'),
    ('Raymond James Stadium', 'Tampa, Florida'),
    ('AT&T Stadium', 'Arlington, Texas'),
    ('Lincoln Financial Field', 'Philadelphia, Pennsylvania'),
    ('Northwest Stadium', 'Landover, Maryland'),
    ('State Farm Stadium', 'Glendale, Arizona'),
    ('Lumen Field', 'Seattle, Washington'),
    ('Levis Stadium', 'Santa Clara, California');
GO

INSERT INTO dbo.Team (TeamName, TeamCityState, TeamColors, ConferenceDivisionID)
VALUES
    ('Baltimore Ravens', 'Baltimore, Maryland', 'Purple, Black, Metallic Gold', 1),
    ('Cincinnati Bengals', 'Cincinnati, Ohio', 'Black, Orange, White', 1),
    ('Cleveland Browns', 'Cleveland, Ohio', 'Brown, Orange, White', 1),
    ('Pittsburgh Steelers', 'Pittsburgh, Pennsylvania', 'Black, Gold, White', 1),
    ('Houston Texans', 'Houston, Texas', 'Deep Steel Blue, Battle Red, Liberty White', 2),
    ('Indianapolis Colts', 'Indianapolis, Indiana', 'Speed Blue, White', 2),
    ('Jacksonville Jaguars', 'Jacksonville, Florida', 'Teal, Black, Gold, White', 2),
    ('Tennessee Titans', 'Nashville, Tennessee', 'Titans Navy, Titans Light Blue, Titans Red, Titans Silver', 2),
    ('Buffalo Bills', 'Buffalo, New York', 'Royal Blue, Red, White', 3),
    ('Miami Dolphins', 'Miami Gardens, Florida', 'Aqua, Orange, White', 3),
    ('New England Patriots', 'Foxborough, Massachusetts', 'Navy, Red, Silver, White', 3),
    ('New York Jets', 'East Rutherford, New Jersey', 'Green, White, Black', 3),
    ('Denver Broncos', 'Denver, Colorado', 'Orange, Navy Blue, White', 4),
    ('Kansas City Chiefs', 'Kansas City, Missouri', 'Red, Gold, White', 4),
    ('Las Vegas Raiders', 'Las Vegas, Nevada', 'Silver, Black, White', 4),
    ('Los Angeles Chargers', 'Inglewood, California', 'Powder Blue, Gold, White', 4),
    ('Chicago Bears', 'Chicago, Illinois', 'Navy Blue, Orange, White', 5),
    ('Detroit Lions', 'Detroit, Michigan', 'Honolulu Blue, Silver, White', 5),
    ('Green Bay Packers', 'Green Bay, Wisconsin', 'Dark Green, Gold, White', 5),
    ('Minnesota Vikings', 'Minneapolis, Minnesota', 'Purple, Gold, White', 5),
    ('Atlanta Falcons', 'Atlanta, Georgia', 'Red, Black, Silver, White', 6),
    ('Carolina Panthers', 'Charlotte, North Carolina', 'Black, Blue, Silver, White', 6),
    ('New Orleans Saints', 'New Orleans, Louisiana', 'Black, Gold, White', 6),
    ('Tampa Bay Buccaneers', 'Tampa, Florida', 'Red, Pewter, Black, White', 6),
    ('Dallas Cowboys', 'Arlington, Texas', 'Navy Blue, Silver, White', 7),
    ('New York Giants', 'East Rutherford, New Jersey', 'Royal Blue, Red, White', 7),
    ('Philadelphia Eagles', 'Philadelphia, Pennsylvania', 'Midnight Green, Silver, White', 7),
    ('Washington Commanders', 'Landover, Maryland', 'Burgundy, Gold, White', 7),
    ('Arizona Cardinals', 'Glendale, Arizona', 'Cardinal Red, White, Black', 8),
    ('Los Angeles Rams', 'Inglewood, California', 'Royal Blue, Sol, Yellow, White', 8),
    ('San Francisco 49ers', 'Santa Clara, California', 'Scarlet, Gold, White', 8),
    ('Seattle Seahawks', 'Seattle, Washington', 'College Navy, Action Green, White', 8);
GO

INSERT INTO dbo.TeamStadium (TeamID, StadiumID, StartDate, EndDate)
VALUES
    (1, 1, '1998-09-06', NULL),
    (2, 2, '2000-08-19', NULL),
    (3, 3, '1999-09-12', NULL),
    (4, 4, '2001-09-16', NULL),
    (5, 5, '2002-08-24', NULL),
    (6, 6, '2008-08-24', NULL),
    (7, 7, '1995-08-18', NULL),
    (8, 8, '1999-08-27', NULL),
    (9, 9, '1973-08-17', NULL),
    (10, 10, '1987-08-16', NULL),
    (11, 11, '2002-05-11', NULL),
    (12, 12, '1984-09-01', NULL),
    (13, 13, '2001-08-11', NULL),
    (14, 14, '1972-08-12', NULL),
    (15, 15, '2020-07-31', NULL),
    (16, 16, '2020-09-13', NULL),
    (17, 17, '1924-11-09', NULL),
    (18, 18, '2002-08-24', NULL),
    (19, 19, '1957-09-29', NULL),
    (20, 20, '2016-07-22', NULL),
    (21, 21, '2017-08-26', NULL),
    (22, 22, '1996-08-14', NULL),
    (23, 23, '1975-08-03', NULL),
    (24, 24, '1998-09-20', NULL),
    (25, 25, '2009-05-27', NULL),
    (26, 12, '1976-09-12', NULL),
    (27, 26, '2003-08-03', NULL),
    (28, 27, '1997-09-14', NULL),
    (29, 28, '2006-08-12', NULL),
    (30, 16, '2016-08-14', NULL),
    (31, 30, '2014-07-17', NULL),
    (32, 29, '2002-08-15', NULL);
GO

INSERT INTO dbo.AppUser (FirstName, LastName, Email, Password, Phone, UserRole)
VALUES
    ('Nate', 'Olsen', 'nate.olsen@example.com', 'GiantsFan99', '555-1100', 'NFLFan'),
    ('Sarah', 'Mitchell', 'sarah.mitchell@example.com', 'BillsBacker22', '555-1101', 'NFLFan'),
    ('Chris', 'Daniels', 'chris.daniels@example.com', 'ChiefsKingdom', '555-1102', 'NFLFan'),
    ('Maya', 'Brooks', 'maya.brooks@example.com', 'FlyEaglesFly', '555-1103', 'NFLFan'),
    ('Jordan', 'Lee', 'jordan.lee@example.com', '49ersGoldRush', '555-1104', 'NFLFan'),
    ('Alex', 'Rivera', 'alex.rivera@example.com', 'AdminSecure1', '555-2200', 'NFLAdmin'),
    ('Taylor', 'Morgan', 'taylor.morgan@example.com', 'AdminSecure2', '555-2201', 'NFLAdmin'),
    ('Casey', 'Parker', 'casey.parker@example.com', 'AdminSecure3', '555-2202', 'NFLAdmin');
GO

INSERT INTO dbo.NFLFan (NFLFanID)
VALUES
    (1),
    (2),
    (3),
    (4),
    (5);
GO

INSERT INTO dbo.NFLAdmin (NFLAdminID)
VALUES
    (6),
    (7),
    (8);
GO

INSERT INTO dbo.FanTeam (NFLFanID, TeamID, IsPrimaryTeam)
VALUES
    (1, 26, 1),
    (1, 9, 0),
    (2, 9, 1),
    (2, 24, 0),
    (3, 14, 1),
    (3, 31, 0),
    (4, 27, 1),
    (4, 18, 0),
    (5, 31, 1),
    (5, 30, 0);
GO

INSERT INTO dbo.Game (
    GameStartTime,
    GameEndTime,
    HomeTeamID,
    AwayTeamID,
    HomeTeamLocation,
    HomeTeamScore,
    AwayTeamScore,
    StadiumID
)
VALUES
    ('2025-09-07T13:00:00', '2025-09-07T16:10:00', 1, 2, 'Baltimore, Maryland', 27, 20, 1),
    ('2025-09-07T16:25:00', '2025-09-07T19:35:00', 14, 16, 'Kansas City, Missouri', 31, 24, 14),
    ('2025-09-08T20:15:00', '2025-09-08T23:15:00', 26, 25, 'East Rutherford, New Jersey', 21, 17, 12),
    ('2025-09-14T13:00:00', '2025-09-14T16:12:00', 27, 28, 'Philadelphia, Pennsylvania', 28, 13, 26),
    ('2025-09-14T16:05:00', '2025-09-14T19:09:00', 31, 32, 'Santa Clara, California', 24, 21, 30),
    ('2025-09-15T20:20:00', '2025-09-15T23:28:00', 24, 23, 'Tampa, Florida', 17, 14, 24);
GO

INSERT INTO dbo.AdminUpdate (UpdateDateTime, UpdateType, UpdatedValues, NFLAdminID)
VALUES
    ('2025-08-20T09:00:00', 'Schedule Load', 'Inserted opening-week sample games for the 2025 season.', 6),
    ('2025-08-21T14:30:00', 'Roster Note', 'Updated sample fan-team preferences and primary team flags.', 7),
    ('2025-08-22T10:15:00', 'Venue Audit', 'Validated active stadium assignments for all seeded teams.', 8);
GO

SELECT * FROM dbo.ConferenceDivision ORDER BY ConferenceDivisionID;
SELECT * FROM dbo.Team ORDER BY TeamID;
SELECT * FROM dbo.Stadium ORDER BY StadiumID;
SELECT * FROM dbo.AppUser ORDER BY AppUserID;
SELECT * FROM dbo.NFLFan ORDER BY NFLFanID;
SELECT * FROM dbo.NFLAdmin ORDER BY NFLAdminID;
SELECT * FROM dbo.FanTeam ORDER BY FanTeamID;
SELECT * FROM dbo.Game ORDER BY GameID;
SELECT * FROM dbo.AdminUpdate ORDER BY AdminUpdateID;
