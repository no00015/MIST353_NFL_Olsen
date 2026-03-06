use [mist353-nfl-rdb-olsen];



if(OBJECT_ID('ConferenceDivision')is not null)
    drop table ConferenceDivision;
if(OBJECT_ID('Team')is not null)
    drop table Team;
if(OBJECT_ID('AppUser')is not null)
    drop table AppUser;
if(OBJECT_ID('Stadium')is not null)
    drop table Stadium;
if(OBJECT_ID('TeamStadium')is not null)
    drop table TeamStadium;

create table AppUser(
    AppUserID INT identity(1,1)
        constraint PK_AppUser PRIMARY KEY,
    FirstName NVARCHAR(50) NOT NULL,
    LastName NVARCHAR(50) NOT NULL,
    Email NVARCHAR(100) NOT NULL
        constraint UK_AppUser_Email UNIQUE,
    Password NVARCHAR(255) NOT NULL,
    Phone NVARCHAR(20) NULL,
    UserRole NVARCHAR(20) NOT NULL
        constraint UserRole CHECK (UserRole IN ('Admin','Fan'))
);

create table ConferenceDivision(
    ConferenceDivisionID INT identity(1,1)
        constraint PK_ConferenceDivision PRIMARY KEY,
    Conference NVARCHAR(50) NOT NULL,
        constraint CK_ConferenceNames CHECK (Conference IN ('AFC', 'NFC')),
    Division NVARCHAR(50) NOT NULL,
        constraint CK_DivisionNames CHECK (Division IN ('East', 'North', 'South', 'West')),
    constraint UK_ConferenceDivision UNIQUE (Conference, Division),
    
);


create TABLE Stadium(
    StadiumID INT identity(1,1)
        constraint PK_Stadium PRIMARY KEY,
    StadiumName NVARCHAR(100) NOT NULL,
    StadiumLocation NVARCHAR(100) NOT NULL,
    
);

--alter table ConferenceDivision
  --  ADD CONSTRAINT UQ_ConferenceDivision UNIQUE (Conference, Division);

GO

create TABLE Team (
    TeamID INT identity(1,1)
        constraint PK_Team PRIMARY KEY,
    TeamName NVARCHAR(50) NOT NULL,
    TeamCityState NVARCHAR(50) NOT NULL,
    TeamColors NVARCHAR(50) NOT NULL,
    ConferenceDivisionID INT NOT NULL
        constraint FK_Team_ConferenceDivision FOREIGN KEY REFERENCES ConferenceDivision(ConferenceDivisionID)
);

create TABLE TeamStadium(
    TeamStadiumID INT identity(1,1)
        constraint PK_TeamStadium PRIMARY KEY,
    TeamID INT NOT NULL
        constraint FK_TeamStadium_Team FOREIGN KEY REFERENCES Team(TeamID),
    StadiumID INT NOT NULL
        constraint FK_TeamStadium_Stadium FOREIGN KEY REFERENCES Stadium(StadiumID),
    StartDate DATE NOT NULL,
    EndDate DATE NOT NULL
);