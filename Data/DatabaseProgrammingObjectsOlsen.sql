

go


create or alter procedure procGetTeamsByConferenceDivision
(
    @ConferenceName NVARCHAR(50) = null,
    @DivisionName NVARCHAR(50) = null
)
AS
begin
    select TeamName, TeamColors, Conference, Division
    from Team T inner join ConferenceDivision C
        on T.ConferenceDivisionID = C.ConferenceDivisionID
    where Conference = IsNull(@ConferenceName, Conference)
        and Division = IsNull(@DivisionName, Division)
end



go

create OR alter procedure procGetTeamsInSameConferenceDivisionAsSpecifiedTeam
(
    @TeamName NVARCHAR(50)
)
AS
BEGIN
    select OtherTeam.TeamName, CD.Conference, CD.Division
    from Team MyTeam inner join Team OtherTeam
        on MyTeam.ConferenceDivisionID = OtherTeam.ConferenceDivisionID
        inner join ConferenceDivision CD
        on MyTeam.ConferenceDivisionID = CD.ConferenceDivisionID
    where MyTeam.TeamName = @TeamName and
        OtherTeam.TeamName != @TeamName;
END

GO

create or alter procedure procValidateUser
(
    @Email NVARCHAR(100),
    @PasswordHash NVARCHAR(200)
)
AS
BEGIN
    select AppUserID, Firstname + ' ' + Lastname as Fullname, UserRole
    from AppUser
    where Email = @Email and 
    PasswordHash = Convert(VARBINARY(200), @PasswordHash, 1);
END


GO

create or alter procedure procGetTeamsForSpecifiedFan
(
    @NFLFanID INT
)
AS
BEGIN
    select T.TeamName, CD.Conference, CD.Division, T.TeamColors, FT.PrimaryTeam
    from FanTeam FT inner join Team T
        on FT.TeamID = T.TeamID
        inner join ConferenceDivision CD
        on T.ConferenceDivisionID = CD.ConferenceDivisionID
    where FT.NFLFanID = @NFLFanID;
end;


go

create or alter procedure procScheduleGame
(
    @HomeTeamID INT,
    @AwayTeamID INT,
    @GameRound NVARCHAR(50),
    @GameDate DATE,
    @GameStartTime TIME,
    @StadiumID INT,
    @NFLAdminID INT 
)
AS
BEGIN
    declare @context VARBINARY(128) = cast(@NFLAdminID as VARBINARY(128)); 
    SET context_info @context;

    insert into Game (HomeTeamID, AwayTeamID, GameRound, GameDate, GameStartTime, StadiumID)
    values (@HomeTeamID, @AwayTeamID, @GameRound, @GameDate, @GameStartTime, @StadiumID);
END



go


create or alter trigger trgTrackChangesOnSchedulingGame
on Game
after insert
as
BEGIN
    declare @NFLAdminID INT;
    declare @GameID INT;
    declare @ChangeType NVARCHAR(50);
    declare @ChangeDescription NVARCHAR(500);
    declare @GameRound NVARCHAR(50);
    declare @GameDate DATE;
    declare @GameStartTime TIME;
    declare @HomeTeamID INT;
    declare @AwayTeamID INT;
    declare @HomeTeamName NVARCHAR(50);
    declare @AwayTeamName NVARCHAR(50);
    declare @StadiumID INT;
    declare @StadiumName NVARCHAR(100);
    declare @AdminFullName NVARCHAR(100);

    set @NFLAdminID = convert(int, convert(binary(4),context_info()));

    select @GameID = GameID, @GameRound = GameRound, @GameDate = GameDate, @GameStartTime = GameStartTime, 
        @HomeTeamID = HomeTeamID, @AwayTeamID = AwayTeamID, @StadiumID = StadiumID
    from inserted;
    select @HomeTeamName = TeamName from Team where TeamID = @HomeTeamID;
    select @AwayTeamName = TeamName from Team where TeamID = @AwayTeamID;
    select @StadiumName = StadiumName from Stadium where StadiumID = @StadiumID;
    select @AdminFullName = Firstname + ' ' + Lastname from AppUser where AppUserID = @NFLAdminID;

    set @ChangeType = 'Insert';
    set @ChangeDescription = @AdminFullName + ' scheduled a new game with GameID ' + cast(@GameID as NVARCHAR(50))
        + ': ' + @HomeTeamName + ' vs ' + @AwayTeamName + ' on ' + cast(@GameDate as NVARCHAR(50)) 
        + ' at ' + cast(@GameStartTime as NVARCHAR(50)) + ' in stadium  ' + @StadiumName
        + '. Game round: ' + @GameRound;

    insert into AdminChangesTracker (NFLAdminID, GameID, ChangeType, ChangeDescription)
    values (@NFLAdminID, @GameID, @ChangeType, @ChangeDescription);
END