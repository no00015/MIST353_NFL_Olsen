use MIST353_NFL_RDB_Olsen

insert into ConferenceDivision (Conference, Division)
values ('AFC','North'),
        ('AFC','South'),
        ('AFC', 'East'),
        ('AFC','West'),
        ('NFC','North'),
        ('NFC','South'),
        ('NFC','East'),
        ('NFC','West');
GO
select * from ConferenceDivision;

GO
insert into Team(TeamName, TeamCityState, TeamColors, ConferenceDivisionID)
VALUES  ('Baltimore Ravens', 'Baltimore, Maryland', 'Purple, Black, Metallic Gold', 1),
        ('Cincinnati Bengals', 'Cincinnati, Ohio', 'Black, Orange, White', 1),
        ('Cleveland Browns', 'Cleveland, Ohio', 'Brown, Orange, White', 1),
        ('Pittsburgh Steelers', 'Pittsburgh, Pennsylvania', 'Black, Gold, White', 1),
        
        ('Houston Texans', 'Houston, Texas', 'Deep Steel Blue, Battle Red, Liberty White', 2),
        ('Indianapolis Colts', 'Indianapolis, Indiana', 'Speed Blue, White', 2),
        ('Jacksonville Jaguars', 'Jacksonville, Florida', 'Teal, Black, Gold, White', 2),
        ('Tennessee Titans', 'Nashville, Tennessee', 'Titans Navy, Titans Light Blue, Titans Red, Titans Silver', 2),
        
        ('Buffalo Bills', 'Buffalo, New York', 'Royal Blue, Red, White', 3),
        ('Miami Dolphins', 'Miami Gardens, Florida', 'Aqua Green, Orange Coral Red, White', 3),
        ('New England Patriots','Foxborough, Massachusetts','Navy Blue, Red, Silver, White','3'),
        ('New York Jets','East Rutherford, New Jersey','Hunter Green, White','3'),

        ('Denver Broncos','Denver, Colorado','Orange, Navy Blue, White',4),
        ('Kansas City Chiefs','Kansas City, Missouri','Red, Gold, White',4),
        ('Las Vegas Raiders','Las Vegas, Nevada','Silver, Black, White',4),
        ('Los Angeles Chargers','Los Angeles, California','Powder Blue, Sunshine Gold, White',4),

        ('Chicago Bears','Chicago, Illinois','Navy Blue, Orange, White',5),
        ('Detroit Lions','Detroit, Michigan','Honolulu Blue, Silver, White',5),
        ('Green Bay Packers','Green Bay, Wisconsin','Dark Green, Gold, White',5),
        ('Minnesota Vikings','Minneapolis, Minnesota','Purple, Gold, White',5),

        ('Atlanta Falcons','Atlanta, Georgia','Red, Black, Silver, White',6),
        ('Carolina Panthers','Charlotte, North Carolina','Black, Panther Blue, Silver, White',6),
        ('New Orleans Saints','New Orleans, Louisiana','Black, Gold, White',6),
        ('Tampa Bay Buccaneers','Tampa, Florida','Red, Pewter, Black, White',6),

        ('Washington Commanders','Landover, Maryland','Burgundy, Gold, White',6),
        ('New York Giants','East Rutherford, New Jersey','Royal Blue, Red, White',6),
        ('Philadelphia Eagles','Philadelphia, Pennsylvania','Midnight Green, Silver, White',6),
        ('Dallas Cowboys','Arlington, Texas','Navy Blue, Silver, White',6),

        ('San Francisco 49ers','San Francisco, California','Scarlet, Gold, White',6),
        ('Seattle Seahawks','Seattle, Washington','College Navy, Action Green, White',6),
        ('Arizona Cardinals','Glendale, Arizona','Cardinal Red, White, Black',6),
        ('Los Angeles Rams','Inglewood, California','Royal Blue, Sol, Yellow, White',6);

        GO
        select * from Team order by TeamID;