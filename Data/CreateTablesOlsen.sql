IF OBJECT_ID('dbo.FanTeam', 'U') IS NOT NULL
    DROP TABLE dbo.FanTeam;
IF OBJECT_ID('dbo.NFLFan', 'U') IS NOT NULL
    DROP TABLE dbo.NFLFan;
IF OBJECT_ID('dbo.NFLAdmin', 'U') IS NOT NULL
    DROP TABLE dbo.NFLAdmin;
IF OBJECT_ID('dbo.AdminUpdate', 'U') IS NOT NULL
    DROP TABLE dbo.AdminUpdate;
IF OBJECT_ID('dbo.Game', 'U') IS NOT NULL
    DROP TABLE dbo.Game;
IF OBJECT_ID('dbo.TeamStadium', 'U') IS NOT NULL
    DROP TABLE dbo.TeamStadium;
IF OBJECT_ID('dbo.Team', 'U') IS NOT NULL
    DROP TABLE dbo.Team;
IF OBJECT_ID('dbo.Stadium', 'U') IS NOT NULL
    DROP TABLE dbo.Stadium;
IF OBJECT_ID('dbo.ConferenceDivision', 'U') IS NOT NULL
    DROP TABLE dbo.ConferenceDivision;
IF OBJECT_ID('dbo.AppUser', 'U') IS NOT NULL
    DROP TABLE dbo.AppUser;
GO

CREATE TABLE dbo.AppUser(
    AppUserID INT IDENTITY(1,1)
        CONSTRAINT PK_AppUser PRIMARY KEY,
    FirstName NVARCHAR(50) NOT NULL,
    LastName NVARCHAR(50) NOT NULL,
    Email NVARCHAR(100) NOT NULL
        CONSTRAINT UK_AppUser_Email UNIQUE,
    Password NVARCHAR(255) NOT NULL,
    Phone NVARCHAR(20) NULL,
    UserRole NVARCHAR(20) NOT NULL
        CONSTRAINT CK_AppUser_UserRole CHECK (UserRole IN ('NFLAdmin', 'NFLFan'))
);
GO

CREATE TABLE dbo.NFLFan(
    NFLFanID INT
        CONSTRAINT PK_NFLFan PRIMARY KEY
        CONSTRAINT FK_NFLFan_AppUser
            FOREIGN KEY REFERENCES dbo.AppUser(AppUserID)
);
GO

CREATE TABLE dbo.NFLAdmin(
    NFLAdminID INT
        CONSTRAINT PK_NFLAdmin PRIMARY KEY
        CONSTRAINT FK_NFLAdmin_AppUser
            FOREIGN KEY REFERENCES dbo.AppUser(AppUserID)
);
GO

CREATE TABLE dbo.ConferenceDivision(
    ConferenceDivisionID INT IDENTITY(1,1)
        CONSTRAINT PK_ConferenceDivision PRIMARY KEY,
    Conference NVARCHAR(50) NOT NULL
        CONSTRAINT CK_ConferenceDivision_Conference CHECK (Conference IN ('AFC', 'NFC')),
    Division NVARCHAR(50) NOT NULL
        CONSTRAINT CK_ConferenceDivision_Division CHECK (Division IN ('East', 'North', 'South', 'West')),
    CONSTRAINT UK_ConferenceDivision UNIQUE (Conference, Division)
);
GO

CREATE TABLE dbo.Stadium(
    StadiumID INT IDENTITY(1,1)
        CONSTRAINT PK_Stadium PRIMARY KEY,
    StadiumName NVARCHAR(100) NOT NULL,
    StadiumLocation NVARCHAR(100) NOT NULL
);
GO

CREATE TABLE dbo.Team(
    TeamID INT IDENTITY(1,1)
        CONSTRAINT PK_Team PRIMARY KEY,
    TeamName NVARCHAR(50) NOT NULL
        CONSTRAINT UK_Team_TeamName UNIQUE,
    TeamCityState NVARCHAR(50) NOT NULL,
    TeamColors NVARCHAR(100) NOT NULL,
    ConferenceDivisionID INT NOT NULL
        CONSTRAINT FK_Team_ConferenceDivision
            FOREIGN KEY REFERENCES dbo.ConferenceDivision(ConferenceDivisionID)
);
GO

CREATE TABLE dbo.TeamStadium(
    TeamStadiumID INT IDENTITY(1,1)
        CONSTRAINT PK_TeamStadium PRIMARY KEY,
    TeamID INT NOT NULL
        CONSTRAINT FK_TeamStadium_Team
            FOREIGN KEY REFERENCES dbo.Team(TeamID),
    StadiumID INT NOT NULL
        CONSTRAINT FK_TeamStadium_Stadium
            FOREIGN KEY REFERENCES dbo.Stadium(StadiumID),
    StartDate DATE NOT NULL,
    EndDate DATE NULL,
    CONSTRAINT UK_TeamStadium UNIQUE (TeamID, StadiumID, StartDate)
);
GO

CREATE TABLE dbo.Game(
    GameID INT IDENTITY(1,1)
        CONSTRAINT PK_Game PRIMARY KEY,
    GameStartTime DATETIME NOT NULL,
    GameEndTime DATETIME NULL,
    HomeTeamID INT NOT NULL
        CONSTRAINT FK_Game_HomeTeam
            FOREIGN KEY REFERENCES dbo.Team(TeamID),
    AwayTeamID INT NOT NULL
        CONSTRAINT FK_Game_AwayTeam
            FOREIGN KEY REFERENCES dbo.Team(TeamID),
    HomeTeamLocation NVARCHAR(100) NOT NULL,
    HomeTeamScore INT NOT NULL
        CONSTRAINT CK_Game_HomeTeamScore CHECK (HomeTeamScore >= 0),
    AwayTeamScore INT NOT NULL
        CONSTRAINT CK_Game_AwayTeamScore CHECK (AwayTeamScore >= 0),
    StadiumID INT NOT NULL
        CONSTRAINT FK_Game_Stadium
            FOREIGN KEY REFERENCES dbo.Stadium(StadiumID),
    CONSTRAINT CK_Game_DifferentTeams CHECK (HomeTeamID <> AwayTeamID)
);
GO

CREATE TABLE dbo.FanTeam(
    FanTeamID INT IDENTITY(1,1)
        CONSTRAINT PK_FanTeam PRIMARY KEY,
    NFLFanID INT NOT NULL
        CONSTRAINT FK_FanTeam_NFLFan
            FOREIGN KEY REFERENCES dbo.NFLFan(NFLFanID),
    TeamID INT NOT NULL
        CONSTRAINT FK_FanTeam_Team
            FOREIGN KEY REFERENCES dbo.Team(TeamID),
    IsPrimaryTeam BIT NOT NULL
        CONSTRAINT DF_FanTeam_IsPrimaryTeam DEFAULT (0),
    CONSTRAINT UK_FanTeam UNIQUE (NFLFanID, TeamID)
);
GO

CREATE TABLE dbo.AdminUpdate(
    AdminUpdateID INT IDENTITY(1,1)
        CONSTRAINT PK_AdminUpdate PRIMARY KEY,
    UpdateDateTime DATETIME NOT NULL
        CONSTRAINT DF_AdminUpdate_UpdateDateTime DEFAULT (GETDATE()),
    UpdateType NVARCHAR(50) NOT NULL,
    UpdatedValues NVARCHAR(MAX) NOT NULL,
    NFLAdminID INT NOT NULL
        CONSTRAINT FK_AdminUpdate_NFLAdmin
            FOREIGN KEY REFERENCES dbo.NFLAdmin(NFLAdminID)
);
GO
