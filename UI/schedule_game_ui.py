import streamlit as st
from fetch_data import post_data

def schedule_game_ui():
    st.header("Schedule a Game")
    home_team_id = st.number_input("Enter home team ID:", min_value=1)
    away_team_id = st.number_input("Enter away team ID:", min_value=1)
    game_round = st.selectbox("Select game round:", ['Wild Card', 'Divisional', 'Conference', 'Super Bowl'])
    game_date = st.date_input("Select game date:")
    game_time = st.time_input("Select game time:")
    stadium_id = int(input("Enter stadium ID: "))
    nfl_admin_id = int(input("Enter NFL admin ID: "))

    from datetime import datetime
    game_date = datetime.strptime(game_date, "%Y-%m-%d").date()
    game_time = datetime.strptime(game_time, "%H:%M:%S").time()

    if st.button("Schedule Game"):
        result = post_data(
            "schedule_game/",
            {
                "home_team_id": home_team_id,
                "away_team_id": away_team_id,
                "game_round": game_round,
                "game_date": game_date,
                "game_time": game_time,
                "stadium_id": stadium_id,
                "nfl_admin_id": nfl_admin_id
            },
            method = "POST"
        )
        print(result)
