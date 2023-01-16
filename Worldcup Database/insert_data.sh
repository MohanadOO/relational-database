#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

cat games.csv | while IFS=',' read YEAR ROUND WINNER LOSER WINNER_GOALS LOSER_GOALS

do 
  if [[ $YEAR != "year" ]]
  then
    # Get Team Name
    TEAM_NAME_WINNER=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")
    TEAM_NAME_LOSER=$($PSQL "SELECT team_id FROM teams WHERE name='$LOSER'")

    # If winner not insert
    if [[ -z $TEAM_NAME_WINNER ]]
    then
      # Add Team
      INSERT_TEAM_WINNER=$($PSQL "INSERT INTO teams(name) VALUES('$WINNER')")
      echo Insert into teams, $WINNER
    fi

    # If loser not insert
    if [[ -z $TEAM_NAME_LOSER ]]
    then
      # Add Team
      INSERT_TEAM_LOSER=$($PSQL "INSERT INTO teams(name) VALUES('$LOSER')")
      echo Insert into teams, $LOSER
    fi

    #Get Winner & Loser team ID
    WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")
    OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$LOSER'")

    # Add Games Information
    INSERT_GAME=$($PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES($YEAR, '$ROUND', $WINNER_ID, $OPPONENT_ID, $WINNER_GOALS, $LOSER_GOALS)")
    echo "Add Game Details ($WINNER VS $LOSER) => $WINNER_GOALS - $LOSER_GOALS"
  fi
done  