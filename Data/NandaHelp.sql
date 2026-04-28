Select T.TeamID, T.TeamName, T.ConferenceDivisionID
from Team as T
where T.TeamName = 'Pittsburgh Steelers';

Select CD.ConferenceDivisionID, T.TeamID, T.TeamName
From ConferenceDivision as CD
inner join Team as T on CD.ConferenceDivisionID = T.ConferenceDivisionID;

-- Figure out the name of the conference and division for the Pittsburgh Steelers
Select CD.Conference, CD.Division
From ConferenceDivision as CD
inner join Team as T on CD.ConferenceDivisionID = T.ConferenceDivisionID
where T.TeamName = 'Pittsburgh Steelers';

Select CD.Conference, CD.Division
From Team as T
inner join ConferenceDivision as CD on T.ConferenceDivisionID = CD.ConferenceDivisionID
where T.TeamName = 'Pittsburgh Steelers';

--Find teamnames of the other from the AFC NORTH
select T.TeamName
from Team as T
inner join ConferenceDivision as CD on T.ConferenceDivisionID = CD.ConferenceDivisionID
where CD.Conference = 'AFC' and CD.Division = 'North' and T.TeamName != 'Pittsburgh Steelers';