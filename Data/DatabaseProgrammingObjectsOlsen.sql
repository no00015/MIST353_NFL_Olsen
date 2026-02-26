-- 3 queries
-- 1 each for ConferenceDivision and Team Tables, and 1 join query

Use

GO

create or alter procedure procGetTeamsByConferenceDiviision
(
    @ConfereceName nvarchar(50) = null,
    @DivisionName nvarchar(50) = null
)

AS
BEGIN
    Select TeamName, TeamColors, Conference, DivisionName
    from Team T
    inner join ConferenceDivision as CD 
        on T.ConferenceDivisionID = CD.ConferenceDivisionID
    where Conference = IsNull(@ConferenceName, Conference)
      and Division = IsNull(@DivisionName, Division)

     -- This code above filters our results to show teams with their colors, conferences, and division names
end

GO

declare @myTeamName nvarchar(50) = 'New York Giants';


select OtherTeam.TeamName
from Team MyTeam 
inner join Team OtherTeam on MyTeam.ConferenceDivisionID = OtherTeam.ConferenceDivisionID
where MyTeam.TeamName = @myTeamName
    and OtherTeam.TeamName != @myTeamName;
    -- This shows our team and its division rivals.
