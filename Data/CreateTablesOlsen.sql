use MIST353_NFL_RDB_Olsen;

if(OBJECT_ID('ConferenceDivision')is not null)
    drop table ConferenceDivision;
if(OBJECT_ID('TEAM')is not null)
    drop table Team;

create table ConferenceDivision(
    ConferenceDivisionID INT identify(1,1)
        constraint PK_ConferenceDivision PRIMARY KEY,
    Conference NVARCHAR(50) NOT NULL
        constraint CK_ConferenceNames CHECK (Conference IN ('AFC', 'NFC')),
    Division NVARCHAR(50) NOT NULL
        constraint CK_DivisionNames CHECK (Division IN ('East', 'North', 'South', 'West')),
    constraint UK_ConferenceDivision UNIQUE (Conference, Division)
    
);

alter table ConferenceDivision
    ADD CONSTRAINT UQ_ConferenceDivision UNIQUE (Conference, Division);

GO

create TABLE Team (
    TeamID INT identity(1,1)
        constraint PK_Team PRIMARY KEY,
    TeamName NVARCHAR(50) NOT NULL,
    TeamCityState NVARCHAR(50) NOT NULL,
    TeamColors NVARCHAR(50) NOT NULL,
    ConferenceDivisionID INT NOT NULL,
        constraint FK_Team_ConferenceDivision FOREIGN KEY REFERENCES ConferenceDivision(ConferenceDivisionID)
);