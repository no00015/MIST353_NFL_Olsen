from get_db_connection import get_db_connection


def validate_user(
    email: str,
    password_hash: str,
):
    conn = get_db_connection()
    try:
        cursor = conn.cursor()
        cursor.execute("{call dbo.procValidateUser(?, ?)}", (email, password_hash))
        columns = [column[0] for column in cursor.description]
        rows = cursor.fetchall()
    finally:
        conn.close()

    results = [dict(zip(columns, row)) for row in rows]

    return {"data": results}
