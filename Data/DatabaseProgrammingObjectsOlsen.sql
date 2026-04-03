GO

CREATE OR ALTER PROCEDURE dbo.procGetTeamsByConferenceDivision
(
    @ConferenceName NVARCHAR(50) = NULL,
    @DivisionName NVARCHAR(50) = NULL
)
AS
BEGIN
    SELECT
        t.TeamName,
        t.TeamCityState,
        t.TeamColors,
        cd.Conference,
        cd.Division
    FROM dbo.Team AS t
    INNER JOIN dbo.ConferenceDivision AS cd
        ON t.ConferenceDivisionID = cd.ConferenceDivisionID
    WHERE cd.Conference = ISNULL(@ConferenceName, cd.Conference)
      AND cd.Division = ISNULL(@DivisionName, cd.Division)
    ORDER BY cd.Conference, cd.Division, t.TeamName;
END
GO

CREATE OR ALTER PROCEDURE dbo.procGetTeamsInSameConferenceDivisionAsSpecifiedTeam
(
    @TeamName NVARCHAR(50)
)
AS
BEGIN
    SELECT
        peer.TeamName,
        peer.TeamCityState,
        peer.TeamColors,
        cd.Conference,
        cd.Division
    FROM dbo.Team AS chosen
    INNER JOIN dbo.Team AS peer
        ON chosen.ConferenceDivisionID = peer.ConferenceDivisionID
    INNER JOIN dbo.ConferenceDivision AS cd
        ON peer.ConferenceDivisionID = cd.ConferenceDivisionID
    WHERE chosen.TeamName = @TeamName
      AND peer.TeamName <> @TeamName
    ORDER BY peer.TeamName;
END
GO

CREATE OR ALTER PROCEDURE dbo.procValidateUser
(
    @Email NVARCHAR(100),
    @Password NVARCHAR(255)
)
AS
BEGIN
    SELECT
        AppUserID,
        FirstName + ' ' + LastName AS FullName,
        UserRole
    FROM dbo.AppUser
    WHERE Email = @Email
      AND Password = @Password;
END
GO
