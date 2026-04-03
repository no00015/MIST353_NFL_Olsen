from get_db_connection import get_db_connection


def get_teams_by_conference_division(
    conference: str = None,
    division: str = None,
):
    conn = get_db_connection()
    try:
        cursor = conn.cursor()
        cursor.execute("{call dbo.procGetTeamsByConferenceDivision(?, ?)}", (conference, division))
        columns = [column[0] for column in cursor.description]
        rows = cursor.fetchall()
    finally:
        conn.close()

    results = [dict(zip(columns, row)) for row in rows]

    return {"data": results}
