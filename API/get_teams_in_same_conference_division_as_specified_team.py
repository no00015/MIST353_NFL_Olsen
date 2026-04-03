from get_db_connection import get_db_connection


def get_teams_in_same_conference_division_as_specified_team(
    team_name: str,
):
    conn = get_db_connection()
    try:
        cursor = conn.cursor()
        cursor.execute("{call dbo.procGetTeamsInSameConferenceDivisionAsSpecifiedTeam(?)}", (team_name,))
        columns = [column[0] for column in cursor.description]
        rows = cursor.fetchall()
    finally:
        conn.close()

    results = [dict(zip(columns, row)) for row in rows]

    return {"data": results}
