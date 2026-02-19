-- 3 queries
-- 1 each for ConferenceDivision and Team Tables, and 1 join query


select * from Team;

select * from ConferenceDivision
inner join Team on ConferenceDivision.DivisionID = Team.DivisionID;
    