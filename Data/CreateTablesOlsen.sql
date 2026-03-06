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
if(OBJECT_ID('Game')is not null)
    drop table Game;
if(OBJECT_ID('AdminUpdate')is not null)
    drop table AdminUpdate;
if(OBJECT_ID('FanTeam')is not null)
    drop table FanTeam;


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


create table Stadium(
    StadiumID INT identity(1,1)
        constraint PK_Stadium PRIMARY KEY,
    StadiumName NVARCHAR(100) NOT NULL,
    StadiumLocation NVARCHAR(100) NOT NULL,
    
);

--alter table ConferenceDivision
  --  ADD CONSTRAINT UQ_ConferenceDivision UNIQUE (Conference, Division);

GO

create table Team (
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

create TABLE Game(
    GameID INT identity(1,1)
        constraint PK_Game PRIMARY KEY,
    GameStartTime DATETIME NOT NULL,
    GameEndTime DATETIME NULL,
    HomeTeamID INT NOT NULL
        constraint FK_Game_HomeTeam FOREIGN KEY REFERENCES Team(TeamID),
    AwayTeamID INT NOT NULL
        constraint FK_Game_AwayTeam FOREIGN KEY REFERENCES Team(TeamID),
    HomeTeamLocation NVARCHAR(100) NOT NULL,
    HomeTeamScore INT NOT NULL,
    AwayTeamScore INT NOT NULL,
    StadiumID INT NOT NULL
        constraint FK_Game_Stadium FOREIGN KEY REFERENCES Stadium(StadiumID)
);


create table AdminUpdate(
    AdminUpdateID INT identity(1,1)
        constraint PK_AdminUpdate PRIMARY KEY,
    UpdateDateTime DATETIME NOT NULL,
    UpdateType NVARCHAR(50) NOT NULL,
    UpdatedValues NVARCHAR(MAX) NOT NULL,
    NFLAdminID INT NOT NULL
        constraint FK_AdminUpdate_NFLAdmin
            FOREIGN KEY REFERENCES NFLAdmin(AppUserID)
);

create table FanTeam(
    FanTeamID INT identity(1,1)
        constraint PK_FanTeam PRIMARY KEY,
    NFLFanID INT NOT NULL
        constraint FK_FanTeam_Fan
            FOREIGN KEY REFERENCES NFLFan(NFLFanID),
    TeamID INT NOT NULL
        constraint FK_FanTeam_Team
            FOREIGN KEY REFERENCES Team(TeamID),
);