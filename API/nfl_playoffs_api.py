import pyodbc
from fastapi import FastAPI, HTTPException
from get_teams_by_conference_division import get_teams_by_conference_division
from get_teams_in_same_conference_division_as_specified_team import get_teams_in_same_conference_division_as_specified_team
from validate_user import validate_user

app = FastAPI()


def _handle_database_call(callback):
    try:
        return callback()
    except pyodbc.Error as exc:
        raise HTTPException(status_code=500, detail=str(exc)) from exc

@app.get("/get_teams_by_conference_division/")
def get_teams_by_conference_division_api(conference: str = None, division: str = None):
    return _handle_database_call(
        lambda: get_teams_by_conference_division(conference=conference, division=division)
    )

@app.get("/get_teams_in_same_conference_division_as_specified_team/")
def get_teams_in_same_conference_division_as_specified_team_api(team_name: str):
    return _handle_database_call(
        lambda: get_teams_in_same_conference_division_as_specified_team(team_name=team_name)
    )

@app.get("/validate_user/")
def validate_user_api(email: str, password_hash: str):
    return _handle_database_call(lambda: validate_user(email=email, password_hash=password_hash))
